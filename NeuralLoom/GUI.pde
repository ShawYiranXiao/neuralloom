void setGui() {
  PFont pfont = createFont("Sathu", 20, true);
  ControlFont cfont = new ControlFont(pfont);
  //all layers title
  cp5.addTextlabel("labelMainVisual")
    .setText("ALL LAYERS  ☺ Click on the sliders to change number instead of drag")
    .setPosition(17, 80)
    .setColorValue(255)
    .setFont(createFont("Sathu", 15))
    ;

  //interval
  cp5.addSlider("updateInterval")
    .setPosition(20, 110)
    .setSize(150, 20)
    .setRange(0, 1000)
    .setValue(updateInterval)

    .setColorActive(color(239, 68, 127))
    .setColorForeground(color(239, 68, 127))
    .setColorBackground(color(50))

    .setLabel("Update Interval (Speed of Hover Text Motion)")
    .getCaptionLabel().setFont(cfont)
    .toUpperCase(false)
    .setSize(13)
    .setColor(255);

  cp5.getController("updateInterval").getValueLabel().setFont(cfont).setSize(12).setColor(255);

  //number of hover values
  cp5.addSlider("linesCount")
    .setPosition(20, 140)
    .setSize(150, 20)
    .setRange(1, 150)
    .setValue(50)

    .setColorActive(color(239, 68, 127))
    .setColorForeground(color(239, 68, 127))
    .setColorBackground(color(50))

    .setLabel("Hover Text Lines Count")

    .getCaptionLabel().setFont(cfont).toUpperCase(false).setSize(13).setColor(255);
  cp5.getController("linesCount").getValueLabel().setFont(cfont).setSize(12).setColor(255);

  //linelength
  cp5.addSlider("lineLength")
    .setPosition(20, 170)
    .setSize(150, 20)
    .setRange(50, 500)
    .setValue(350)

    .setColorActive(color(239, 68, 127))
    .setColorForeground(color(239, 68, 127))
    .setColorBackground(color(50))

    .setLabel("Hover Text Line Length")

    .getCaptionLabel().setFont(cfont).toUpperCase(false).setSize(13).setColor(255);
  cp5.getController("lineLength").getValueLabel().setFont(cfont).setSize(12).setColor(255);

  //boxsize
  cp5.addSlider("boxSize")
    .setPosition(20, 230)
    .setSize(150, 20)
    .setRange(0.5, 30)
    .setValue(boxSize)

    .setColorActive(color(239, 68, 127))
    .setColorForeground(color(239, 68, 127))
    .setColorBackground(color(50))
    .setLabel("Box Size")
    .getCaptionLabel().setFont(cfont).toUpperCase(false).setSize(13).setColor(255);
  cp5.getController("boxSize").getValueLabel().setFont(cfont).setSize(12).setColor(255);

  //hovertextsize
  cp5.addSlider("hoverTextSize")
    .setPosition(20, 200)
    .setSize(150, 20)
    .setRange(10, 30)
    .setValue(hoverTextSize)
    .setColorActive(color(239, 68, 127))
    .setColorForeground(color(239, 68, 127))
    .setColorBackground(color(50))
    .setLabel("Hover Text Size")
    .getCaptionLabel().setFont(cfont).toUpperCase(false).setSize(13).setColor(255);
  cp5.getController("hoverTextSize").getValueLabel().setFont(cfont).setSize(12).setColor(255);

  //int layerSpacing = 80;
  cp5.addSlider("layerSpacing")
    .setPosition(20, 260)
    .setSize(150, 20)
    .setRange(60, 350)
    .setValue(layerSpacing)
    .setColorActive(color(239, 68, 127))
    .setColorForeground(color(239, 68, 127))
    .setColorBackground(color(50))
    .setLabel("Layer Spacing")
    .getCaptionLabel().setFont(cfont).toUpperCase(false).setSize(13).setColor(255);
  cp5.getController("layerSpacing").getValueLabel().setFont(cfont).setSize(12).setColor(255);

  //int expandLayer = 50;
  cp5.addSlider("expandLayer")
    .setPosition(20, 290)
    .setSize(150, 20)
    .setRange(20, 450)
    .setValue(300)
    .setColorActive(color(239, 68, 127))
    .setColorForeground(color(239, 68, 127))
    .setColorBackground(color(50))
    .setLabel("Expand Layer")
    .getCaptionLabel().setFont(cfont).toUpperCase(false).setSize(13).setColor(255);
  cp5.getController("expandLayer").getValueLabel().setFont(cfont).setSize(12).setColor(255);

  //int limitChannel = 20;
  cp5.addSlider("limitChannel")
    .setPosition(20, 320)
    .setSize(150, 20)
    .setRange(1, 20)
    .setValue(10)
    .setColorActive(color(239, 68, 127))
    .setColorForeground(color(239, 68, 127))
    .setColorBackground(color(50))
    .setLabel("Channel Limitation (Make it larger to see more channels but slower)")
    .getCaptionLabel().setFont(cfont).toUpperCase(false).setSize(13).setColor(255);
  cp5.getController("limitChannel").getValueLabel().setFont(cfont).setSize(12).setColor(255);

  // Individual Layer
  cp5.addTextlabel("labelSubVisual")
    .setText("INDIVIDUAL LAYER  ☺ Works when display the feature 0-12")
    .setPosition(16, 380)
    .setColorValue(255)
    .setFont(createFont("Sathu", 15))
    ;

  //featureBoxSize
  cp5.addSlider("featureBoxSize")
    .setPosition(20, 410)
    .setSize(150, 20)
    .setRange(0.5, 50)
    .setValue(featureBoxSize)
    .setColorActive(color(132, 111, 210))
    .setColorForeground(color(132, 111, 210))
    .setColorBackground(color(50))
    .setLabel("Box Size")
    .getCaptionLabel().setFont(cfont).toUpperCase(false).setSize(13).setColor(255);
  cp5.getController("featureBoxSize").getValueLabel().setFont(cfont).setSize(12).setColor(255);

  //int featureexpandLayer = 350;
  cp5.addSlider("featureexpandLayer")
    .setPosition(20, 440)
    .setSize(150, 20)
    .setRange(20, 2000)
    .setValue(550)
    .setColorActive(color(132, 111, 210))
    .setColorForeground(color(132, 111, 210))
    .setColorBackground(color(50))
    .setLabel("Expand Layer")
    .getCaptionLabel().setFont(cfont).toUpperCase(false).setSize(13).setColor(255);
  cp5.getController("featureexpandLayer").getValueLabel().setFont(cfont).setSize(12).setColor(255);

  //boolean pauseFade = false;
  cp5.addButton("pauseFade")
    .setPosition(20, 470)
    .setSize(60, 30)
    .setLabel("Pause")
    .setColorActive(color(132, 111, 210))
    .setColorForeground(color(132, 111, 210))
    .setColorBackground(pauseFade ? color(132, 111, 210) : color(50))
    .getCaptionLabel().setFont(cfont).toUpperCase(false).setSize(13).setColor(255);
  cp5.getController("pauseFade").getValueLabel().setFont(cfont).setSize(12).setColor(255);

  int initialColor = pauseFade ? color(132, 111, 210) : color(50);
  cp5.getController("pauseFade").setColorBackground(initialColor);

  //categories title
  cp5.addTextlabel("category")
    .setText("CATEGORY  ☺ Use to toggle images")
    .setPosition(16, 540)
    .setColorValue(255)
    .setFont(createFont("Sathu", 15))
    ;

  //tropical fish
  cp5.addButton("tropicalButton")
    .setPosition(20, 570)
    .setSize(30, 30)
    .setLabel(" ")
    .setColorForeground(tropicalActiveColor)
    .setColorActive(tropicalActiveColor)
    .setColorBackground(inactiveColor)
    .onClick(new CallbackListener() {
    public void controlEvent(CallbackEvent event) {
      loadFiles(0);
      updateButtonStates(0);
      currentText = "TROPICAL FISH";
    }
  }
  );

  //tropicalfishlabeltext
  cp5.addTextlabel("blueButtonLabel")
    .setText("Tropical Fish")
    .setPosition(52, 576)
    .setColorValue(255)
    .setFont(createFont("Sathu", 12));

  //goldfish
  cp5.addButton("goldButton")
    .setPosition(20, 610)
    .setSize(30, 30)
    .setLabel(" ")
    .setColorForeground(goldActiveColor)
    .setColorActive(goldActiveColor)
    .setColorBackground(inactiveColor)
    .onClick(new CallbackListener() {
    public void controlEvent(CallbackEvent event) {
      loadFiles(1);
      updateButtonStates(1);
      currentText = "GOLD FISH";
    }
  }
  );

  //goldfishlabeltext
  cp5.addTextlabel("redButtonLabel")
    .setText("Gold Fish")
    .setPosition(52, 616)
    .setColorValue(255)
    .setFont(createFont("Sathu", 12));

  //Fly agaric
  cp5.addButton("agaricButton")
    .setPosition(20, 650)
    .setSize(30, 30)
    .setLabel(" ")
    .setColorForeground(agaricActiveColor)
    .setColorActive(agaricActiveColor)
    .setColorBackground(inactiveColor)
    .onClick(new CallbackListener() {
    public void controlEvent(CallbackEvent event) {
      loadFiles(2);
      updateButtonStates(2);
      currentText = "FLY AGARIC";
    }
  }
  );

  //Fly agariclabeltext
  cp5.addTextlabel("agaricButtonLabel")
    .setText("Fly Agaric")
    .setPosition(52, 656)
    .setColorValue(255)
    .setFont(createFont("Sathu", 12));

  //volcanic
  cp5.addButton("volcanicButton")
    .setPosition(20, 690)
    .setSize(30, 30)
    .setLabel(" ")
    .setColorForeground(volcanicActiveColor)
    .setColorActive(volcanicActiveColor)
    .setColorBackground(inactiveColor)
    .onClick(new CallbackListener() {
    public void controlEvent(CallbackEvent event) {
      loadFiles(3);
      updateButtonStates(3);
      currentText = "VOLCANO";
    }
  }
  );

  //volcanic labeltext
  cp5.addTextlabel("volcanicButtonLabel")
    .setText("Volcano")
    .setPosition(52, 696)
    .setColorValue(255)
    .setFont(createFont("Sathu", 12));

  cp5.addButton("daisyButton")
    .setPosition(20, 730)
    .setSize(30, 30)
    .setLabel(" ")
    .setColorForeground(daisyActiveColor)
    .setColorActive(daisyActiveColor)
    .setColorBackground(inactiveColor)
    .onClick(new CallbackListener() {
    public void controlEvent(CallbackEvent event) {
      loadFiles(4);
      updateButtonStates(4);
      currentText = "DAISY";
    }
  }
  );

  //daisy labeltext
  cp5.addTextlabel("daisyButtonLabel")
    .setText("Daisy")
    .setPosition(52, 736)
    .setColorValue(255)
    .setFont(createFont("Sathu", 12));

  cp5.addButton("mirrorButton")
    .setPosition(20, 770)
    .setSize(30, 30)
    .setLabel(" ")
    .setColorForeground(mirrorActiveColor)
    .setColorActive(mirrorActiveColor)
    .setColorBackground(inactiveColor)
    .onClick(new CallbackListener() {
    public void controlEvent(CallbackEvent event) {
      loadFiles(5);
      updateButtonStates(5);
      currentText = "SIDEVIEW MIRROR";
    }
  }
  );
  //mirror labeltext
  cp5.addTextlabel("mirrorButtonLabel")
    .setText("Sideview Mirror")
    .setPosition(52, 776)
    .setColorValue(255)
    .setFont(createFont("Sathu", 12));

  cp5.addButton("theaterButton")
    .setPosition(20, 810)
    .setSize(30, 30)
    .setLabel(" ")
    .setColorForeground(theaterActiveColor)
    .setColorActive(theaterActiveColor)
    .setColorBackground(inactiveColor)
    .onClick(new CallbackListener() {
    public void controlEvent(CallbackEvent event) {
      loadFiles(6);
      updateButtonStates(6);
      currentText = "THEATER";
    }
  }
  );

  //theater labeltext
  cp5.addTextlabel("theaterButtonLabel")
    .setText("Theater")
    .setPosition(52, 816)
    .setColorValue(255)
    .setFont(createFont("Sathu", 12));

  //dataset origin text
  cp5.addTextlabel("labelRightBottom")
    .setText("Image dataset from: ImageNet. 'image-net.org'")
    .setPosition(width - 300, height - 35)
    .setColorValue(255)
    .setFont(createFont("Sathu", 12));
    
    //instruction text
      cp5.addTextlabel("labelCenterTop")
    .setText("Feel free to drag the mouse to move around! Scroll to zoom in n out. Double-click to reset the view.")
    .setPosition(width - 1500, 35)
    .setColorValue(255)
    .setFont(createFont("Sathu", 16));
    
    //Title text
     cp5.addTextlabel("labelLeftBottom")
    .setText("NeuralLoom")
    .setPosition(35, height - 50)
    .setColorValue(255)
    .setFont(createFont("Sathu", 30));
}

