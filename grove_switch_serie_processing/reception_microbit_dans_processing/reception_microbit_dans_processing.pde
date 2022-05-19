

/*
   communication micro:bit -> arduino
   Workshop Sol Vivant @ Kerminy, 19 mai 2022
   groupe «rhododendron»
   
   notes : le mcirobit transmet à 115200 bauds
 */

import processing.serial.*;
import processing.sound.*;

Serial myPort;
float declenchement;

SoundFile son_principal;
SoundFile son_grogne;

void setup() {
  size(1023, 400);
    
  printArray(Serial.list()); // IDENTIFIER LE PORT SUR LEQUEL EST RELIE LE MICRO:BIT
  String portName = Serial.list()[0]; // Port 0 dans mon cas
  myPort = new Serial(this, portName, 115200); // Ouvrir la communication sur ce port à 115200 bauds
  myPort.bufferUntil('\n');                  // la fin du message est signifiée par un retour à la ligne

  son_principal = new SoundFile(this, "son_principal.wav");
  son_grogne    = new SoundFile(this, "son_grogne.wav");
 
  son_principal.loop();
}

void draw() {
  background(0);
  fill(255);
  textSize(24);
  text("declenchement : " + declenchement, 100, 150);
  
  if (declenchement == 1) {
    if (!son_grogne.isPlaying()) son_grogne.play();
  }
}

void serialEvent(Serial myPort) {             // Réagir en cas d'évènement série
  try {                                       // (la structure try/catch est une gestion d'erreurs)
    while (myPort.available() > 0) {                  // Si le port est disponible
      String inBuffer = myPort.readStringUntil('\n'); // Lire les données transmises jusqu'au retour à la ligne
      if (inBuffer != null) {                         // Si le message est pas vide
        try {
          String texte = inBuffer;                    // Alors mettre les données dans une variable
          println(texte);                             // Et l'afficher sur la console
          // Traiter le message
          String[] list = split(inBuffer, ",");       // Découper le message pour récupérer les données
          declenchement = float(list[0]);             // Transformer la donnée texte en nombre flottant
        }
        catch(NumberFormatException npe) {
        }
      }
    }
  }
  catch(Exception e) {
  }
}
