<?php


namespace App\Controller\Admin;


use App\Entity\Contact;
use App\Repository\ContactRepository;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AdminContactController extends AbstractController
{
    /**
     * @var ContactRepository
     */
    private $repository;

    /**
     * @var EntityManagerInterface
     * @ORM\Column(type="string")
     */
    private $am;

    /**
     * ContactController constructor.
     * @param ContactRepository $repository
     * @param EntityManagerInterface $am
     */
    public function __construct(ContactRepository $repository, EntityManagerInterface $am)
    {
        $this->repository = $repository;
        $this->am = $am;
    }

    /**
     * @Route("/admin", name="admin.Contact.index")
     * @return Response
     */
    public function index()
    {
        $product = $this->repository->findAll();
        return $this->render('admin/contact/index.html.twig', compact('contacts'));
    }

    /**
     * @Route("/admin/contact/create", name="admin.contact.new")
     * @param $request
     * @return Response
     */
    public function new(Request $request)
    {
        $contact = new Contact();
        $form = $this->createForm(ContactType::class, $contact);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()){
            $this->am->persist($contact);
            $this->am->flush();
            $this->addFlash('success', 'Création avec succès');
            return $this->redirectToRoute('admin.contact.index');
        }

        return $this->render('admin/contact/new.html.twig', [
            'contact' => $contact,
            'form' => $form->createView()

        ]);
    }

    /**
     * @Route("/admin/contact/{id}", name="admin.contact.edit", methods="GET|POST")
     * @param Contact $contact
     * @param Request $request
     * @return Response
     */
    public function edit(Contact $contact, Request $request)
    {
        $form = $this->createForm(ContactType::class, $contact);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()){
            $this->em->flush();
            $this->addFlash('success', 'Modifié avec succès');
            return $this->redirectToRoute('admin.contact.index');

        }
        return $this->render('admin/contact/edit.html.twig', [
            'contact' => $contact,
            'form' => $form->createView()
        ]);
    }

    /**
     * @Route("/admin/contact/{id}", name="admin.contact.delete" methods="DELETE")
     * @param Contact $contact
     * @param Request $request
     * @return RedirectResponse
     */
    public function delete(Contact $contact, Request $request)
    {
        if ($this->isCsrfTokenValid('delete' . $contact->getId(), $request->get('_token'))) {
            $this->am->remove($contact);
            $this->am->flush();
            $this->addFlash('success', 'Supprimé avec succès');
        }
        return $this->redirectToRoute('admin.contact.index');

    }

}

