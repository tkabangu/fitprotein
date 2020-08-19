<?php


namespace App\Controller;


use App\Entity\Product;
use App\Form\Type\ProductSearchType;
use App\Repository\ProductRepository;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ProductController extends AbstractController
{
    private $repository;

    /**
     * @Route("products", name="product.index")
     * @param PaginatorInterface $paginator
     * @param Request $request
     * @return Response
     */
    public function index(PaginatorInterface $paginator, Request $request): Response
    {
        $search = new ProductSearch();
        $form =$this->createForm(ProductSearchType::class, $search);
        $form->handleRequest($request);

        $products = $paginator->paginate(
            $this->repository->findAllVisibleQuery($search),
            $request->query->getInt('page', 1),
            12
        );
        return $this->render('product/index.html.twig',[
            'current_menu' => 'products',
            'products'     => $products,
            'form'         => $form->createView()
        ]);

    }

    /**
     * @Route("/biens/{slug}-{id}", name="property.show", requirements={"slug": "[a-z0-9\-]*"})
     * @param Product $product
     * @param string $slug
     * @return Response
     */
    public function show(Product $product, string $slug): Response
    {
        if ($product->getSlug() !== $slug) {
            return $this->redirectToRoute('property.show', [
                'id' => $product->getId(),
                'slug' => $product>getSlug()
            ], 301);
        }
        return $this->render('product/show.html.twig', [
            'product' => $product

        ]);
    }

}

