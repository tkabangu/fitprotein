<?php

namespace App\Entity;

use App\Repository\SubCategoryRepository;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=SubCategoryRepository::class)
 */
class SubCategory
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity=Category::class, inversedBy="subCategories")
     * @ORM\JoinColumn(nullable=false)
     */
    private $category;

    /**
     * @ORM\Column(type="string", length=50)
     */
    private $name;

	/**
	 * @ORM\OneToMany(targetEntity=Product::class, mappedBy="subCategory", orphanRemoval=true)
	 */
	private $products;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getCategory(): ?Category
    {
        return $this->category;
    }

    public function setCategory(?Category $category): self
    {
        $this->category = $category;

        return $this;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

	/**
	 * @return Collection|Product[]
	 */
	public function getProducts(): Collection
	{
		return $this->products;
	}

	public function addProduct(Product $product): self
	{
		if (!$this->products->contains($product)) {
			$this->products[] = $product;
			$product->setSubCategory($this);
		}

		return $this;
	}

	public function removeProduct(Product $product): self
	{
		if ($this->products->contains($product)) {
			$this->products->removeElement($product);
			// set the owning side to null (unless already changed)
			if ($product->getSubCategory() === $this) {
				$product->setSubCategory(null);
			}
		}

		return $this;
	}
}
