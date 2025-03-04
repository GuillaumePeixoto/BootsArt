<?php

namespace App\Repository;

use App\Data\SearchData;
use App\Entity\Produit;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Produit|null find($id, $lockMode = null, $lockVersion = null)
 * @method Produit|null findOneBy(array $criteria, array $orderBy = null)
 * @method Produit[]    findAll()
 * @method Produit[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ProduitRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Produit::class);
    }

    // /**
    //  * @return Produit[] Returns an array of Produit objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('p.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */


    // permet de sélectionner des produits en fonction des categories envoyé en parametres
    public function findByCategorie($categories, $id){
        $query = $this->createQueryBuilder('produit')
                      ->select('produit')
                      ->leftJoin('produit.categorie', 'categorie')
                      ->addSelect('categorie')
                      ->where('produit.id != :id')
                      ->setParameter('id', $id);
 
        $query = $query->andWhere($query->expr()->in('categorie', ':categorie'))
                      ->setParameter('categorie', $categories)
                      ->setMaxResults(10);

        return $query->getQuery()->getResult();
    }

    // permet de sélectionner les produits sauf celui passer en paramètres
    public function findNotEqual($id)
    {
        $query = $this->createQueryBuilder('produit')
                      ->select('produit')
                      ->where('produit.id != :id')
                      ->setParameter('id', $id);
        return $query->getQuery()->getResult();

    }

    // permet de selectionner les produits en fonction des différentes valeurs passer dans l'objet SearchData
    public function findSearch(SearchData $search)
    {
        $query = $this
            ->createQueryBuilder('produit')
            ->select('DISTINCT produit')
            ->leftJoin('produit.categorie', 'categorie')
            ->leftJoin('produit.format', 'format');
    
        // Recherche par titre
        if (!empty($search->q)) {
            $query->andWhere('produit.titre LIKE :q')
                  ->setParameter('q', "%{$search->q}%");
        }
    
        // Filtre par catégories
        if (!empty($search->categories)) {
            $query->andWhere('categorie.id IN (:categories)')
                  ->setParameter('categories', $search->categories);
        }
    
        // Filtre par formats
        if (!empty($search->formats)) {
            $query->andWhere('format.id IN (:formats)')
                  ->setParameter('formats', $search->formats);
        }

        $query->groupBy('produit.id');
    
        $query->setFirstResult(($search->page - 1) * 20) // Offset
              ->setMaxResults(20); // Nombre d'éléments à afficher
    
        return $query->getQuery()->getResult();
    }

    /*
    public function findOneBySomeField($value): ?Produit
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
