<?php

namespace App\DataFixtures;


use App\Entity\Product;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Faker\Factory;
use Doctrine\Persistence\ObjectManager;

class ProductFixture extends Fixture
{
    /**
     * @param ObjectManager $manager
     */
    public function load(ObjectManager $manager)
    {
        $faker = Factory::create('fr_FR');
        for ($i = 0; $i < 100; $i++){
            $product = new Product();
            $product
                ->setTitle($faker->words(3, true))
                ->setDescription($faker->sentences(3, true))
                ->setDiscount($faker->numberBetween(10,80))
                ->setPrice($faker->numberBetween(1, 300));
            $manager->persist($product);
        }
        // TODO: Implement load() method.

        $manager->flush();
    }
}