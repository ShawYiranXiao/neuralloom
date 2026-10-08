boolean showFeature0 = false;
boolean showFeature1 = false;
boolean showFeature2 = false;
boolean showFeature3 = false;
boolean showFeature4 = false;
boolean showFeature5 = false;
boolean showFeature6 = false;
boolean showFeature7 = false;
boolean showFeature8 = false;
boolean showFeature9 = false;
boolean showFeature10 = false;
boolean showFeature11 = false;
boolean showFeature12 = false;
boolean showFeature13 = false;

boolean showAllLayers = false;

int currentChannelIndex = 0;
int fadeAmount = 0;
boolean fadingIn = true;
boolean holdingFullOpacity = false;
boolean holdingFullTransparency = false;
long startHoldingOpacityTime = 0;
long startHoldingTransparencyTime = 0;

float featureBoxSize = 5;
int featureexpandLayer = 350;

boolean pauseFade = false;

void updateFading() {
  if (pauseFade) {
    return;
  }

  long currentTime = millis();
  if (fadeAmount >= 255 && !holdingFullOpacity) {
    holdingFullOpacity = true;
    startHoldingOpacityTime = currentTime;
  }
  if (fadeAmount <= 0 && !holdingFullTransparency) {
    holdingFullTransparency = true;
    startHoldingTransparencyTime = currentTime;
  }
  if (holdingFullOpacity && currentTime - startHoldingOpacityTime > 2000) {
    holdingFullOpacity = false;
    fadingIn = false;
  }
  if (holdingFullTransparency && currentTime - startHoldingTransparencyTime > 1000) {
    holdingFullTransparency = false;
    fadingIn = true;
    currentChannelIndex = (currentChannelIndex + 1) % layers.get(layers.size() - (showFeature0 ? 1 : 2)).size();
  }
  if (!holdingFullOpacity && !holdingFullTransparency) {
    if (fadingIn) {
      fadeAmount = min(fadeAmount + 5, 255);
    } else {
      fadeAmount = max(fadeAmount - 5, 0);
    }
  }
}

void renderActivations(ArrayList<float[][]> featureLayer, boolean useRandomColor) {
  translate(-maxCols * 10 / 2, -maxRows * 10 / 2, 0);
  float[][] channel = featureLayer.get(currentChannelIndex);
  for (int i = 0; i < channel.length; i++) {
    for (int j = 0; j < channel[i].length; j++) {
      float value = channel[i][j];
      pushMatrix();
      translate(j * 10, i * 10, map(value, 0, 15, 0, featureexpandLayer));
      noStroke();
      color pixelColor;
      if (useRandomColor) {
        pixelColor = img.get((int)random(img.width), (int)random(img.height));
      } else {
        pixelColor = img.get(j, i);
      }
      fill(red(pixelColor), green(pixelColor), blue(pixelColor), fadeAmount);
      box(featureBoxSize);
      popMatrix();
    }
  }
}

void displayLayerName(String layerName) {
  cam.beginHUD();
  fill(255);
  textFont(sathuFont, 18);
  textSize(18);
  textAlign(LEFT, TOP);
  text(layerName, 20, 20);
  cam.endHUD();
}

void displayChannelName() {
  String channelName = "Channel " + currentChannelIndex;
  cam.beginHUD();
  fill(255, fadeAmount);
  textFont(sathuFont, 18);
  textAlign(CENTER, BOTTOM);
  text(channelName, width / 2, height - 20);
  cam.endHUD();
  ;
}

void displayFeature0Activations() {
  ArrayList<float[][]> feature0Layer = layers.get(layers.size() - 1);
  updateFading();
  //translate(0,0, -100);
  renderActivations(feature0Layer, false);
  displayLayerName("Feature 0");
  displayChannelName();
}

void displayFeature1Activations() {
  ArrayList<float[][]> feature1Layer = layers.get(layers.size() - 2);
  updateFading();
  renderActivations(feature1Layer, true);
  displayLayerName("Feature 1");
  displayChannelName();
}

