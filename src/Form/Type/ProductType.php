<?php

namespace App\Form\Type;

use App\Entity\Product;
use App\Entity\ProductImage;
use App\Entity\SubCategory;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ProductType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('price')
            ->add('discount')
            ->add('title')
            ->add('quantity')
            ->add('description')
            ->add('createdAt')
            ->add('updatedAt')

            ->add('subCategory', EntityType::class,[
                'class' => SubCategory::class,
                'choice_label' => function($subCategory){
                    return $subCategory->getName();
                }
            ])

            ->add('pictureFiles', FileType::class, [
                'required' => false,
                'multiple' => true
            ])

        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Product::class,
            'translation_domain' => 'forms'
        ]);
    }
}
