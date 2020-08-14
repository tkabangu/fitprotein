<?php


namespace App\Controller\Admin;



use App\Entity\Opinion;
use App\Repository\OpinionRepository;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AdminOpinionController extends AbstractController
{
    /**
     * @var OpinionRepository
     */
    private $repository;

    /**
     * @var EntityManagerInterface
     * @ORM\Column(type="string")
     */
    private $im;

    /**
     * OpinionController constructor.
     * @param OpinionRepository $repository
     * @param EntityManagerInterface $im
     */
    public function __construct(OpinionRepository $repository, EntityManagerInterface $im)
    {
        $this->repository = $repository;
        $this->im = $im;
    }

    /**
     * @Route("/admin", name="admin.opinion.index")
     * @return Response
     */
    public function index()
    {
        $product = $this->repository->findAll();
        return $this->render('admin/opinion/index.html.twig', compact('opinions'));
    }

    /**
     * @Route("/admin/opinion/create", name="admin.opinion.new")
     * @param $request
     * @return Response
     */
    public function new(Request $request)
    {
        $opinion = new Opinion();
        $form = $this->createForm(OpinionType::class, $opinion);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()){
            $this->im->persist($opinion);
            $this->im->flush();
            $this->addFlash('success', 'Création avec succès');
            return $this->redirectToRoute('admin.opinion.index');
        }

        return $this->render('admin/opinion/new.html.twig', [
            'opinion' => $opinion,
            'form' => $form->createView()

        ]);
    }

    /**
     * @Route("/admin/opinion/{id}", name="admin.opinion.edit", methods="GET|POST")
     * @param Opinion $opinion
     * @param Request $request
     * @return Response
     */
    public function edit(Opinion $opinion, Request $request)
    {
        $form = $this->createForm(OpinionType::class, $opinion);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()){
            $this->im->flush();
            $this->addFlash('success', 'Modifié avec succès');
            return $this->redirectToRoute('admin.opinion.index');

        }
        return $this->render('admin/opinion/edit.html.twig', [
            'opinion' => $opinion,
            'form' => $form->createView()
        ]);
    }

    /**
     * @Route("/admin/opinion/{id}", name="admin.opinion.delete" methods="DELETE")
     * @param Opinion $opinion
     * @param Request $request
     * @return RedirectResponse
     */
    public function delete(Opinion $opinion, Request $request)
    {
        if ($this->isCsrfTokenValid('delete' . $opinion->getId(), $request->get('_token'))) {
            $this->im->remove($opinion);
            $this->im->flush();
            $this->addFlash('success', 'Supprimé avec succès');
        }
        return $this->redirectToRoute('admin.opinion.index');

    }

}

