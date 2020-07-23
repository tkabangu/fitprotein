<?php
namespace App\Notification;

use App\Entity\Contact;
use Symfony\Component\Mailer\MailerInterface;
use Twig\Environment;
use Symfony\Bridge\Twig\Mime\TemplatedEmail;

class ContactNotification
{
	/**
	 * @var MailerInterface
	 */
	private $mailer;

	/**
	 * @var Environment
	 */
	private $renderer;

	public function __construct(MailerInterface $mailer, Environment $renderer)
	{
		$this->mailer = $mailer;
		$this->renderer = $renderer;
	}

	public function Notifiy(Contact $contact)
	{
		$email = (new TemplatedEmail())
			->from('contact@fitprotein.fr')
			->to('contact@fitprotein.fr')
			->subject('[FitProtein] Nouveau message de ' . $contact->getLastName() . ' ' . $contact->getFirstName())
			->replyTo($contact->getEmail())
			->htmlTemplate('email/contact.html.twig')
			->context([
				'contact' => $contact
			])
		;
		$this->mailer->send($email);
	}
}