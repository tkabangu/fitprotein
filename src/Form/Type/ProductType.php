<?php

namespace App\Form\Type;

use App\Entity\Product;
use App\Entity\SubCategory;
<<<<<<< HEAD
use Doctrine\ORM\Mapping\Entity;
=======
>>>>>>> 754591b09384d8fe83ca674a48c34c7b039bd4b0
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
                'class' => SubCategory::class,
                'choice_label' => function($subCategory){
                    return $subCategory->getName();
                }
            ])
=======
            ->add('subCategory', EntityType::class, [
                'class' => SubCategory::class,
                'choice_label' => function($subCategory) {
                    return $subCategory->getName();
                }
            ])

            ->add('imageFile', FileType::class, [
                'required' => false
            ])


            ->add('pictureFiles', FileType::class, [
                'required' => false,
                'multiple' => true
            ])

>>>>>>> 754591b09384d8fe83ca674a48c34c7b039bd4b0
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
