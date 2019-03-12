PImage inputImg;
PImage outputImg;
String outputDest;
int numColors;
int iterations;
PVector[] pixelColors;
Centroid[] centroids;

void setup(){
  // PARAMS
  // can change the file location of the input image
  inputImg = loadImage("exampleInput.jpg");
  // change the output image destination
  outputDest = "exampleOutput.jpg";
  // number of colors to allow in the final output image
  numColors = 16;
  // number of iterations to determine clusters
  iterations = 20;
  
  // load pixels of input image into pixels[]
  inputImg.loadPixels();
  // pixelColors has one element for every pixel in the input image
  pixelColors = new PVector[inputImg.pixels.length];
  // extract the red, green, and blue values of each pixel and use them to 
  // create a vector of rgb points
  for(int i=0; i<inputImg.pixels.length; i++){
    // temporary var holding the color of the current pixel
    color c = inputImg.pixels[i];
    pixelColors[i] = new PVector(red(c), green(c), blue(c));
  }
  
  // create one centroid for each color allowed in output
  centroids = new Centroid[numColors];
  for(int i=0; i<centroids.length; i++){
    // initialize each centroid to a random pixel in the image
    centroids[i] = new Centroid(pixelColors[(int)random(pixelColors.length)]);
  }
  
  // loops for number of given iterations
  for(int i=0; i<iterations; i++){
    // finds the nearest centroid for each pixel and
    // updates the centroid's running totals
    for(int j=0; j<pixelColors.length; j++){
      findNearestCentroid(pixelColors[j], centroids); 
    }
    
    // adjusts each centroid's rgb values by finding mean of all nearest colors
    for(int j=0; j<centroids.length; j++){
      centroids[j].updatePosition(); 
    }
  }
  
  // loops through each pixel, finds nearest centroid, then sets the color
  // of the pixel equal to the centroid
  outputImg = createImage(inputImg.width, inputImg.height, RGB);
  for(int i=0; i<pixelColors.length; i++){
    pixelColors[i] = findNearestCentroid(pixelColors[i], centroids);
    // converts the rgb values to pixels and adds them to outputImg
    outputImg.pixels[i] = color(pixelColors[i].x, pixelColors[i].y, pixelColors[i].z);
  }
  
  // output image
  outputImg.save(outputDest);
}


// finds the centroid closest to this point
PVector findNearestCentroid(PVector point, Centroid[] arr){
  // sets initial minimum to a big number so that the minimum will (should) be set
  // by a centroid in our set
  float minDist = 999999;
  // keeps track of which centroid is closest
  int centInd = 0;
  for(int i=0; i<arr.length; i++){
    if(point.dist(arr[i].pos) < minDist){
       minDist = point.dist(arr[i].pos);
       centInd = i;
    }
  }

  // updates the closest centroid's running totals with the point's x and y values
  arr[centInd].updateRunningTotals(point.x, point.y, point.z);
  
  return arr[centInd].pos;
}
