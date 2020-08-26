<?php


namespace App\Controller;


use App\Entity\ProductSearch;
use App\Form\Type\ProductSearchType;
use App\Entity\Product;
use Doctrine\ORM\EntityManager;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ProductController extends AbstractController
{
    private $repository;

    /**
     * @Route("products/{id}/{sid}", name="product.index")
     * @param PaginatorInterface $paginator
     * @param Request $request
     * @param integer $id
     * @param integer $sid
     * @return Response
     */
    public function index($id = null, $sid = null, PaginatorInterface $paginator, Request $request): Response
    {
        $search = new ProductSearch();
        $form =$this->createForm(ProductSearchType::class, $search);
        $form->handleRequest($request);


        $manager = $this->getDoctrine()->getManager();
        $repoProduct = $manager->getRepository('App:Product');

        $repoSubCat = $manager->getRepository('App:SubCategory');
        //$products = $repoProduct->findAll();


        if($id){
            $subCats = $repoSubCat->find($id);

            $subCats = $repoSubCat->findBy( ['category' => $id]);

            $products = $paginator->paginate(
                $repoProduct->findBy( ['subCategory' => $subCats]),
                $request->query->getInt('page', 1),
                12
            );

            if($sid){

                $products = $paginator->paginate(
                    $repoProduct->findBy( ['subCategory' => $sid]),
                    $request->query->getInt('page', 1),
                    12
                );
            }
        }
        else{
            $products = $paginator->paginate(
                $repoProduct->findAll(),
                $request->query->getInt('page', 1),
                12
            );
        }


        return $this->render('product/index.html.twig',[
            'current_menu' => 'products',
            'products'     => $products,
            'form'         => $form->createView()
        ]);

    }

    /**
     * @Route("/product/{slug}-{id}", name="product.show", requirements={"slug": "[a-z0-9\-]*"})
     * @param Product $product
     * @param string $slug
     * @return Response
     */
    public function show(Product $product, string $slug): Response
    {
        if ($product->getSlug() !== $slug) {
            /** @var TYPE_NAME $product */
            return $this->redirectToRoute('product.show', [
                'id' => $product->getId(),
                'slug' => $product->getSlug()
            ], 301);
        }
        return $this->render('product/show.html.twig', [
            'product' => $product

        ]);
    }
}

