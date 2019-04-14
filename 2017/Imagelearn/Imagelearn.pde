/*
Baby Steps to learn Pixel Manipulation in Processing.
*/

PImage img;
color c1 = color(255);
color c2 = color(150);
void setup(){
size(800,800);

img = loadImage("sphere.jpg");
}

void draw() {
  // Displays the image at its actual size at point (0,0)
  image(img, 0, 0);
  img.loadPixels();
  
  for(int i = 0; i < img.width ; i++)
  {
    for(int j =0; j <img.height ; j++)
    {
      if(img.pixels[j*img.width + i] <= c1 && img.pixels[j*img.width + i] >= c2){
        stroke(random(230,255),10);
        line(200+i,j,img.width,j);
      }  
  }
  }
  img.updatePixels();
  //image(img, 0, 0);
  noLoop();
  
}