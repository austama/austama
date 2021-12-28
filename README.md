# Austama

Austama, qui signifie Hommage en Estonien, est un hommage à toutes ces
victimes anonymes post-vaccinations. Ces victimes minoritaires qui
sont fréquemment ridiculisés et mis au ban de la société.

Ces témoignages ont été récupéré sur plusieurs sites et traduit, pour
que tout le monde ne puisse plus dire "nous ne savions pas".

## Autour du Projet

Ce projet a été conçu pour accueillir les sources des tracts et autres
posters contenant les témoignages. Les sources sont disponibles dans
le domaine publique. Les témoignages appartiennent aux victimes.

## Prérequis

Ce code est utilisable avec les outils GNU/Linux/Unix de base. Il a été conçu
pour être flexible. Voici la liste des outils utilisés:

 - pdflatex
 
 - pdfjam
 
 - convert (ImageMagick)
 
 - pdftopng

## Aide

Une aide est disponible en utilisant la commande suivante:

```
cd src
make help
```

## Compiler le projet

Austama nécessite l'utilisation de Latex et est compilable sur les systèmes
Unix/Linux. Le support linguistique a été rajouté. Voici comment compiler le
projet:

```sh
cd src
make all LANGUAGE=$LANGUAGE
```

La variable `LANGUAGE` est utilisée pour configurer le langage désirée. Par
défaut, cette variable est configurée avec la langue `fr`.

| Langage    | `LANGUAGE`    |
|------------|---------------|
| allemand   | `LANGUAGE=de` |
| anglais    | `LANGUAGE=en` |
| espagnol   | `LANGUAGE=es` |
| français   | `LANGUAGE=fr` |
| russe      | `LANGUAGE=ru` |
| portuguais | `LANGUAGE=pt` |

Les fichiers produits se trouvent dans les répertoires `output`.

## Liste des tâches

 - [x] Création du projet en open-source
   - [x] License Libre

 - [ ] Sources
   - [x] (anglais)  https://nomoresilence.world/
   - [ ] (anglais)  https://t.me/covidvaccineinjuries
   - [ ] (anglais)  https://t.me/anastaci91
   - [ ] (anglais)  https://www.vaxtestimonies.org/en/
   - [ ] (français) https://reinfocovid.fr/temoignages/
   - [ ] (français) https://twitter.com/verity_france
   - [ ] (anglais)  https://www.realnotrare.com
   - [ ] (anglais)  https://thecovidworld.com/testimonials
   - [ ] (français) https://effets-secondaires-vaccins-covid.org/témoignage
   - [ ] (allemand) https://www.direktdemokratisch.jetzt/impfopfer-archiv/

 - [ ] Support Linguistique
   - [x] Support de l'anglais
   - [x] Support du français
   - [x] Support du russe
   - [x] Support de l'allemand
   - [x] Support du portuguais
   - [x] Support de l'espagnol
   - [ ] Support de l'italien
   - [ ] Support du japonais
   - [ ] Support du mandarin
   - [ ] Support de l'arabe
 
 - [ ] Interface et Développements (Latex)
   - [x] Création d'une interface commune pour les données et meta-données
   - [x] Ajout du support d'un outil de traduction
   - [x] Ajout du support des qr-code
   - [x] Ajout du support des meta-données

 - [ ] Développement
   - [ ] Création d'un base de donnée exportable
   - [ ] Création d'une API pour faciliter l'accès aux données

 - [ ] Création de templates
   - [x] Création d'un template affiche format A4
   - [ ] Création d'un template affiche format A3
   - [ ] Création d'un template affiche format A2
   - [ ] Création d'un template pour un format livre/recueil A4
   - [ ] Création d'un template pour un format livre/recueil A5

 - [ ] Format et Export
   - [x] Export au format pdf
   - [x] Export au format png
   - [x] Export au format jpeg
   - [ ] Export au format epub

 - [ ] Version et Diffusion
   - [ ] Intégration continue du projet dans github
   - [ ] Release automatique

 - [ ] Communication
   - [x] Création d'un canal Telegram
   - [ ] Création d'un compte Twitter
   - [ ] Création d'un compte Gtter
   - [ ] Création d'un site web

 - [ ] Documentation et procédures
   - [ ] Exemples
   - [ ] Procédure de traduction
   - [ ] Procédure de correction
   - [ ] Procédure de publication
   - [ ] Procédure d'annonce

 - [ ] Recherche
   - [ ] Recherche des sources annexes pour les témoignages
   - [ ] Ajouter des sources en provenance d'autres pays (Indes, Australie, Amérique Latine...)
   - [ ] Documenter les effets indésirables (et ajouter les études)

# Remerciement

Merci à tous les anonymes qui ont participés à ce projet.
