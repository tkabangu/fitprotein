<?php


namespace App\Controller\Admin;


use App\Entity\PromoCode;
use App\Repository\PromoCodeRepository;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AdminPromoCodeController extends AbstractController
{
    /**
     * @var PromoCodeRepository
     */
    private $repository;

    /**
     * @var EntityManagerInterface
     * @ORM\Column(type="string")
     */
    private $ym;

    /**
     * PromoCodeController constructor.
     * @param PromoCodeRepository $repository
     * @param EntityManagerInterface $ym
     */
    public function __construct(PromoCodeRepository $repository, EntityManagerInterface $ym)
    {
        $this->repository = $repository;
        $this->ym = $ym;
    }

    /**
     * @Route("/admin/promoCodes", name="admin.promoCode.index")
     * @return Response
     */
    public function index()
    {
        $promoCode = $this->repository->findAll();
        return $this->render('admin/promoCode/index.html.twig', ['promoCodes' => compact($promoCode)]);
    }

    /**
     * @Route("/admin/promoCode/create", name="admin.promoCode.new")
     * @param $request
     * @return Response
     */
    public function new(Request $request)
    {
        $promoCode = new PromoCode();
        $form = $this->createForm(PromoCodeType::class, $promoCode);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->ym->persist($promoCode);
            $this->ym->flush();
            $this->addFlash('success', 'Création avec succès');
            return $this->redirectToRoute('admin.promoCode.index');
        }

        return $this->render('admin/promoCode/new.html.twig', [
            'promoCode' => $promoCode,
            'form' => $form->createView()

        ]);
    }

    /**
     * @Route("/admin/promoCode/{id}", name="admin.promoCode.edit", methods="GET|POST")
     * @param PromoCode $promoCode
     * @param Request $request
     * @return Response
     */
    public function edit(PromoCode $promoCode, Request $request)
    {
        $form = $this->createForm(PromoCodeType::class, $promoCode);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->im->flush();
            $this->addFlash('success', 'Modifié avec succès');
            return $this->redirectToRoute('admin.opinion.index');

        }
        return $this->render('admin/promoCode/edit.html.twig', [
            'promoCode' => $promoCode,
            'form' => $form->createView()
        ]);
    }

    /**
     * @Route("/admin/promoCode/{id}", name="admin.promoCode.delete", methods="DELETE")
     * @param PromoCode $promoCode
     * @param Request $request
     * @return RedirectResponse
     */
    public function delete(PromoCode $promoCode, Request $request)
    {
        if ($this->isCsrfTokenValid('delete' . $promoCode->getId(), $request->get('_token'))) {
            $this->ym->remove($promoCode);
            $this->ym->flush();
            $this->addFlash('success', 'Supprimé avec succès');
        }
        return $this->redirectToRoute('admin.promoCode.index');

    }

}

