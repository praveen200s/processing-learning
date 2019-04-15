import com.hamoid.*;

PImage img;
int[][] iPixels;
boolean[] flags;
int sq, count=20;
int[] nums = {4, 8, 10, 20, 40, 50, 80, 100, 200};
VideoExport videoExport;

void setup() {
  size(800, 800);
  iPixels = new int[width][height];
  img = loadImage("Skull.jpg");  // Load the image into the program  

  sq = img.width/count;
  flags = new boolean[count];
  fillbooleans();
  image(img, 0, 0, width, height);
  
  videoExport = new VideoExport(this);
  videoExport.setFrameRate(30);
  videoExport.startMovie();
  frameRate(30);
}

void draw() {
  if(frameCount > 45 && frameCount%15 ==0){
    img = loadImage("Skull.jpg");
  splitinv();
  fillbooleans();
  //splitsq();
  image(img, 0, 0, width, height);
  //noLoop();
  }
  
  videoExport.saveFrame();
  if(frameCount > (600)){
    videoExport.endMovie();
    exit();
  }
}
void fillbooleans(){
  for (int f=0; f<count; f++) {
    flags[f] = (random(1)<0.5?true:false);
  }
}
void splitinv() {
  if (frameCount%30 ==0){
  swapvertical();
  swaphorizontal();
  }else
  swaphorizontal();
}

void swapvertical() {
  //vertical

  img.loadPixels();
 
  for (int i=250; i<500; i++) {
    for (int j=150; j<650; j++) {   

      if (flags[int(j/sq)]){
        iPixels[j][i] = img.pixels[(img.height-i-1)*img.width + j]; 
  if(iPixels[j][i] != -1 && frameCount > 300)
        iPixels[j][i] = color(red(iPixels[j][i]),green(iPixels[j][i]),random(150,250));
          
    
  }else
        iPixels[j][i] = img.pixels[i*img.width + j];
    }
  }
  for (int i=250; i<500; i++) {
    for (int j=150; j<650; j++) {
      img.pixels[i*img.width + j] = iPixels[j][i];
    }
  }
  img.updatePixels();
}

void swaphorizontal() {
  //horizontal

  img.loadPixels();
  
  for (int i=250; i<500; i++) {
    for (int j=0; j<img.width; j++) {   

      if (flags[int(i/sq)]){
        iPixels[j][i] = img.pixels[i*img.width + (img.width-j-1)]; 
        if(iPixels[j][i] != -1 && frameCount > 200)
        iPixels[j][i] = color(random(150,250),green(iPixels[j][i]),blue(iPixels[j][i]));
      
    
      }else
        iPixels[j][i] = img.pixels[i*img.width + j];
    }
  }
 
  for (int i=250; i<500; i++) {
    for (int j=0; j<img.width; j++) {
      img.pixels[i*img.width + j] = iPixels[j][i];
    }
  }
  img.updatePixels();
}







void splitsq() {
  splitvertical();
  splithorizontal();
}

void splitvertical() {
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
void splithorizontal() {
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

void keyPressed() {
  if (key == 's')
    saveFrame("quadra-#######.jpg");
    
  if (key == 'q'){
    videoExport.endMovie();
    exit();
  }
}