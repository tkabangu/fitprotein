<?php

namespace App\Controller;


use App\Entity\Contact;
use App\Form\Type\ContactType;
use App\Notification\ContactNotification;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;


class ContactController extends AbstractController
{
    /**
     * @var ObjectManager
     */
//    private $objectManager;
//
//    public function __construct(ObjectManager $objectManager)
//    {
//        $this->objectManager = $objectManager;
//    }

    /**
     * @Route("/contact", name="contact")
     */
    public function contact(Request $request, ContactNotification $contactNotification)
    {
        $contact = new Contact();
        $form = $this->createForm(ContactType::class, $contact);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $contact = $form->getData();

            $contactNotification->Notifiy($contact);
            $contact->setSendedAt(new \DateTime());

//            $this->objectManager->persist($contact);
//            $this->objectManager->flush();
            $this->addFlash('success', 'L\'email a bien été envoyé.');
//            return $this->redirectToRoute('contact_success');
        }

        return $this->render(
            'contact/index.html.twig',
            [
                'form' => $form->createView(),
            ]
        );
    }
}







