<?php

namespace App\Controller;

use App\Data\SearchData;
use App\Entity\Commande;
use App\Entity\Commentaire;
use App\Entity\Produit;
use App\Entity\User;
use App\Form\CommentaireTypeFormType;
use App\Form\PromoFormType;
use App\Form\RegistrationFormType;
use App\Form\SearchFormType;
use App\Repository\CategorieRepository;
use App\Repository\DetailsCommandeRepository;
use App\Repository\FormatRepository;
use App\Repository\UserRepository;
use App\Repository\ProduitRepository;
use App\Repository\PromoRepository;
use DateTime;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\Session;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\String\Slugger\SluggerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\Exception\FileException;

class DisController extends AbstractController
{

    #[Route('/artistes', name: 'nos_artistes')]
    public function artistes(UserRepository $repoUser): Response
    {

        $vendeurs = $repoUser->findAll(); // je récupère tout les Users

        return $this->render('base/nos_artistes.html.twig', [
            'vendeurs' => $vendeurs
        ]);
    }

    #[Route('/produits', name: 'produits')]
    #[Route('/produits/{categorie}', name: 'produits_par_cat')]
    public function produits(ProduitRepository $repoProduct, Request $request): Response
    {      
        $data = new SearchData(); // j'initie mon objet search data
        $data->page = $request->get('page', 1); // j'associe à la variable page de SearchData la valeur passer dans le formulaire sinon je prends 1 par défaut
        $searchForm = $this->createForm(SearchFormType::class, $data); // je crée le formulaire de filtre
        $searchForm->handleRequest($request); // je récupère les valeurs du formulaire
        $produit = $repoProduct->findSearch($data); // je lance ma requete en passant mon objet SearchData en paramètres

        return $this->render('base/tous_nos_produits.html.twig', [
            'produit' => $produit,
            'searchForm' => $searchForm->createView()
        ]);
    }

    

    #[Route('/a_propos', name: 'a_propos')]
    public function about(): Response
    {
        return $this->render('base/a_propos.html.twig');
    }


    #[Route('/', name: 'home')]
    public function home(ProduitRepository $repoProduct, DetailsCommandeRepository $repoDetailsCommande): Response
    {

        $derniers_produit = $repoProduct->findBy([], ['id' => 'DESC'], 10, null); // je récupère les 10 dernier article passer en BDD

        $random_produit = $repoProduct->findAll(); // je récupère tout les produits
        shuffle($random_produit); // je mélange le tableau
        $random_produit = array_slice($random_produit, 0, 10); // je découpe le tableau pour garder les 10 premier élément
        // Ceci me permet d'avoir un équivalent de select random produit

        // ici je vais récuperer les produits les plus vendus
        $all_details = $repoDetailsCommande->findAll();

        $produit_best_sellers = [];

        foreach($all_details as $detail) // je parcours chaque produit
        {
            // pour chaque produit je mets en clé du tableau l'id produit et en valeur associé sa quantité acheter au total
            if(!empty($produit_best_sellers[$detail->getProduitId()]))
            {
                $produit_best_sellers[$detail->getProduitId()] += $detail->getQuantite(); // Si le produit existe déja dans mon tableau je lui rajoute la quantité
            }
            else
            {
                $produit_best_sellers[$detail->getProduitId()] = $detail->getQuantite(); // Si le produit n'existe pas dans mon tableau j'assigne la quantité à l'id du prduit en clé du tableau
            }
        }

        arsort($produit_best_sellers, SORT_NUMERIC); // je réorganise le tableau de manière croissante tout en gardant les bonnes clés

        $bestSellers = [];

        foreach($produit_best_sellers as $id => $quantite)
        {
            // je rajoute chaque produit en le récupérant sous forme d'objet dans un tableau
            array_push($bestSellers, $repoProduct->find($id));
        }


        return $this->render('base/home.html.twig', [
            'derniers_produit' => $derniers_produit,
            'random_produit' => $random_produit,
            'best_sellers' => $bestSellers
        ]);
    }

    #[Route('/fiche_produit/{id}', name: 'fiche_produit')]
    public function ficheProduit(Produit $produit, ProduitRepository $repoProduct, EntityManagerInterface $manager, Request $request): Response
    {
        $categories = array();
        foreach($produit->getCategorie() as $category)
        {
            // je récupère chaque categorie du produit
            array_push($categories, $category);
        }
        
        $sameCategorie = $repoProduct->findByCategorie($categories, $produit->getId()); // je recherche des produits qui possède une des categories passé en paramètres

        $commentaire = new Commentaire;

        $commentForm = $this->createForm(CommentaireTypeFormType::class, $commentaire);

        $commentForm->handleRequest($request);

        if($commentForm->isSubmitted() && $commentForm->isValid())
        {
            $user = $this->getUser();

            $commentaire->setDate(new \DateTime())
                    ->setAuteur($user->getPrenom() . ' ' . $user->getNom())
                    ->setProduit($produit);


            $manager->persist($commentaire);
            $manager->flush();

            $this->addFlash('success', "Félicitations ! Votre commentaire a bien été posté !");

            return $this->redirectToRoute('fiche_produit', [
                'id' => $produit->getId()
            ]);
        }

        return $this->render('base/fiche_produit.html.twig', [
            'produit' => $produit,
            'sameCategorie' => $sameCategorie,
            'commentaireForm' => $commentForm->createView()
        ]);
    }

