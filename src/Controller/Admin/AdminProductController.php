<?php


namespace App\Controller\Admin;


use App\Entity\Product;
use App\Form\Type\ProductType;
use App\Repository\ProductRepository;
use Doctrine\ORM\EntityManagerInterface;
<<<<<<< HEAD:src/Controller/Admin/AdminProductController.php
use Doctrine\ORM\Mapping as ORM;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
=======
>>>>>>> 754591b09384d8fe83ca674a48c34c7b039bd4b0:src/Controller/Admin/ProductController.php
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

<<<<<<< HEAD:src/Controller/Admin/AdminProductController.php
class AdminProductController extends AbstractController
=======

class ProductController extends AbstractController
>>>>>>> 754591b09384d8fe83ca674a48c34c7b039bd4b0:src/Controller/Admin/ProductController.php
{
    /**
     * @var ProductRepository
     */
    private $repository;

    /**
     * @var EntityManagerInterface
<<<<<<< HEAD:src/Controller/Admin/AdminProductController.php
     * @ORM\Column(type="string")
     */
    private $em;

    /**
     * ProductController constructor.
     * @param ProductRepository $repository
     * @param EntityManagerInterface $em
     */
=======
     */
    private $em;

>>>>>>> 754591b09384d8fe83ca674a48c34c7b039bd4b0:src/Controller/Admin/ProductController.php
    public function __construct(ProductRepository $repository, EntityManagerInterface $em)
    {
        $this->repository = $repository;
        $this->em = $em;
    }

    /**
<<<<<<< HEAD:src/Controller/Admin/AdminProductController.php
     * @Route("/admin", name="admin.product.index")
     * @return Response
=======
     * @Route("/admin/product", name="admin.product.index")
     * @return Response
     * @return \Symfony\Component\HttpFoundation\Response
>>>>>>> 754591b09384d8fe83ca674a48c34c7b039bd4b0:src/Controller/Admin/ProductController.php
     */
    public function index()
    {
      $product = $this->repository->findAll();
      return $this->render('admin/product/index.html.twig', compact('product'));
    }

    /**
     * @Route("/admin/product/create", name="admin.product.new")
     * @param $request
     * @return Response
     */
    public function new(Request $request)
    {
        $product = new Product();
        $form = $this->createForm(ProductType::class, $product);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid())
        {
            $this->em->persist($product);
            $this->em->flush();
            $this->addFlash('success', 'Création avec succès');
            return $this->redirectToRoute('admin.product.index');
        }

        return $this->render('admin/product/new.html.twig', [
            'product' => $product,
            'form' => $form->createView()
        ]);
    }



    /**
     * @Route("/admin/product/{id}", name="admin.product.edit", methods="GET|POST")
     * @param Product $product
     * @param Request $request
     * @return Response
     */
<<<<<<< HEAD:src/Controller/Admin/AdminProductController.php
    public function edit(Product $product, Request $request)
=======

    public function edit(Product $product,Request $request)

>>>>>>> 754591b09384d8fe83ca674a48c34c7b039bd4b0:src/Controller/Admin/ProductController.php
    {
        $form = $this->createForm(ProductType::class, $product);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->em->flush();
            $this->addFlash('success', 'Modifié avec succès');
            return $this->redirectToRoute('admin.product.index');
        }

        if ($form->isSubmitted() && $form->isValid()){
            $this->em->flush();
            $this->addFlash('success', 'Modifié avec succès');
            return $this->redirectToRoute('admin.product.index');

        }
        return $this->render('admin/product/edit.html.twig', [
            'product' => $product,
            'form' => $form->createView()
        ]);
    }

    /**
     * @Route("/admin/product/{id}", name="admin.product.delete", methods="DELETE")
     * @param Product $product
<<<<<<< HEAD:src/Controller/Admin/AdminProductController.php
     * @param Request $request
     * @return RedirectResponse
     */
    public function delete(Product $product, Request $request)
    {
        if ($this->isCsrfTokenValid('delete' . $product->getId(), $request->get('_token'))) {
             $this->em->remove($product);
             $this->em->flush();
=======
     * @return RedirectResponse
     */
    public function delete(Product $product, Request $request) {
        if ($this->isCsrfTokenValid('delete' . $product->getId(), $request->get('_token'))) {
            $this->em->remove($product);
            $this->em->flush();
>>>>>>> 754591b09384d8fe83ca674a48c34c7b039bd4b0:src/Controller/Admin/ProductController.php
            $this->addFlash('success', 'Supprimé avec succès');
        }
        return $this->redirectToRoute('admin.product.index');
    }

}

