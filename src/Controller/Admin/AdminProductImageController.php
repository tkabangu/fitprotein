<?php


namespace App\Controller\Admin;


use App\Entity\ProductImage;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/admin/productImage")
 */
class AdminProductImageController extends AbstractController
{
    /**
     * @Route("/{id}", name="admin.productImage.delete", methods="DELETE")
     * @param ProductImage $productImage
     * @param Request $request
     * @return JsonResponse
     */
    public function delete(ProductImage $productImage,Request $request)
    {
        $data = json_decode($request->getContent(), true);
        if ($this->isCsrfTokenValid('delete' . $productImage->getId(), $data[ '_token'])) {
            $ra =$this->getDoctrine()->getManager();
            $ra->remove($productImage);
            $ra->flush();
            $this->addFlash('success', 'Supprimé avec succès');
            return new JsonResponse(['success' =>1]);
        }
        return new JsonResponse(['error' =>'Token invalide'], 400);
    }

}