void displayHoveredData(String data) {
  cam.beginHUD();
  fill(255);
  textFont(sathuFont);
  textSize(18);
  textAlign(TOP, RIGHT);
  text(data, width-120, 30);
  cam.endHUD();
}

void drawHoverEffect() {
  if (hoveredData.equals("") || hoverValues.isEmpty()) return;

  int currentTime = millis();
  if (currentTime - lastUpdate > updateInterval) {
    for (int i = 0; i < linesCount; i++) {
      targetAngles[i] = random(TWO_PI);
      targetLengths[i] = random(50, lineLength);
    }
    lastUpdate = currentTime;
  }
  cam.beginHUD();

  for (int i = 0; i < linesCount && !hoverValues.isEmpty(); i++) {
    float xEnd = mouseX + cos(targetAngles[i]) * targetLengths[i];
    float yEnd = mouseY + sin(targetAngles[i]) * targetLengths[i];
    stroke(255, random(180, 255));
    strokeWeight(0.1);
    line(mouseX, mouseY, xEnd, yEnd);

    String displayValue = hoverValues.get((int)random(hoverValues.size()));
    fill(255, random(120, 255));
    textFont(sathuFont);
    textSize(hoverTextSize);
    text("Value:" + displayValue, xEnd-30, yEnd-20);
  }
  cam.endHUD();
}
