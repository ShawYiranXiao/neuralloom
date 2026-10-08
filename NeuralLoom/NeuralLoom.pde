/*************************************************************************************
NeuralLoom

This interdisciplinary project offers an artistic perspective on the output layer views of image convolutional neural networks, providing an insight into the process of how these models perceive and analyze visual information.
 
Author: Yiran(Shaw) Xiao (c) 2024         

Created in M259, instructor George Legrady, Media Arts & Technology, UCSB, Winter 2024

Images from ImageNet

Image labeled Tropical Fish is from: https://stock.adobe.com/search?k=%22colorful+fish%22&asset_id=557799051, Author: jaz_online. This image is used as a test image, kept as its good color.

Sound effect resources from freesound authors: emceeciscokid, sub-d, blakengouda, MikeOscarFoxtrot, Hewn.Marrow, mtcband, logicmoon, voxlab, GRD-music-, phonosUPF, jukhau

Realized in Processing 4
 *************************************************************************************/


import processing.sound.*;

import peasy.*;
import controlP5.*;

PImage img;

ControlP5 cp5;
PeasyCam cam;

PFont sathuFont;

ArrayList<ArrayList<float[][]>> layers;
String[] fileNames = {
  "avgpool_activations.csv",
  "features_12_activations.csv", "features_11_activations.csv",
  "features_10_activations.csv", "features_9_activations.csv",
  "features_8_activations.csv", "features_7_activations.csv",
  "features_6_activations.csv", "features_5_activations.csv",
  "features_4_activations.csv", "features_3_activations.csv",
  "features_2_activations.csv", "features_1_activations.csv",
  "features_0_activations.csv"
};

String[][] fileGroups = {
  // 1 tropical fish
  {
    "colorful-fish-swimming-among-a-vibrant-coral-reef-3d-style-illuminated-by-neon-and-fluorescent-lu.jpeg",
    "avgpool_activations.csv",
    "features_12_activations.csv", "features_11_activations.csv",
    "features_10_activations.csv", "features_9_activations.csv",
    "features_8_activations.csv", "features_7_activations.csv",
    "features_6_activations.csv", "features_5_activations.csv",
    "features_4_activations.csv", "features_3_activations.csv",
    "features_2_activations.csv", "features_1_activations.csv",
    "features_0_activations.csv"
  },
  // goldfish
  {
    "n01443537_288.JPEG",
    "gold_avgpool_activations.csv",
    "gold_features_12_activations.csv", "gold_features_11_activations.csv",
    "gold_features_10_activations.csv", "gold_features_9_activations.csv",
    "gold_features_8_activations.csv", "gold_features_7_activations.csv",
    "gold_features_6_activations.csv", "gold_features_5_activations.csv",
    "gold_features_4_activations.csv", "gold_features_3_activations.csv",
    "gold_features_2_activations.csv", "gold_features_1_activations.csv",
    "gold_features_0_activations.csv"
  },
  // Fly agaric
  {
    "n12998815_184.JPEG",
    "agaric_avgpool_activations.csv",
    "agaric_features_12_activations.csv", "agaric_features_11_activations.csv",
    "agaric_features_10_activations.csv", "agaric_features_9_activations.csv",
    "agaric_features_8_activations.csv", "agaric_features_7_activations.csv",
    "agaric_features_6_activations.csv", "agaric_features_5_activations.csv",
    "agaric_features_4_activations.csv", "agaric_features_3_activations.csv",
    "agaric_features_2_activations.csv", "agaric_features_1_activations.csv",
    "agaric_features_0_activations.csv"
  },

  // volcanic
  {
    "n09472597_1306.JPEG",
    "volcanic_avgpool_activations.csv",
    "volcanic_features_12_activations.csv", "volcanic_features_11_activations.csv",
    "volcanic_features_10_activations.csv", "volcanic_features_9_activations.csv",
    "volcanic_features_8_activations.csv", "volcanic_features_7_activations.csv",
    "volcanic_features_6_activations.csv", "volcanic_features_5_activations.csv",
    "volcanic_features_4_activations.csv", "volcanic_features_3_activations.csv",
    "volcanic_features_2_activations.csv", "volcanic_features_1_activations.csv",
    "volcanic_features_0_activations.csv"
  },

  // daisy
  {
    "n11939491_662.JPEG",
    "daisy_avgpool_activations.csv",
    "daisy_features_12_activations.csv", "daisy_features_11_activations.csv",
    "daisy_features_10_activations.csv", "daisy_features_9_activations.csv",
    "daisy_features_8_activations.csv", "daisy_features_7_activations.csv",
    "daisy_features_6_activations.csv", "daisy_features_5_activations.csv",
    "daisy_features_4_activations.csv", "daisy_features_3_activations.csv",
    "daisy_features_2_activations.csv", "daisy_features_1_activations.csv",
    "daisy_features_0_activations.csv"
  },

  // rearview mirror
  {
    "n02965783_40.JPEG",
    "mirror_avgpool_activations.csv",
    "mirror_features_12_activations.csv", "mirror_features_11_activations.csv",
    "mirror_features_10_activations.csv", "mirror_features_9_activations.csv",
    "mirror_features_8_activations.csv", "mirror_features_7_activations.csv",
    "mirror_features_6_activations.csv", "mirror_features_5_activations.csv",
    "mirror_features_4_activations.csv", "mirror_features_3_activations.csv",
    "mirror_features_2_activations.csv", "mirror_features_1_activations.csv",
    "mirror_features_0_activations.csv"
  },

  // theater
  {
    "n03032252_600.JPEG",
    "theater_avgpool_activations.csv",
    "theater_features_12_activations.csv", "theater_features_11_activations.csv",
    "theater_features_10_activations.csv", "theater_features_9_activations.csv",
    "theater_features_8_activations.csv", "theater_features_7_activations.csv",
    "theater_features_6_activations.csv", "theater_features_5_activations.csv",
    "theater_features_4_activations.csv", "theater_features_3_activations.csv",
    "theater_features_2_activations.csv", "theater_features_1_activations.csv",
    "theater_features_0_activations.csv"
  }
};