    #[Route('/contact', name: 'contact')]
    public function fichecontact(): Response
    {
        return $this->render('base/contact.html.twig');
    }

    #[Route('/faq', name: 'faq')]
    public function fichefaq(): Response
    {
        return $this->render('base/faq.html.twig');
    }


    #[Route('/profil', name: 'profil')]
    public function pageProfil(): Response
    {
        return $this->render('base/profil.html.twig');
    }

    #[Route('/legal_notice', name: 'legal_notice')]
    public function pageNotice(): Response
    {
        return $this->render('base/legal_notice.html.twig');
    }

    #[Route('/profil/{id}/edit', name: 'edit_profil_user')]
    public function editProfilUser(User $user, Request $request, EntityManagerInterface $manager, SluggerInterface $slugger): Response
    {

        $userForm = $this->createForm(RegistrationFormType::class, $user, [
            'userUpdate' => true 
        ]);
        $ProfilBdd = $user->getImageProfil();

        $userForm->handleRequest($request);

        if ($userForm->isSubmitted() && $userForm->isValid()) {
            // encode the plain password

            $profilphoto = $userForm->get('imageProfil')->getData();
            if($profilphoto)
            {
                $nomOriginePhoto = pathinfo($profilphoto->getClientOriginalName(), PATHINFO_FILENAME);
                //dd($nomOriginePhoto);

                // cela est necessaire pour inclure en toute sécurité le nom du fichier dans l'URL
                $secureNomPhoto = $slugger->slug($nomOriginePhoto);

                $nouveauNomFichier = $secureNomPhoto.' - '.uniqid().'.'.$profilphoto->guessExtension();
                // dd($nouveauNomFichier);
                try
                {
                    $profilphoto->move(
                        $this->getParameter('photo_directory'),
                        $nouveauNomFichier
                    );
                }
                catch(FileException $e)
                {

                }

                $user->setImageProfil($nouveauNomFichier);

            }
            else
            {
                $user->setImageProfil($ProfilBdd);                    
            }


            $manager->persist($user);
            $manager->flush();

            return $this->redirectToRoute('app_logout');
        }

        return $this->render('base/user_edit.html.twig', [
            'userForm' => $userForm->createView(),
            'photoBdd' => $ProfilBdd,
        ]);
    }
    
    #[Route('/panier', name: 'panier')]
    public function panier(Session $session, Request $request, PromoRepository $repoPromoCode): Response
    {
        $panier = $session->get("panier");

        $reduction = $session->get('promo');
  
        $promoForm = $this->createForm(PromoFormType::class, null, [
            'codePanier' => true
        ]);

        $promoForm->handleRequest($request);

        if ($promoForm->isSubmitted() && $promoForm->isValid()) {

            $userPromo =  $promoForm->getData()->getPromoCode();
            $promoCode = $repoPromoCode->findOneBy(['promoCode' => $userPromo], null);
            $dateNow = new DateTime(date('d-m-Y H:i:s'));
            if(!empty($promoCode))
            {
                if($dateNow > $promoCode->getDateDebut() && $dateNow < $promoCode->getDateFin())
                {
                    $totalArticle = 0;
                    for($i = 0; $i < count($panier); $i++)
                    {
                        $totalArticle += $panier[$i]['quantite'];
                    }
                    if($totalArticle >= $promoCode->getQuantityCondition())
                    {
                        $session->set('promo', $promoCode);
                        return $this->redirectToRoute('panier');
                    }
                    else
                    {
                        $this->addFlash('danger', "Il faut un minimum de ".$promoCode->getQuantityCondition()." article(s).");
                    }
                }
                else
                {
                    $this->addFlash('danger', "Code expiré !");
                }
            }
        }

        return $this->render('base/panier.html.twig', [
            'panier' => $panier,
            'promoForm' => $promoForm->createView(),
            'reduction' => $reduction
        ]);
    }

    #[Route('artiste/{id}', name: 'profil_vendeur')]
    public function mon_profil(User $user): Response 
    {
        // dans le cas ou quelqu'un voudrait passer un ID d'un user qui n'a pas le role vendeur, on le redirige vers nos artiste
        if(!in_array('ROLE_VENDEUR' ,$user->getRoles()))
        {
            return $this->redirectToRoute('nos_artistes');
        }

        return $this->render('base/profil_vendeur.html.twig', [
            'vendeur' => $user
        ]);
    }

    #[Route('mescommandes/{id}', name: 'ma_commande')]
    public function ma_commande(Commande $commande, ProduitRepository $repoProduit, FormatRepository $repoFormat): Response 
    {
        $user = $this->getUser();
        // si on essaye d'aller voir une commande qui ne nous appartient pas, on est rediriger vers profil
        if($user->getId() != $commande->getUser()->getId())
        {
            return $this->redirectToRoute('profil');
        }

        $articles = array();
        foreach($commande->getDetailsCommandes() as $details)
        {
            $article['produit'] = $repoProduit->find($details->getProduitId());
            $article['format'] = $repoFormat->find($details->getFormatId());
            $article['quantite'] = $details->getQuantite();
            $article['prix'] = $details->getPrix();
            array_push($articles, $article);
        }

        return $this->render('base/ma_commande.html.twig', [
            'commande' => $commande,
            'articles' => $articles
        ]);
    }
    
}
