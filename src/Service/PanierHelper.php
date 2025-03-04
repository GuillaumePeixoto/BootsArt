<?php

namespace App\Service;

use Symfony\Component\HttpFoundation\Session\SessionInterface;

class PanierHelper
{
    /*
        Renvoie le montant total du panier
    */
    public static function totalPrixPanier(SessionInterface $session): int
    {
        $panier = $session->get('panier', []);
        $totalPrice = 0;

        foreach ($panier as $item) {
            $totalPrice += $item['quantite'] * $item['format']->getPrix();
        }

        return $totalPrice;
    }

    /*
        Renvoie le nombre de produit total du panier
    */
    public static function totalQuantitePanier(SessionInterface $session): int
    {
        $panier = $session->get('panier', []);
        $totalQuantite = 0;

        foreach ($panier as $item) {
            $totalQuantite += $item['quantite'];
        }

        return $totalQuantite;
    }
}