int maxRows = 0;
int maxCols = 0;

int layerSpacing = 80;

float boxSize = 2.5;
int expandLayer = 50;
float hoverRadius = 50;
float hoverTextSize = 18;

int limitChannel = 20;

int linesCount = 150;
float lineLength = 260;
float[] targetAngles = new float[linesCount];
float[] targetLengths = new float[linesCount];

ArrayList<String> hoverValues = new ArrayList<String>();
String hoveredData = "";

int lastUpdate = 0;
int updateInterval = 0;

String currentText = "TROPICAL FISH";

SoundFile soundFeature0, soundFeature1, soundFeature2, soundFeature3,
  soundFeature4, soundFeature5, soundFeature6, soundFeature7, soundFeature8,
  soundFeature9, soundFeature10, soundFeature11, soundFeature12, soundFeature13, soundFeature14;

void setup() {
  //size(2300, 1200, P3D);
  //surface.setResizable(true); 
  fullScreen(P3D);
  cam = new PeasyCam(this, 1100);
  cp5 = new ControlP5(this);
  setGui();
  addRightAlignedTextLabels();
  cp5.setAutoDraw(false);
  sathuFont = createFont("Sathu", 20, true);

  for (int i = 0; i < linesCount; i++) {
    targetAngles[i] = random(TWO_PI);
    targetLengths[i] = random(50, lineLength);
  }
  layers = new ArrayList<ArrayList<float[][]>>();
  for (String fileName : fileNames) {
    loadCSVData(fileName);
  }
  println("Loaded layers: " + layers.size() + " with maxRows: " + maxRows + ", maxCols: " + maxCols);

  img = loadImage("colorful-fish-swimming-among-a-vibrant-coral-reef-3d-style-illuminated-by-neon-and-fluorescent-lu.jpeg");
  img.resize(maxCols, maxRows);
  updateButtonStates(0);

  soundFeature0 = new SoundFile(this, "0.wav");
  soundFeature1 = new SoundFile(this, "1.wav");
  soundFeature2 = new SoundFile(this, "2.aiff");
  soundFeature3 = new SoundFile(this, "3.wav");
  soundFeature4 = new SoundFile(this, "4.wav");
  soundFeature5 = new SoundFile(this, "5.wav");
  soundFeature6 = new SoundFile(this, "6.wav");
  soundFeature7 = new SoundFile(this, "7.wav");
  soundFeature8 = new SoundFile(this, "8.wav");
  soundFeature9 = new SoundFile(this, "9.wav");
  soundFeature10 = new SoundFile(this, "a.wav");
  soundFeature11 = new SoundFile(this, "b.wav");
  soundFeature12 = new SoundFile(this, "c.wav");
  soundFeature13 = new SoundFile(this, "d.wav");
  soundFeature14 = new SoundFile(this, "0.wav");
}

