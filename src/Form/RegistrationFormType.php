<?php

namespace App\Form;

use App\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Validator\Constraints\File;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\IsTrue;
use Symfony\Component\Validator\Constraints\Length;
use Symfony\Component\Validator\Constraints\NotBlank;

class RegistrationFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        if($options['userRegistration'] == true)
        {
            $builder
                ->add('roles', ChoiceType::class, [
                'choices' => [
                    'Utilisateur' => 'ROLE_USER',
                    'Vendeur' => 'ROLE_VENDEUR',
                ],
                'expanded' => true,
                'multiple' => true,
                'label' => "Définir le role de l'utilisteur"
                ])
                ->add('imageProfil', FileType::class, [
                    'label' => "Uploader une image de profil",
                    'mapped' => true,
                    'required' => false,
                    'data_class' => null,
                    'constraints' => [
                        new File([
                            'maxSize' => '5M',
                            'mimeTypes' => [
                                'image/jpeg',
                                'image/png',
                                'image/jpg'
                            ],
                            'mimeTypesMessage' => "Formats autorisé : jpeg, png, jpg."
                        ])
                    ]
                ])
                ->add('banniereProfil', FileType::class, [
                    'label' => "Uploader une bannière ",
                    'mapped' => true,
                    'required' => false,
                    'data_class' => null,
                    'constraints' => [
                        new File([
                            'maxSize' => '5M',
                            'mimeTypes' => [
                                'image/jpeg',
                                'image/png',
                                'image/jpg'
                            ],
                            'mimeTypesMessage' => "Formats autorisé : jpeg, png, jpg."
                        ])
                    ]
                ])
                ->add('description', TextareaType::class, [
                    'required' => false,
                    'attr' => [
                        'placeholder' => "Saisir une description du produit",
                        'rows' => "10"
                    ]
                ])
                ->add('adresse', TextType::class, [
                    'required' => false,
                    'constraints' => [
                        new NotBlank([
                            'message' => "Veuillez renseigner votre adresse."
                        ])
                    ]
                ])
                ->add('ville', TextType::class, [
                    'required' => false,
                    'constraints' => [
                        new NotBlank([
                            'message' => "Veuillez renseigner votre ville."
                        ])
                    ]
                ])
                ->add('codePostal', NumberType::class, [
                    'required' => false,
                    'constraints' => [
                        new NotBlank([
                            'message' => "Veuillez renseigner votre code postal."
                        ])
                    ]
                ])
                ->add('prenom', TextType::class, [
                    'required' => false,
                    'constraints' => [
                        new NotBlank([
                            'message' => "Veuillez renseigner votre prenom."
                        ])
                    ]
                ])
                ->add('nom', TextType::class, [
                    'required' => false,
                    'constraints' => [
                        new NotBlank([
                            'message' => "Veuillez renseigner votre nom."
                        ])
                    ]
                ])
                ->add('pseudo', TextType::class, [
                    'required' => false,
                    'constraints' => [
                        new NotBlank([
                            'message' => "Veuillez renseigner votre pseudo."
                        ])
                    ]
                ])
                ->add('email', TextType::class, [
                    'required' => false,
                    'constraints' => [
                        new NotBlank([
                            'message' => "Veuillez renseigner votre adresse mail."
                        ])
                    ]
                ])
                ->add('password', RepeatedType::class, [
                    'type' => PasswordType::class,
                    'invalid_message' => "Les mots de passes ne correspondent pas",
                    'required' => false,
                    'options' => [
                        'attr' => [
                            'class' => 'password-field'
                        ]
                    ],
                    'first_options' => [
                        'label' => "Mot de passe"
                    ],
                    'second_options' => [
                        'label' => "Confirmer votre mot de passe"
                    ],
                    'constraints' => [
                        new NotBlank([
                            'message' => "Veuillez renseigner votre mot de passe."
                        ]),
                        new Length([
                            'min' => 8,
                            'max' => 24,
                            'minMessage' => "Votre mot de passe doit contenir au minimum 8 caractères.",
                            'maxMessage' => "Votre mot de passe doit contenir au maximum 24 caractères."
                        ])
                    ]
                ])
            ;
        }
        elseif($options['userUpdate'] == true)
        {
            $builder
            ->add('adresse', TextType::class, [
                'required' => false,
                'constraints' => [
                    new NotBlank([
                        'message' => "Veuillez renseigner votre adresse."
                    ])
                ]
            ])
            ->add('ville', TextType::class, [
                'required' => false,
                'constraints' => [
                    new NotBlank([
                        'message' => "Veuillez renseigner votre ville."
                    ])
                ]
            ])
            ->add('codePostal', NumberType::class, [
                'required' => false,
                'constraints' => [
                    new NotBlank([
                        'message' => "Veuillez renseigner votre code postal."
                    ])
                ]
            ])
            ->add('prenom', TextType::class, [
                'required' => false,
                'constraints' => [
                    new NotBlank([
                        'message' => "Veuillez renseigner votre prenom."
                    ])
                ]
            ])
            ->add('nom', TextType::class, [
                'required' => false,
                'constraints' => [
                    new NotBlank([
                        'message' => "Veuillez renseigner votre nom."
                    ])
                ]
            ])
            ->add('pseudo', TextType::class, [
                'required' => false,
                'constraints' => [
                    new NotBlank([
                        'message' => "Veuillez renseigner votre pseudo."
                    ])
                ]
            ])
            ->add('imageProfil', FileType::class, [
                'label' => "Uploader une image de profil",
                'mapped' => true,
                'required' => false,
                'data_class' => null,
                'constraints' => [
                    new File([
                        'maxSize' => '5M',
                        'mimeTypes' => [
                            'image/jpeg',
                            'image/png',
                            'image/jpg'
                        ],
                        'mimeTypesMessage' => "Formats autorisé : jpeg, png, jpg."
                    ])
                ]
            ])
            ->add('email', TextType::class, [
                'required' => false,
                'constraints' => [
                    new NotBlank([
                        'message' => "Veuillez renseigner votre adresse mail."
                    ])
                ]
            ]);
        }
        elseif($options['adminUserRegistration'] == true)
        {
            $builder
                ->add('adresse', TextType::class, [
                    'required' => false,
                    'constraints' => [
                        new NotBlank([
                            'message' => "Veuillez renseigner votre adresse."
                        ])
                    ]
                ])
                ->add('ville', TextType::class, [
                    'required' => false,
                    'constraints' => [
                        new NotBlank([
                            'message' => "Veuillez renseigner votre ville."
                        ])
                    ]
                ])
                ->add('codePostal', NumberType::class, [
                    'required' => false,
                    'constraints' => [
                        new NotBlank([
                            'message' => "Veuillez renseigner votre code postal."
                        ])
                    ]
                ])
                ->add('prenom', TextType::class, [
                    'required' => false,
                    'constraints' => [
                        new NotBlank([
                            'message' => "Veuillez renseigner votre prenom."
                        ])
                    ]
                ])
                ->add('nom', TextType::class, [
                    'required' => false,
                    'constraints' => [
                        new NotBlank([
                            'message' => "Veuillez renseigner votre nom."
                        ])
                    ]
                ])
                ->add('pseudo', TextType::class, [
                    'required' => false,
                    'constraints' => [
                        new NotBlank([
                            'message' => "Veuillez renseigner votre pseudo."
                        ])
                    ]
                ])
                ->add('email', TextType::class, [
                    'required' => false,
                    'constraints' => [
                        new NotBlank([
                            'message' => "Veuillez renseigner votre adresse mail."
                        ])
                    ]
                ])
                ->add('password', RepeatedType::class, [
                    'type' => PasswordType::class,
                    'invalid_message' => "Les mots de passes ne correspondent pas",
                    'required' => false,
                    'options' => [
                        'attr' => [
                            'class' => 'password-field'
                        ]
                    ],
                    'first_options' => [
                        'label' => "Mot de passe"
                    ],
                    'second_options' => [
                        'label' => "Confirmer votre mot de passe"
                    ],
                    'constraints' => [
                        new NotBlank([
                            'message' => "Veuillez renseigner votre mot de passe."
                        ]),
                        new Length([
                            'min' => 8,
                            'max' => 24,
                            'minMessage' => "Votre mot de passe doit contenir au minimum 8 caractères.",
                            'maxMessage' => "Votre mot de passe doit contenir au maximum 24 caractères."
                        ])
                    ]
                ])
                ->add('roles', ChoiceType::class, [
                'choices' => [
                    'Utilisateur' => 'ROLE_USER',
                    'Vendeur' => 'ROLE_VENDEUR',
                    'Administrateur' => 'ROLE_ADMIN'
                ],
                'expanded' => true,
                'multiple' => true,
                'label' => "Définir le role de l'utilisteur"
                ]);
        }
        elseif($options['adminUserUpdate'] == true)
        {
            $builder
                ->add('adresse', TextType::class, [
                    'required' => false,
                    'constraints' => [
                        new NotBlank([
                            'message' => "Veuillez renseigner votre adresse."
                        ])
                    ]
                ])
                ->add('ville', TextType::class, [
                    'required' => false,
                    'constraints' => [
                        new NotBlank([
                            'message' => "Veuillez renseigner votre ville."
                        ])
                    ]
                ])
                ->add('codePostal', NumberType::class, [
                    'required' => false,
                    'constraints' => [
                        new NotBlank([
                            'message' => "Veuillez renseigner votre code postal."
                        ])
                    ]
                ])
                ->add('prenom', TextType::class, [
                    'required' => false,
                    'constraints' => [
                        new NotBlank([
                            'message' => "Veuillez renseigner votre prenom."
                        ])
                    ]
                ])
                ->add('nom', TextType::class, [
                    'required' => false,
                    'constraints' => [
                        new NotBlank([
                            'message' => "Veuillez renseigner votre nom."
                        ])
                    ]
                ])
                ->add('pseudo', TextType::class, [
                    'required' => false,
                    'constraints' => [
                        new NotBlank([
                            'message' => "Veuillez renseigner votre pseudo."
                        ])
                    ]
                ])
                ->add('email', TextType::class, [
                    'required' => false,
                    'constraints' => [
                        new NotBlank([
                            'message' => "Veuillez renseigner votre adresse mail."
                        ])
                    ]
                ])
                ->add('roles', ChoiceType::class, [
                'choices' => [
                    'Utilisateur' => 'ROLE_USER',
                    'Vendeur' => 'ROLE_VENDEUR',
                    'Administrateur' => 'ROLE_ADMIN'
                ],
                'expanded' => true,
                'multiple' => true,
                'label' => "Définir le role de l'utilisteur"
            ]);
        }
        elseif($options['vendeurUpdate'] == true)
        {
            $builder
                ->add('adresse', TextType::class, [
                    'required' => false,
                    'constraints' => [
                        new NotBlank([
                            'message' => "Veuillez renseigner votre adresse."
                        ])
                    ]
                ])
                ->add('ville', TextType::class, [
                    'required' => false,
                    'constraints' => [
                        new NotBlank([
                            'message' => "Veuillez renseigner votre ville."
                        ])
                    ]
                ])
                ->add('codePostal', NumberType::class, [
                    'required' => false,
                    'constraints' => [
                        new NotBlank([
                            'message' => "Veuillez renseigner votre code postal."
                        ])
                    ]
                ])
                ->add('prenom', TextType::class, [
                    'required' => false,
                    'constraints' => [
                        new NotBlank([
                            'message' => "Veuillez renseigner votre prenom."
                        ])
                    ]
                ])
                ->add('nom', TextType::class, [
                    'required' => false,
                    'constraints' => [
                        new NotBlank([
                            'message' => "Veuillez renseigner votre nom."
                        ])
                    ]
                ])
                ->add('pseudo', TextType::class, [
                    'required' => false,
                    'constraints' => [
                        new NotBlank([
                            'message' => "Veuillez renseigner votre pseudo."
                        ])
                    ]
                ])
                ->add('email', TextType::class, [
                    'required' => false,
                    'constraints' => [
                        new NotBlank([
                            'message' => "Veuillez renseigner votre adresse mail."
                        ])
                    ]
                ])
                ->add('imageProfil', FileType::class, [
                    'label' => "Uploader une image de profil",
                    'mapped' => true,
                    'required' => false,
                    'data_class' => null,
                    'constraints' => [
                        new File([
                            'maxSize' => '5M',
                            'mimeTypes' => [
                                'image/jpeg',
                                'image/png',
                                'image/jpg'
                            ],
                            'mimeTypesMessage' => "Formats autorisé : jpeg, png, jpg."
                        ])
                    ]
                ])
                ->add('banniereProfil', FileType::class, [
                    'label' => "Uploader une bannière ",
                    'mapped' => true,
                    'required' => false,
                    'data_class' => null,
                    'constraints' => [
                        new File([
                            'maxSize' => '5M',
                            'mimeTypes' => [
                                'image/jpeg',
                                'image/png',
                                'image/jpg'
                            ],
                            'mimeTypesMessage' => "Formats autorisé : jpeg, png, jpg."
                        ])
                    ]
                ])
                ->add('description', TextareaType::class, [
                    'required' => false,
                    'attr' => [
                        'placeholder' => "Saisir une description du produit",
                        'rows' => "10"
                    ]
                ]);
        }
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => User::class,
            'userRegistration' => false,
            'userUpdate' => false,
            'adminUserRegistration' => false,
            'adminUserUpdate' => false,
            'vendeurRegistration' => false,
            'vendeurUpdate' => false
        ]);
    }
}
