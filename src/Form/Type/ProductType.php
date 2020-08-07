<?php

namespace App\Form\Type;

use App\Entity\Product;
use App\Entity\SubCategory;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
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
<<<<<<< HEAD
            ->add('subCategory', EntityType::class,[
=======
            ->add('subCategory', EntityType::class, [
>>>>>>> 0726e2d4a34febea6d8756ab4f349fb1a61fdb0b
                'class' => SubCategory::class,
                'choice_label' => function($subCategory) {
                    return $subCategory->getName();
                }
            ])
<<<<<<< HEAD
            ->add('imageFile', FileType::class, [
                'required' => false
            ])

=======
            ->add('pictureFiles', FileType::class, [
                'required' => false,
                'multiple' => true
            ])
>>>>>>> 0726e2d4a34febea6d8756ab4f349fb1a61fdb0b
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
