<?php

namespace App\Controller;


use App\Entity\Contact;
use App\Form\Type\ContactType;
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
     * @Route("/contact", name="contact")
     */
    public function contact(Request $request)
    {

//
//        if (!is_nul($this->getUser())) {
//            $form->get('nom')->setData($this->getUser());
//            $form->get('prenom')->setData($this->getUser());
//            $form->get('sujet')->setData($this->getUser());
//            $form->get('email')->setData($this->getUser()->email);
//        }
//        $form->handleRequest($request);
//
//        if ($form->isSubmitted())
//            if($form->isValid()) {
//                $data = $form->getData();
//
//                $mail = new Email();
//
//                $mailBody = renderView(
//                    'contact/index.html.twig',
//                    [
//                        'data' => $data
//                    ]
//                );
//                $mail
//                    ->subject('Nouveau message sur le site Fitprotein')
//                    ->from('tkabangu1@gmail.com')
//                    ->to('tkabangu.ae@gmail.com')
//                    ->html($mailBody)
//                    ->replyTo($data['email'])
//                ;
//
//                $mailer->send($mail);
//
//                $this->addFlash('success', 'Votre message est envoyé');
//
//            } else {
//                $this->addFlash('error', 'Le formulaire contient des erreurs');
//
        $contact = new Contact();

        $form = $this->createForm(ContactType::class, $contact);

        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $contact = $form->getData();

        $form = $this->createFormBuilder($contact)
            ->setAction($this->generateUrl('target_route'))
            ->setMethod('GET')
            ->getForm();


            return $this->redirectToRoute('contact_success');
        }

        return $this->render(
            'contact/index.html.twig',
            [
                'form' => $form->createView(),
            ]
        );
    }
}







