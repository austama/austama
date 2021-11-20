# Boite à Outil du Créateur

Un nouveau témoignage a été diffusé et il est nécessaire de le rajouter dans la
liste des témoignages. Vous êtes donc un créateur, et vous serez en charge de
concevoir le fichier LaTex. Par chance, la structure est relativement simple à
comprendre, car elle utilise en grande partie un système de template.

## Création de la référence

À l'heure où ces lignes sont écrites, la référence est un hash utilisant l'URL
du site. A terme cette fonctionnalité devra être changé.

```sh
echo https://monsite.com/mon-temoignage | sha1sum
```

Note: le prochain format sera probablement quelque chose comme
`language-pays-region-city-lastname-firstname`

## Création du Contenu de la Référence

Le dossier contient les éléments suivants:

 - un fichier `Makefile` contenant une simple référence au fichier
   `mk/testimony.mk`.

```make
include ../../mk/testimony.mk
```
 
 - un fichier `picture.jpg` correspondant à l'image utilisé dans le témoignage
   au format JPEG.
 
 - des fichiers de témoignages `template_<lang>.tex` où `<lang>` est la langue
   utilisée pour ce témoignage, par exemple `template_fr.tex` correspond au
   témoignage en français. Ces fichiers utilisent le format LaTex et un macro
   spécifiquement créé pour les témoignages. En voici un exemple:

```tex
\testimony{Firstname Lastname}
    {City, Region, Country}
    {Age}
    {Vaccine}
    {Date}
    {ADR}
    {picture.jpg}
    {URL}
    {}
```

## Compiler le Fichier

```sh
make LANG=fr
```

Le fichier PDF généré se trouve alors dans le répertoire `output` par défaut.
