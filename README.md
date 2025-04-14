# Build end-to-end CI/CD capabilities with Jenkins 
##Description
Ce projet met en œuvre une pipeline CI/CD pour le déploiement d’une application Node js  en utilisant Jenkins, SonarQube, Docker, Terraform, et AWS. L'objectif principal est d'automatiser le processus de développement, de test, et de déploiement en utilisant des pratiques DevSecOps.


##Overview:

![Logo de mon projet](.images\Untitled-2024-12-13-1430.excalidraw.png)

##Fonctionnalités:

-Pipeline CI avec Jenkins :

    Installation et scan des dépendances.

    Utilisation de SonarQube pour le SAST (Static Application Security Testing).

    Construction et scan de l'image Docker.

-Pipeline CD en utilisant Terraform:

    Création d'un VPC (Virtual Private Cloud) sur AWS avec des sous-réseaux publics et privés pour isoler les ressources.

    Déploiement de l'application sur AWS.

    Mise en place d’un ASG (Auto Scaling Group) 


