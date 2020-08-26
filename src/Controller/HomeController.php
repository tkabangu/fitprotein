<?php

namespace App\Controller;

use Doctrine\ORM\EntityManager;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
{

    /**
     * @Route("/", name="home")
     * @param PaginatorInterface $paginator
     * @param Request $request
     * @return Response
     */
    public function index(PaginatorInterface $paginator, Request $request)
    {

        $manager = $this->getDoctrine()->getManager();
        $repoProduct = $manager->getRepository('App:Product');
        //$products = $repoProduct->findAll();

        $products = $paginator->paginate(
            $repoProduct->findAll(),
            $request->query->getInt('page', 1),
            12
        );

        return $this->render('home/index.html.twig',[
            'controller_name' => 'HomeController',
            'products'     => $products,
            'form'         => 'toto'
        ]);
    }


    /**
     * @Route("/mentions-legales",name="mentions-legales")
     * @template
     * @param $request
     */
    public function mentionsLegalesAction(Request $request){
        return $this->render('home/mentions-legales.html.twig', array());
    }

    /**
     * @Route("/qui-sommes-nous",name="qui-sommes-nous")
     * @template
     * @param $request
     */
    public function quiSommesNousAction(Request $request){
        return $this->render('home/qui-sommes-nous.html.twig', array());
    }

    /**
     * @Route("/livraison-et-retours",name="livraison-et-retours")
     * @template
     * @param $request
     */
    public function livraisonEtRetours(Request $request){
        return $this->render('home/livraison-et-retours.html.twig', array());
    }
    /**
     * @Route("/modes-de-paiement",name="modes-de-paiement")
     * @template
     * @param $request
     */
    public function modesDePaiement(Request $request){
        return $this->render('home/modes-de-paiement.html.twig', array());
    }


}
