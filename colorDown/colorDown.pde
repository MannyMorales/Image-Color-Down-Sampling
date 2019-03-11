PImage inputImg;
String outputDest;
int numColors;
int iterations;
PVector[] pixelColors;
PVector[] centroids;

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
  centroids = new PVector[numColors];
  for(int i=0; i<centroids.length; i++){
    // initialize each centroid to a random pixel in the image
    centroids[i] = pixelColors[(int)random(pixelColors.length)];
  }
}

void draw(){
  
}
