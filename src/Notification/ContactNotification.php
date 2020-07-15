<?php
namespace App\Notification;

use App\Entity\Contact;
use Twig\Environment;

class ContactNotification
{
    /**
     * @var \Swift_Mailer
     */
    private $mailer;
    /**
     * @var Environment
     */
    private $renderer;

    public function __construct(\Swift_Mailer $mailer, Environment $renderer)
    {
        $this->mailer = $mailer;
        $this->renderer = $renderer;
    }

    public function Notifiy(Contact $contact)
    {
        $message = (new \Swift_Message('[FitProtein] Nouveau message de ' . $contact->getLastname() . ' ' . $contact->getFirstname()))
            ->setFrom('contact@fitprotein.fr')
            ->setTo('contact@fitprotein.fr')
            ->setReplyTo($contact->getEmail())
            ->setBody($this->renderer->render('email/contact.html.twig', [
                'contact' => $contact
            ]), 'text/html')
        ;
        $this->mailer->send($message);
    }
}