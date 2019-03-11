PImage inputImg;
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
  
  
}


// finds the centroid closest to this point
void findNearestCentroid(PVector point, Centroid[] arr){
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
}
