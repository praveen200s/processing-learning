PImage img;
int[][] iPixels;
int sq, count=20;
int[] nums = {4,8,10,20,40,50,80,100,200};

void setup() {
  size(800, 800);
  iPixels = new int[width][height];
  img = loadImage("Skull.jpg");  // Load the image into the program  
  
  //sq = img.width/count;

  //image(img, 0, 0, width, height);
  //println(img.width +" ---- "+ sq); 
  frameRate(1);
}

void draw() {
  //if(frameCount >= nums.length)
    //noLoop();  
    
    
  //img = loadImage("coke.jpg");
  //count = nums[frameCount-1];
 
  sq = img.width/count;
  splitsq();
  //splitfour();
  image(img, 0, 0, width, height);
  //saveFrame("quadra-#######.jpg");
  noLoop();
}

void splitsq() {
splitvertical();
 splithorizontal();
}

void splitvertical(){
 img.loadPixels();
  for (int i=0; i<img.height; i++) {
    for (int j=0; j<img.width; j++) {   

      if (j < img.width/2)
        iPixels[j][i] = img.pixels[i*img.width + sq*(int(j/sq)+1)+j];   
      else
        iPixels[j][i] = img.pixels[i*img.width + (int((j-floor(img.width/2))/sq)*sq+(j-floor(img.width/2)))];
    }
  }

  for (int i=0; i<img.height; i++) {
    for (int j=0; j<img.width; j++) {
      img.pixels[i*img.width + j] = iPixels[j][i];
    }
  }
  img.updatePixels();
}
void splithorizontal(){
 img.loadPixels();
  for (int i=0; i<img.height; i++) {
    for (int j=0; j<img.width; j++) {   

      if (i < img.height/2)
        iPixels[j][i] = img.pixels[(sq*(int(i/sq)+1)+i)*img.width + j];   
      else
        iPixels[j][i] = img.pixels[(int((i-floor(img.height/2))/sq)*sq+(i-floor(img.height/2)))*img.width + j];
    }
  }

  for (int i=0; i<img.height; i++) {
    for (int j=0; j<img.width; j++) {
      img.pixels[i*img.width + j] = iPixels[j][i];
    }
  }
  img.updatePixels();
}


void splitfour() {
  img.loadPixels();
  for (int i=0; i<img.height; i++) {
    for (int j=0; j<img.width; j++) {

      if (j < img.width/2)
        iPixels[j][i] = img.pixels[i*img.width + (2*j+1)]; 
      else
        iPixels[j][i] = img.pixels[i*img.width + (2*floor(j-img.width/2))];
    }
  }
  for (int i=0; i<img.height; i++) {
    for (int j=0; j<img.width; j++) {
      img.pixels[i*img.width + j] = iPixels[j][i];
    }
  }
  //img.updatePixels();


  //img.loadPixels();
  for (int i=0; i<img.height; i++) {
    for (int j=0; j<img.width; j++) {

      if (i < img.height/2)
        iPixels[j][i] = img.pixels[(2*i+1)*img.width + j]; 
      else
        iPixels[j][i] = img.pixels[(2*floor(i-img.height/2))*img.width + j];
    }
  }
  for (int i=0; i<img.height; i++) {
    for (int j=0; j<img.width; j++) {
      img.pixels[i*img.width + j] = iPixels[j][i];
    }
  }
  img.updatePixels();
}


void keyPressed(){
if(key == 's')
  saveFrame("quadra-#######.jpg");

}