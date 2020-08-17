<?php

namespace App\Form\Type;

use App\Entity\Cart;
use App\Entity\Product;
use App\Entity\User;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class CartType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('owner', EntityType::class,[
                'class' => User::class,
                'choice_label' => function($user){
                    return $user->getEmail();
                }
            ])
            ->add('product', EntityType::class,[
                'class' => Product::class,
                'choice_label' => function($product){
                    return $product->getName();
                }
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Cart::class,
            'translation_domain' => 'forms'
        ]);
    }
}

