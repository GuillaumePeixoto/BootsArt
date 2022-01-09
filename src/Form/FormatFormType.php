<?php

namespace App\Form;

use App\Entity\Format;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\MoneyType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\NotBlank;

class FormatFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('prix', MoneyType::class, [
                'label' => "Prix",
                'currency' => "EUR",
                'html5' => true,
                'required' => false,
                'constraints' => [
                    new NotBlank([
                        'message' => "Merci de saisir un prix"
                    ])
                ],
                
            ])
            ->add('format', TextType::class, [
                'required' => false,
                'constraints' => [
                    new NotBlank([
                        'message' => "Veuillez renseigner un format."
                    ])
                ]
            ])
            ->add('largeur', TextType::class, [
                'required' => false,
                'constraints' => [
                    new NotBlank([
                        'message' => "Veuillez renseigner une largeur."
                    ])
                ]
            ])
            ->add('hauteur', TextType::class, [
                'required' => false,
                'constraints' => [
                    new NotBlank([
                        'message' => "Veuillez renseigner une longueur."
                    ])
                ]
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Format::class,
        ]);
    }
}
