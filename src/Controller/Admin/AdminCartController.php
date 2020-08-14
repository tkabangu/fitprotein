<?php


namespace App\Controller\Admin;


use App\Entity\Cart;
use App\Form\Type\CartType;
use App\Repository\CartRepository;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AdminCartController extends AbstractController
{
    /**
     * @var CartRepository
     */
    private $repository;

    /**
     * @var EntityManagerInterface
     * @ORM\Column(type="string")
     */
    private $om;

    /**
     * ProductController constructor.
     * @param CartRepository $repository
     * @param EntityManagerInterface $om
     */
    public function __construct(CartRepository $repository, EntityManagerInterface $om)
    {
        $this->repository = $repository;
        $this->om = $om;
    }

    /**
     * @Route("/admin", name="admin.cart.index")
     * @return Response
     */
    public function index()
    {
        $cart = $this->repository->findAll();
        return $this->render('admin/cart/index.html.twig', compact('cart'));
    }

    /**
     * @Route("/admin/cart/create", name="admin.cart.new")
     * @param $request
     * @return Response
     */
    public function new(Request $request)
    {
        $cart = new Cart();
        $form = $this->createForm(CartType::class, $cart);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()){
            $this->om->persist($cart);
            $this->om->flush();
            $this->addFlash('success', 'Création avec succès');
            return $this->redirectToRoute('admin.cart.index');
        }

        return $this->render('admin/cart/new.html.twig', [
            'cart' => $cart,
            'form' => $form->createView()

        ]);
    }

    /**
     * @Route("/admin/cart/{id}", name="admin.cart.edit", methods="GET|POST")
     * @param Cart $cart
     * @param Request $request
     * @return Response
     */
    public function edit(Cart $cart, Request $request)
    {
        $form = $this->createForm(CartType::class, $cart);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()){
            $this->om->flush();
            $this->addFlash('success', 'Modifié avec succès');
            return $this->redirectToRoute('admin.cart.index');

        }
        return $this->render('admin/cart/edit.html.twig', [
            'cart' => $cart,
            'form' => $form->createView()
        ]);
    }

    /**
     * @Route("/admin/cart/{id}", name="admin.cart.delete" methods="DELETE")
     * @param Cart $cart
     * @param Request $request
     * @return RedirectResponse
     */
    public function delete(Cart $cart, Request $request)
    {
        if ($this->isCsrfTokenValid('delete' . $cart->getId(), $request->get('_token'))) {
            $this->om->remove($cart);
            $this->om->flush();
            $this->addFlash('success', 'Supprimé avec succès');
        }
        return $this->redirectToRoute('admin.cart.index');

    }

}

