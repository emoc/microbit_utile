# microbit utile

## En utilisant makecode / blocks

Éditeur : https://makecode.microbit.org/#editor

Préparer le programme, télécharger le format hex compilé, brancher la carte micro:bit par USB et copier le fichier hex dans le dossier MICROBIT

(Pour ajouter un commentaire dans makecode / blocks, clic droit sur un bloc)

## Petits programmes divers

Pour utiliser le *shield* grove dans makecode / blocks, choisir «avancé» dans le menu, puis «extensions» et chercher «grove».

**grove_switch_serie_processing**  
Avec le *shield* grove, captation d'un switch, envoie de données à processing, déclenchement de son en fonction.

![switch serie processing](./grove_switch_serie_processing/microbit_grove_switch_serie.png)

**grove_distance_ultrason_4digits**  
Avec le *shield* grove, captation de distance par ultrason, affichage sur un écran 4 digits

![distance ultrason 4digits](./grove_distance_ultrason_4digits/microbit_grove_distance_ultrason_4digits.png)

**grove_3xdistance_ultrason_serie**  
Avec le *shield* grove, 3 capteurs de distance à ultrason, un seul message série envoyé vers processing.

![3 x distance ultrason série](./grove_3xdistance_ultrason_serie/microbit_grove_3xdistance_ultrason_serie.png)

**[datalogging_microbit_v2](./datalogging_microbit_v2)**  
Un exemple avec la carte micro:bit version 2 qui peut conserver des données dans la mémoire persistante.