void draw() {
  background(0);
  boolean drawLayers = true;

  if (showFeature0) {
    displayFeature0Activations();
    drawLayers = false;
  } else if (showFeature1) {
    displayFeature1Activations();
    drawLayers = false;
  } else if (showFeature2) {
    displayFeature2Activations();
    drawLayers = false;
  } else if (showFeature3) {
    displayFeature3Activations();
    drawLayers = false;
  } else if (showFeature4) {
    displayFeature4Activations();
    drawLayers = false;
  } else if (showFeature5) {
    displayFeature5Activations();
    drawLayers = false;
  } else if (showFeature6) {
    displayFeature6Activations();
    drawLayers = false;
  } else if (showFeature7) {
    displayFeature7Activations();
    drawLayers = false;
  } else if (showFeature8) {
    displayFeature8Activations();
    drawLayers = false;
  } else if (showFeature9) {
    displayFeature9Activations();
    drawLayers = false;
  } else if (showFeature10) {
    displayFeature10Activations();
    drawLayers = false;
  } else if (showFeature11) {
    displayFeature11Activations();
    drawLayers = false;
  } else if (showFeature12) {
    displayFeature12Activations();
    drawLayers = false;
  } else if (showFeature13) {
    displayFeature13Activations();
    drawLayers = false;
  }

  if (drawLayers) {
    hoveredData = "";
    hoverValues.clear();
    translate(-maxCols * 10 / 2, -maxRows * 10 / 2, -layers.size() * layerSpacing / 2);

    for (int layerIndex = 0; layerIndex < layers.size(); layerIndex++) {
      ArrayList<float[][]> layer = layers.get(layerIndex);
      int channelCount = 0;
      boolean isRandomLayer = layerIndex < layers.size() - 1;
      for (float[][] channel : layer) {
        if (channelCount >= limitChannel) break;
        for (int i = 0; i < channel.length; i++) {
          for (int j = 0; j < channel[i].length; j++) {
            float value = channel[i][j];
            pushMatrix();
            translate(j * 10, i * 10, map(value, 0, 15, 0, expandLayer));
            noStroke();
            color pixelColor = isRandomLayer ? img.get((int)random(img.width), (int)random(img.height)) : img.get(j, i);
            fill(pixelColor);
            box(boxSize);
            popMatrix();

            float boxScreenX = screenX(j * 10.0f, i * 10.0f, map(value, 0, 10, 0, 50));
            float boxScreenY = screenY(j * 10.0f, i * 10.0f, map(value, 0, 10, 0, 50));
            if (dist(mouseX, mouseY, boxScreenX, boxScreenY) < hoverRadius && hoverValues.size() < linesCount) {
              hoverValues.add(nf(value, 1, 2));
              if (hoveredData.equals("")) {
                hoveredData = "Value: " + nf(value, 1, 2);
              }
            }
          }
        }
        channelCount++;
      }
      translate(0, 0, layerSpacing);
    }
    if (!hoveredData.equals("")) {
      displayHoveredData(hoveredData);
      drawHoverEffect();
    }
    cam.beginHUD();
    fill(255);
    textSize(18);
    textFont(createFont("Sathu", 18));
    textAlign(LEFT, TOP);
    text(currentText, 20, 20);
    cam.endHUD();
  }
  gui();
}
