void loadCSVData(String fileName) {
  ArrayList<float[][]> channels = new ArrayList<float[][]>();
  String[] lines = loadStrings(fileName);
  ArrayList<float[]> currentChannelData = new ArrayList<float[]>();
  boolean isDataSection = false;

  for (String line : lines) {
    if (line.equals("")) {
      if (!currentChannelData.isEmpty()) {
        channels.add(currentChannelData.toArray(new float[currentChannelData.size()][]));
        currentChannelData.clear();
        isDataSection = false;
      }
    } else if (line.startsWith("Channel")) {
      isDataSection = true;
    } else if (isDataSection) {
      String[] values = line.split(",");
      float[] floatValues = new float[values.length];
      for (int i = 0; i < values.length; i++) {
        floatValues[i] = Float.parseFloat(values[i]);
      }
      currentChannelData.add(floatValues);
      maxRows = max(maxRows, currentChannelData.size());
      maxCols = max(maxCols, values.length);
    }
  }
  if (!currentChannelData.isEmpty()) {
    channels.add(currentChannelData.toArray(new float[currentChannelData.size()][]));
  }
  layers.add(channels);
}

void loadFiles(int groupIndex) {
  layers.clear();
  maxRows = 0;
  maxCols = 0;

  for (int i = 1; i < fileGroups[groupIndex].length; i++) {
    loadCSVData(fileGroups[groupIndex][i]);
  }
  
  img = loadImage(fileGroups[groupIndex][0]);
  if (maxCols > 0 && maxRows > 0) {
    img.resize(maxCols, maxRows);
  } else {
    println("Warning: maxCols and maxRows are not set correctly. Image not resized.");
  }
  println("Loaded image: " + groupIndex + ", layers: " + layers.size() + " with maxRows: " + maxRows + ", maxCols: " + maxCols);
}
