/*
   communication micro:bit -> arduino
   Workshop Sol Vivant @ Kerminy, 18 mai 2022
   groupe «art de poule»
   
   notes : le mcirobit transmet à 115200 bauds
 */

import processing.serial.*;

Serial myPort;
float dist1 = 0, dist2 = 0, dist3 = 0;

void setup() {
  size(1023, 400);
    
  printArray(Serial.list()); // IDENTIFIER LE PORT SUR LEQUEL EST RELIE LE MICRO:BIT
  String portName = Serial.list()[0]; // Port 0 dans mon cas
  myPort = new Serial(this, portName, 115200); // Ouvrir la communication sur ce port à 115200 bauds
  myPort.bufferUntil('\n');                  // la fin du message est signifiée par un retour à la ligne
}

void draw() {
  background(0);
  fill(255);
  textSize(24);
  text(dist1, 100, 150);
  text(dist2, 100, 200);
  text(dist3, 100, 250);
}

void serialEvent(Serial myPort) {             // Réagir en cas d'évènement série
  try {                                       // (la structure try/catch est une gestion d'erreurs)
    while (myPort.available() > 0) {                  // Si le port est disponible
      String inBuffer = myPort.readStringUntil('\n'); // Lire les données transmises jusqu'au retour à la ligne
      if (inBuffer != null) {                         // Si le message est pas vide
        try {
          String texte = inBuffer;                      // Alors mettre les données dans une variable
          println(texte);                               // Et l'afficher sur la console
          // Traiter le message
          String[] list = split(inBuffer, ",");         // Découper le message pour récupérer les données
          dist1 = float(list[0]);                     // Transformer la donnée texte en nombre flottant
          dist2 = float(list[1]);
          dist3 = float(list[2]);
        }
        catch(NumberFormatException npe) {
        }
      }
    }
  }
  catch(Exception e) {
  }
}
