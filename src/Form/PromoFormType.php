<?php

namespace App\Form;

use App\Entity\Promo;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\NotBlank;

class PromoFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        if($options['createPromoCode'] == true)
        {
            $builder
                ->add('promoCode', TextType::class,[
                    'label' => 'Code Promo',
                    'required' => false,
                    'constraints' => [
                        new NotBlank([
                            'message' => "Veuillez renseigner le nom du code promo."
                        ])
                    ]
                ])
                ->add('promoType', ChoiceType::class,[
                    'choices' => [
                        "Pourcentage" => "Pourcentage",
                        "Devise" => "Devise" 
                    ]
                ])
                ->add('promoValue', NumberType::class,[
                    'label' => 'Montant de la promotion',
                    'scale' => 2
                ])
                ->add('dateDebut', DateTimeType::class, [
                    'date_label' => 'Date de début',
                ])
                ->add('dateFin', DateTimeType::class, [
                    'date_label' => 'Date de fin',
                ])
                ->add('quantityCondition', NumberType::class,[
                    'label' => "Nombre d'article minimum requis",
                    'scale' => 0
                ])
            ;
        }
        elseif($options['codePanier'] == true)
        {
            $builder
            ->add('promoCode', TextType::class,[
                'label' => 'Insérer un code promo',
                'required' => false,
                'constraints' => [
                    new NotBlank([
                        'message' => "Veuillez renseigner le nom du code promo."
                    ])
                ]
            ]);
        }
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Promo::class,
            'codePanier' => false,
            'createPromoCode' => false
        ]);
    }
}