void displayFeature2Activations() {
  ArrayList<float[][]> feature2Layer = layers.get(layers.size() - 3);
  updateFading();
  float offsetX = 150;
  float offsetY = 150;
  translate(offsetX, offsetY, 0);
  renderActivations(feature2Layer, true);
  displayLayerName("Feature 2");
  displayChannelName();
}

void displayFeature3Activations() {
  ArrayList<float[][]> feature3Layer = layers.get(layers.size() - 4);
  updateFading();
  float offsetX = 150;
  float offsetY = 150;
  translate(offsetX, offsetY, 0);
  renderActivations(feature3Layer, true);
  displayLayerName("Feature 3");
  displayChannelName();
}

void displayFeature4Activations() {
  ArrayList<float[][]> feature4Layer = layers.get(layers.size() - 5);
  updateFading();
  float offsetX = 150;
  float offsetY = 150;
  translate(offsetX, offsetY, 0);
  renderActivations(feature4Layer, true);
  displayLayerName("Feature 4");
  displayChannelName();
}

void displayFeature5Activations() {
  ArrayList<float[][]> feature5Layer = layers.get(layers.size() - 6);
  updateFading();
  float offsetX = 215;
  float offsetY = 220;
  translate(offsetX, offsetY, 0);
  renderActivations(feature5Layer, true);
  displayLayerName("Feature 5");
  displayChannelName();
}

void displayFeature6Activations() {
  ArrayList<float[][]> feature6Layer = layers.get(layers.size() - 7);
  updateFading();
  float offsetX = 215;
  float offsetY = 220;
  translate(offsetX, offsetY, 0);
  renderActivations(feature6Layer, true);
  displayLayerName("Feature 6");
  displayChannelName();
}

void displayFeature7Activations() {
  ArrayList<float[][]> feature7Layer = layers.get(layers.size() - 8);
  updateFading();
  float offsetX = 215;
  float offsetY = 220;
  translate(offsetX, offsetY, 0);

  renderActivations(feature7Layer, true);
  displayLayerName("Feature 7");
  displayChannelName();
}

void displayFeature8Activations() {
  ArrayList<float[][]> feature8Layer = layers.get(layers.size() - 9);
  updateFading();
  float offsetX = 215;
  float offsetY = 220;
  translate(offsetX, offsetY, 0);

  renderActivations(feature8Layer, true);
  displayLayerName("Feature 8");
  displayChannelName();
}

void displayFeature9Activations() {
  ArrayList<float[][]> feature9Layer = layers.get(layers.size() - 10);
  updateFading();
  float offsetX = 215;
  float offsetY = 220;
  translate(offsetX, offsetY, 0);
  renderActivations(feature9Layer, true);
  displayLayerName("Feature 9");
  displayChannelName();
}

void displayFeature10Activations() {
  ArrayList<float[][]> feature10Layer = layers.get(layers.size() - 11);
  updateFading();
  float offsetX = 215;
  float offsetY = 220;
  translate(offsetX, offsetY, 0);
  renderActivations(feature10Layer, true);
  displayLayerName("Feature 10");
  displayChannelName();
}

void displayFeature11Activations() {
  ArrayList<float[][]> feature11Layer = layers.get(layers.size() - 12);
  updateFading();
  float offsetX = 215;
  float offsetY = 220;
  translate(offsetX, offsetY, 0);
  renderActivations(feature11Layer, true);
  displayLayerName("Feature 11");
  displayChannelName();
}

void displayFeature12Activations() {
  ArrayList<float[][]> feature12Layer = layers.get(layers.size() - 13);
  updateFading();
  float offsetX = 250;
  float offsetY = 250;
  translate(offsetX, offsetY, 0);
  renderActivations(feature12Layer, true);
  displayLayerName("Feature 12");
  displayChannelName();
}

void displayFeature13Activations() {
  ArrayList<float[][]> feature13Layer = layers.get(layers.size() - 14);
  updateFading();
  float offsetX = 250;
  float offsetY = 250;
  translate(offsetX, offsetY, 0);
  renderActivations(feature13Layer, true);
  displayLayerName("Average Pool");
  displayChannelName();
}
