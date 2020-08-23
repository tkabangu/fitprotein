<?php

namespace App\Controller;

use App\Entity\Contact;
use App\Form\Type\ContactType;
use App\Notification\ContactNotification;
use Doctrine\Common\Persistence\ManagerRegistry;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ContactController extends AbstractController
{
	/**
	 * @var EntityManagerInterface
	 */
	private $entityManager;

	public function __construct(EntityManagerInterface $entityManager)
	{
		$this->entityManager = $entityManager;
	}

	/**
	 * @Route("/contact", name="contact_index")
	 * @param Request $request
	 * @param ContactNotification $contactNotification
	 * @return Response
	 */
    public function index(Request $request, ContactNotification $contactNotification)
    {
		$contact = new Contact();
		$form = $this->createForm(ContactType::class, $contact);
		$form->handleRequest($request);

		if ($form->isSubmitted() && $form->isValid()) {
			$contact = $form->getData();

//			$contactNotification->Notifiy($contact);
			$contact->setSendedAt(new \DateTime());

            $this->entityManager->persist($contact);
            $this->entityManager->flush();
			$this->addFlash('success', 'L\'email a bien été envoyé.');
		}

		return $this->render(
			'contact/index.html.twig',
			[
				'form' => $form->createView(),
			]
		);
    }
}
