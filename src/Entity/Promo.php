<?php

namespace App\Entity;

use App\Repository\PromoRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=PromoRepository::class)
 */
class Promo
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $promoCode;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $promoType;

    /**
     * @ORM\Column(type="integer")
     */
    private $promoValue;

    /**
     * @ORM\Column(type="datetime")
     */
    private $dateDebut;

    /**
     * @ORM\Column(type="datetime")
     */
    private $dateFin;

    /**
     * @ORM\Column(type="integer")
     */
    private $quantityCondition;

    /**
     * @ORM\OneToMany(targetEntity=Commande::class, mappedBy="promo")
     */
    private $commandes;

    public function __construct()
    {
        $this->commandes = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getPromoCode(): ?string
    {
        return $this->promoCode;
    }

    public function setPromoCode(string $promoCode): self
    {
        $this->promoCode = $promoCode;

        return $this;
    }

    public function getPromoType(): ?string
    {
        return $this->promoType;
    }

    public function setPromoType(string $promoType): self
    {
        $this->promoType = $promoType;

        return $this;
    }

    public function getPromoValue(): ?int
    {
        return $this->promoValue;
    }

    public function setPromoValue(int $promoValue): self
    {
        $this->promoValue = $promoValue;

        return $this;
    }

    public function getDateDebut(): ?\DateTimeInterface
    {
        return $this->dateDebut;
    }

    public function setDateDebut(\DateTimeInterface $dateDebut): self
    {
        $this->dateDebut = $dateDebut;

        return $this;
    }

    public function getDateFin(): ?\DateTimeInterface
    {
        return $this->dateFin;
    }

    public function setDateFin(\DateTimeInterface $dateFin): self
    {
        $this->dateFin = $dateFin;

        return $this;
    }

    public function getQuantityCondition(): ?int
    {
        return $this->quantityCondition;
    }

    public function setQuantityCondition(int $quantityCondition): self
    {
        $this->quantityCondition = $quantityCondition;

        return $this;
    }

    public function __toString()
    {
        return $this->id;
    }

    /**
     * @return Collection|Commande[]
     */
    public function getCommandes(): Collection
    {
        return $this->commandes;
    }

    public function addCommande(Commande $commande): self
    {
        if (!$this->commandes->contains($commande)) {
            $this->commandes[] = $commande;
            $commande->setPromo($this);
        }

        return $this;
    }

    public function removeCommande(Commande $commande): self
    {
        if ($this->commandes->removeElement($commande)) {
            // set the owning side to null (unless already changed)
            if ($commande->getPromo() === $this) {
                $commande->setPromo(null);
            }
        }

        return $this;
    }
}
