<?php


namespace App\Controller\Admin;


use App\Entity\Category;
use App\Repository\CategoryRepository;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AdminCategoryController extends AbstractController
{
    /**
     * @var CategoryRepository
     */
    private $repository;


    /**
     * @var EntityManagerInterface
     */
    private $um;

    /**
     * CategoryController constructor.
     * @param CategoryRepository $repository
     * @param EntityManagerInterface $um
     */
    public function __construct(CategoryRepository $repository, EntityManagerInterface $um)
    {
        $this->category = $repository;
        $this->um = $um;
    }

    /**
     * @Route("/admin", name="admin.category.index")
     * @return Response
     */
    public function index()
    {
        $category = $this->repository->findAll();
        return $this->render('admin/category/index.html.twig', compact('category'));
    }

    /**
     * @Route("/admin/category/create", name="admin.category.new")
     * @param $request
     * @return Response
     */
    public function new(Request $request)
    {
        $category = new Category();
        $form = $this->createForm(CategoryType::class, $category);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()){
            $this->um->persist($category);
            $this->um->flush();
            $this->addFlash('success', 'Création avec succès');
            return $this->redirectToRoute('admin.category.index');
        }

        return $this->render('admin/category/new.html.twig', [
            'category' => $category,
            'form' => $form->createView()

        ]);
    }

    /**
     * @Route("/admin/category/{id}", name="admin.category.edit", methods="GET|POST")
     * @param Category $category
     * @param Request $request
     * @return Response
     */
    public function edit(Category $category, Request $request)
    {
        $form = $this->createForm(CategoryType::class, $category);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()){
            $this->um->flush();
            $this->addFlash('success', 'Modifié avec succès');
            return $this->redirectToRoute('admin.product.index');

        }
        return $this->render('admin/category/edit.html.twig', [
            'category' => $category,
            'form' => $form->createView()
        ]);
    }

    /**
     * @Route("/admin/category/{id}", name="admin.category.delete" methods="DELETE")
     * @param Category $category
     * @param Request $request
     * @return RedirectResponse
     */
    public function delete(Category $category, Request $request)
    {
        if ($this->isCsrfTokenValid('delete' . $category->getId(), $request->get('_token'))) {
            $this->um->remove($category);
            $this->um->flush();
            $this->addFlash('success', 'Supprimé avec succès');
        }
        return $this->redirectToRoute('admin.category.index');

    }

}