int tropicalActiveColor = color(143, 0, 196);
int goldActiveColor = color(239, 105, 4);
int agaricActiveColor = color(188, 44, 27);
int volcanicActiveColor = color(151, 187, 225);
int daisyActiveColor = color(111, 140, 114);
int mirrorActiveColor = color(235, 231, 228);
int theaterActiveColor = color(174, 180, 226);

int inactiveColor = color(50);

void updateButtonStates(int activeButtonIndex) {
  cp5.getController("tropicalButton").setColorBackground(activeButtonIndex == 0 ? tropicalActiveColor : inactiveColor);
  cp5.getController("goldButton").setColorBackground(activeButtonIndex == 1 ? goldActiveColor : inactiveColor);
  cp5.getController("agaricButton").setColorBackground(activeButtonIndex == 2 ? agaricActiveColor : inactiveColor);
  cp5.getController("volcanicButton").setColorBackground(activeButtonIndex == 3 ? volcanicActiveColor : inactiveColor);
  cp5.getController("daisyButton").setColorBackground(activeButtonIndex == 4 ? daisyActiveColor : inactiveColor);
  cp5.getController("mirrorButton").setColorBackground(activeButtonIndex == 5 ? mirrorActiveColor : inactiveColor);
  cp5.getController("theaterButton").setColorBackground(activeButtonIndex == 6 ? theaterActiveColor : inactiveColor);
}

