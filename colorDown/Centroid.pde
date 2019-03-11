/*
/* Centroid is the center of a particular cluster whose position can be updated
*/

public class Centroid{
  PVector pos;
  float runningTotalR;
  float runningTotalG;
  float runningTotalB;
  int runningTotalN;

  // takes a 2-dimensional PVector containing initial red green and blue values
  Centroid(PVector position){
    pos = position;
    
    // initializes running totals to 0
    runningTotalR = 0;
    runningTotalG = 0;
    runningTotalB = 0;
    runningTotalN = 0;
  }

  // updates the sum of x and y values separately and the number
  // of points that were closer to this centroid than any other
  // This info is collected to update the centroid's position to be the average 
  // position of all points closest to it
  void updateRunningTotals(float r, float g, float b){
    runningTotalR += r;
    runningTotalG += g;
    runningTotalB += b;
    runningTotalN++;
  }

  // updates Centroid's position by taking average position of all 
  // points that found it to be the closest centroid and resets
  // running totals
  void updatePosition(){
    pos.x = runningTotalR/(float)runningTotalN;
    pos.y = runningTotalG/(float)runningTotalN;
    pos.z = runningTotalB/(float)runningTotalN;

    runningTotalR = 0;
    runningTotalG = 0;
    runningTotalB = 0;
    runningTotalN = 0;
  }
}
