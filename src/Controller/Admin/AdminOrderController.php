<?php


namespace App\Controller\Admin;



use App\Entity\Order;
use App\Repository\OrderRepository;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AdminOrderController extends AbstractController
{
    /**
     * @var OrderRepository
     */
    private $repository;

    /**
     * @var EntityManagerInterface
     * @ORM\Column(type="string")
     */
    private $rm;

    /**
     * OrderController constructor.
     * @param OrderRepository $repository
     * @param EntityManagerInterface $rm
     */
    public function __construct(OrderRepository $repository, EntityManagerInterface $rm)
    {
        $this->repository = $repository;
        $this->rm = $rm;
    }

    /**
     * @Route("/admin", name="admin.order.index")
     * @return Response
     */
    public function index()
    {
        $order = $this->repository->findAll();
        return $this->render('admin/order/index.html.twig', compact('order'));
    }

    /**
     * @Route("/admin/order/create", name="admin.order.new")
     * @param $request
     * @return Response
     */
    public function new(Request $request)
    {
        $order = new Order();
        $form = $this->createForm(OrderType::class, $order);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()){
            $this->rm->persist($order);
            $this->rm->flush();
            $this->addFlash('success', 'Création avec succès');
            return $this->redirectToRoute('admin.opinion.index');
        }

        return $this->render('admin/order/new.html.twig', [
            'order' => $order,
            'form' => $form->createView()

        ]);
    }

    /**
     * @Route("/admin/order/{id}", name="admin.order.edit", methods="GET|POST")
     * @param Order $order
     * @param Request $request
     * @return Response
     */
    public function edit(Order $order, Request $request)
    {
        $form = $this->createForm(OrderType::class, $order);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()){
            $this->rm->flush();
            $this->addFlash('success', 'Modifié avec succès');
            return $this->redirectToRoute('admin.opinion.index');

        }
        return $this->render('admin/order/edit.html.twig', [
            'order' => $order,
            'form' => $form->createView()
        ]);
    }

    /**
     * @Route("/admin/order/{id}", name="admin.order.delete" methods="DELETE")
     * @param Order $order
     * @param Request $request
     * @return RedirectResponse
     */
    public function delete(Order $order, Request $request)
    {
        if ($this->isCsrfTokenValid('delete' . $order->getId(), $request->get('_token'))) {
            $this->rm->remove($order);
            $this->rm->flush();
            $this->addFlash('success', 'Supprimé avec succès');
        }
        return $this->redirectToRoute('admin.order.index');

    }

}