void pauseFade() {
  pauseFade = !pauseFade;
  int activeColor = color(132, 111, 210);
  int inactiveColor = color(50);
  cp5.getController("pauseFade").setColorBackground(pauseFade ? activeColor : inactiveColor);
}

void gui() {
  hint(DISABLE_DEPTH_TEST);
  cam.beginHUD();
  cp5.draw();
  cam.endHUD();
  hint(ENABLE_DEPTH_TEST);
}

void addRightAlignedTextLabels() {
  int paddingRight = 96;
  int paddingTop = 80;
  int yPosition = paddingTop;

  textSize(15);
  String title = "KEY INSTRUCTIONS";
  float titleWidth = textWidth(title);
  float titleXPosition = width - titleWidth - paddingRight+17;

  cp5.addTextlabel("labelTitle")
    .setText(title)
    .setPosition(titleXPosition, yPosition)
    .setColorValue(255)
    .setFont(createFont("Sathu", 20));

  yPosition += 40;

  String[] keyInstructions = {
    "Feature 0 - Press '0'", "Feature 1 - Press '1'", "Feature 2 - Press '2'",
    "Feature 3 - Press '3'", "Feature 4 - Press '4'", "Feature 5 - Press '5'",
    "Feature 6 - Press '6'", "Feature 7 - Press '7'", "Feature 8 - Press '8'",
    "Feature 9 - Press '9'", "Feature 10 - Press 'A'", "Feature 11 - Press 'B'",
    "Feature 12 - Press 'C'", " Average Pool - Press 'D'", " All Layers - Press 'X'",
    " Save Canvas - Press 'S'"
  };

  textSize(12);

  for (String instruction : keyInstructions) {
    float textWidth = textWidth(instruction);
    float xPosition = width - textWidth - paddingRight;

    cp5.addTextlabel("label" + instruction)
      .setText(instruction)
      .setPosition(xPosition, yPosition)
      .setColorValue(255)
      .setFont(createFont("Sathu", 18));
    yPosition += 30;
  }
}
