<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\Type\RegistrationType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;

class UserController extends AbstractController
{
    /**
     * @Route("/inscription")
     * @param Request $request
     * @param UserPasswordEncoderInterface $passwordEncoder
     * @param EntityManagerInterface $manager
     * @return \Symfony\Component\HttpFoundation\RedirectResponse|\Symfony\Component\HttpFoundation\Response
     */
    public function register(
        Request $request,
        UserPasswordEncoderInterface $passwordEncoder,
        EntityManagerInterface $manager
    )
    {
        $user = new User();
        $form = $this->createForm(RegistrationType::class, $user);

        $form->handleRequest($request);

        if ($form->isSubmitted()) {
            if ($form->isValid()) {
                // encryptage du mdp à partir de la config "encoders"
                // de config/packages/security.yaml
                $encodedPassword = $passwordEncoder->encodePassword(
                    $user,
                    $user->getPlainPassword()
                );

                $user->setPassword($encodedPassword);

                /** @var TYPE_NAME $manager */
                $manager->persist($user);
                $manager->flush();

                $this->addFlash('success', 'Votre compte est créé');

                return $this->redirectToRoute('home');
            } else {
                $this->addFlash(
                    'error',
                    'Le formulaire contient des erreurs'
                );
            }
        }

        return $this->render(
            'user/register.html.twig',
            [
                'form' => $form->createView()
            ]
        );
    }
}

