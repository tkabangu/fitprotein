<?php


namespace App\Controller\Admin;


use App\Entity\Product;
use App\Form\Type\ProductType;
use App\Repository\ProductRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class ProductController extends AbstractController
{
    /**
     * @var ProductRepository

     */
    private $repository;

    public function __construct(ProductRepository $repository)
    {
        $this->repository = $repository;
    }

    /**
     * @Route("/admin", name="admin.product.index")
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function index()
    {
      $product = $this->repository->findAll();
      return $this->render('admin/product/index.html.twig', compact('product'));

    }

    /**
     * @Route("/admin/{id}", name="admin.product.edit")
     * @param Product $product
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function edit(Product $product)
    {
        $form = $this->createForm(ProductType::class, $product);
        return $this->render('admin/product/edit.html.twig', [
            'product' => $product,
            'form' => $form->createView()

        ]);
    }
}