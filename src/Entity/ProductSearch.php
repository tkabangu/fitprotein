<?php


namespace App\Entity;

use Symfony\Component\Validator\Constraints as Assert;

class ProductSearch
{
    /**
     * @var int|null
     * @Assert\Range(min=5, max=350)
     */
    private $maxPrice;

    /**
     * @return int|null
     */
    public function getMaxPrice(): ?int
    {
        return $this->maxPrice;
    }

    /**
     * @param int|null $maxPrice
     * @return ProductSearch
     */
    public function setMaxPrice(?int $maxPrice): ProductSearch
    {
        $this->maxPrice = $maxPrice;
        return $this;
    }


}