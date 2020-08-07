<?php


namespace App\Controller\Admin;


use App\Entity\Product;
use App\Form\Type\ProductType;
use App\Repository\ProductRepository;
use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\ORM\EntityManagerInterface;
<<<<<<< HEAD
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
=======
>>>>>>> 0726e2d4a34febea6d8756ab4f349fb1a61fdb0b
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;


class ProductController extends AbstractController
{
    /**
     * @var ProductRepository
     */
    private $repository;
    /**
     * @var EntityManagerInterface
     */
    private $em;

    public function __construct(ProductRepository $repository, EntityManagerInterface $em)
    {
        $this->repository = $repository;
        $this->em = $em;
    }

    /**
<<<<<<< HEAD
     * @Route("/admin/product", name="admin.product.index")
     * @return Response
=======
     * @Route("/admin/products", name="admin.product.index")
     * @return \Symfony\Component\HttpFoundation\Response
>>>>>>> 0726e2d4a34febea6d8756ab4f349fb1a61fdb0b
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
<<<<<<< HEAD
     * @Route("/admin/product/create", name="admin.product.new")
     */
    public function new(Request $request)
    {
        $product = new Product();
        $form = $this->createForm(ProductType::class, $product);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->em->persist($product);
            $this->em->flush();
            $this->addFlash('success', 'Créé avec succès');
            return $this->redirectToRoute('admin.product.index');
        }

        return $this->render('admin/product/new.html.twig', [
            'product' => $product,
            'form'     => $form->createView()
        ]);
    }

    /**
     * @Route("/admin/product/{id}", name="admin.product.edit", methods="GET|POST")
     * @param Product $product
     * @param Request $request
     * @return Response
     */
    public function edit(Product $product, Request $request )
=======
     * @Route("/admin/product/{id}", name="admin.product.edit", methods="GET|POST")
     * @param Product $product
     * @param Request $request
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function edit(Product $product,Request $request)
>>>>>>> 0726e2d4a34febea6d8756ab4f349fb1a61fdb0b
    {
        $form = $this->createForm(ProductType::class, $product);
        $form->handleRequest($request);

<<<<<<< HEAD
        if ($form->isSubmitted() && $form->isValid()) {
            $this->em->flush();
            $this->addFlash('success', 'Modifié avec succès');
            return $this->redirectToRoute('admin.product.index');
        }
=======
        if ($form->isSubmitted() && $form->isValid()){
            $this->em->flush();
            $this->addFlash('success', 'Modifié avec succès');
            return $this->redirectToRoute('admin.product.index');

        }

>>>>>>> 0726e2d4a34febea6d8756ab4f349fb1a61fdb0b
        return $this->render('admin/product/edit.html.twig', [
            'product' => $product,
            'form' => $form->createView()

        ]);
    }

    /**
     * @Route("/admin/product/{id}", name="admin.product.delete", methods="DELETE")
     * @param Product $product
<<<<<<< HEAD
     * @return RedirectResponse
     */
    public function delete(Product $product, Request $request) {
        if ($this->isCsrfTokenValid('delete' . $product->getId(), $request->get('_token'))) {
            $this->em->remove($product);
            $this->em->flush();
            $this->addFlash('success', 'Supprimé avec succès');
        }
        return $this->redirectToRoute('admin.product.index');
    }
}
=======
     * @return \Symfony\Component\HttpFoundation\RedirectResponse
     */
    public function delete(Product $product, Request $request)
    {
        if ($this->isCsrfTokenValid('delete' . $product->getId(), $request->get('_token'))){
             $this->em->remove($product);
             $this->em->flush();
            $this->addFlash('success', 'Supprimé avec succès');
        }
        return $this->redirectToRoute('admin.product.index');

    }

}

>>>>>>> 0726e2d4a34febea6d8756ab4f349fb1a61fdb0b
