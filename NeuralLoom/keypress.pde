void keyPressed() {
  switch (key) {
  case '0':
    showFeature0 = true;
    showFeature1 = showFeature2 = showFeature3 = showFeature4 = showFeature5 = showFeature6 = showFeature7 = showFeature8 = showFeature9 = showFeature10 = showFeature11 = showFeature12 = showFeature13 = false;
    cam.setDistance(600);
    soundFeature0.play();
    break;
  case '1':
    showFeature1 = true;
    showFeature0 = showFeature2 = showFeature3 = showFeature4 = showFeature5 = showFeature6 = showFeature7 = showFeature8 = showFeature9 = showFeature10 = showFeature11 = showFeature12 = showFeature13 = false;
    cam.setDistance(600);
    soundFeature1.play();
    break;
  case '2':
    showFeature2 = true;
    showFeature0 = showFeature1 = showFeature3 = showFeature4 = showFeature5 = showFeature6 = showFeature7 = showFeature8 = showFeature9 = showFeature10 = showFeature11 = showFeature12 = showFeature13 = false;
    cam.setDistance(500);
    soundFeature2.play();
    break;
  case '3':
    showFeature3 = true;
    showFeature0 = showFeature1 = showFeature2 = showFeature4 = showFeature5 = showFeature6 = showFeature7 = showFeature8 = showFeature9 = showFeature10 = showFeature11 = showFeature12 = showFeature13 = false;
    cam.setDistance(500);
    soundFeature3.play();
    break;
  case '4':
    showFeature4 = true;
    showFeature0 = showFeature1 = showFeature2 = showFeature3 = showFeature5 = showFeature6 = showFeature7 = showFeature8 = showFeature9 = showFeature10 = showFeature11 = showFeature12 = showFeature13 = false;
    cam.setDistance(500);
    soundFeature4.play();
    break;
  case '5':
    showFeature5 = true;
    showFeature0 = showFeature1 = showFeature2 = showFeature3 = showFeature4 = showFeature6 = showFeature7 = showFeature8 = showFeature9 = showFeature10 = showFeature11 = showFeature12 = showFeature13 = false;
    cam.setDistance(500);
    soundFeature5.play();
    break;
  case '6':
    showFeature6 = true;
    showFeature0 = showFeature1 = showFeature2 = showFeature3 = showFeature4 = showFeature5 = showFeature7 = showFeature8 = showFeature9 = showFeature10 = showFeature11 = showFeature12 = showFeature13 = false;
    cam.setDistance(500);
    soundFeature6.play();
    break;
  case '7':
    showFeature7 = true;
    showFeature0 = showFeature1 = showFeature2 = showFeature3 = showFeature4 = showFeature5 = showFeature6 = showFeature8 = showFeature9 = showFeature10 = showFeature11 = showFeature12 = showFeature13 = false;
    cam.setDistance(500);
    soundFeature7.play();
    break;
  case '8':
    showFeature8 = true;
    showFeature0 = showFeature1 = showFeature2 = showFeature3 = showFeature4 = showFeature5 = showFeature6 = showFeature7 = showFeature9 = showFeature10 = showFeature11 = showFeature12 = showFeature13 = false;
    cam.setDistance(500);
    soundFeature8.play();
    break;
  case '9':
    showFeature9 = true;
    showFeature0 = showFeature1 = showFeature2 = showFeature3 = showFeature4 = showFeature5 = showFeature6 = showFeature7 = showFeature8 = showFeature10 = showFeature11 = showFeature12 = showFeature13 = false;
    cam.setDistance(500);
    soundFeature9.play();
    break;
  case 'A':
  case 'a':
    showFeature10 = true;
    showFeature0 = showFeature1 = showFeature2 = showFeature3 = showFeature4 = showFeature5 = showFeature6 = showFeature7 = showFeature8 = showFeature9 = showFeature11 = showFeature12 = showFeature13 = false;
    cam.setDistance(500);
    soundFeature10.play();
    break;
  case 'B':
  case 'b':
    showFeature11 = true;
    showFeature0 = showFeature1 = showFeature2 = showFeature3 = showFeature4 = showFeature5 = showFeature6 = showFeature7 = showFeature8 = showFeature9 = showFeature10 = showFeature12 = showFeature13 = false;
    cam.setDistance(500);
    soundFeature11.play();
    break;
  case 'C':
  case 'c':
    showFeature12 = true;
    showFeature0 = showFeature1 = showFeature2 = showFeature3 = showFeature4 = showFeature5 = showFeature6 = showFeature7 = showFeature8 = showFeature9 = showFeature10 = showFeature11 = showFeature13 = false;
    cam.setDistance(500);
    soundFeature12.play();
    break;
  case 'D':
  case 'd':
    showFeature13 = true;
    showFeature0 = showFeature1 = showFeature2 = showFeature3 = showFeature4 = showFeature5 = showFeature6 = showFeature7 = showFeature8 = showFeature9 = showFeature10 = showFeature11 = showFeature12 = false;
    cam.setDistance(500);
    soundFeature13.play();
    break;
  case 'x':
  case 'X':
    showFeature0 = showFeature1 = showFeature2 = showFeature3 = showFeature4 = showFeature5 = showFeature6 = showFeature7 = showFeature8 = showFeature9 = showFeature10 = showFeature11 = showFeature12 = showFeature13 = false;
    cam.setDistance(1100);
    soundFeature14.play();
    break;

  case 's':
  case 'S':
    saveFrame("NeuralLoom-####.png");
    println("Canvas saved!");
    break;
  }
}
