PImage inputImg;
String outputDest;
int numColors;
int iterations;
PVector[] pixelColors;

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
  // extract the red, green, and blue values of each pixel and use them to 
  // create a vector of rgb points
}

void draw(){
  
}
