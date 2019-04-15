import gab.opencv.*;
import java.awt.*;
import processing.video.*;

Capture video;
OpenCV opencv;
Rectangle[] faces;

import com.hamoid.*;
PImage img;
Rect[] rects;
int countR;
VideoExport videoExport;

void setup() {
 size(800, 600);
  video = new Capture(this, 640, 480);
  opencv = new OpenCV(this, 640, 480);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE); 
  
  video.start();
  
  //faces = opencv.detect();

 
  //img = loadImage("face3.jpg");  // Load the image into the program  

  //image(img, 0, 0, width, height);
  //countR = faces.length;

  //rects = new Rect[countR];
  //for (int i=0; i<countR; i++) {
  //  rects[i] = new Rect((int)faces[i].x, (int)faces[i].y, (int)(faces[i].width/10)*10, (int)(faces[i].height/10)*10);
  //}


  frameRate(30);

  videoExport = new VideoExport(this);
  videoExport.setFrameRate(30);
  videoExport.startMovie();
}

void draw() {
  img = video;
  opencv.loadImage(video);
  faces = opencv.detect();
  countR = faces.length;
   rects = new Rect[countR];
  
  for (int i=0; i<countR; i++) {
    rects[i] = new Rect((int)faces[i].x, (int)faces[i].y, (int)(faces[i].width/10)*10, (int)(faces[i].height/10)*10);
  }
  //img = loadImage("face3.jpg");

  for (Rect r : rects) {
    r.splitinv();
    if (frameCount%15 ==0) {
    r.fillbooleans();
    }
  }
  //r1.splitinv();
  //r2.splitinv();
  //if (frameCount%30 ==0) {
  //  r1.fillbooleans();
  //  r2.fillbooleans();
  //}
  //image(img, 0, 0, width, height);
 image(video, 0, 0,width,height);
  //noFill();
  //rect(r.x,r.y,r.w,r.h);
  //noLoop();


  videoExport.saveFrame();
  if(frameCount > (600)){
  videoExport.endMovie();
  exit();
  }
  //println(frameCount);
}
void captureEvent(Capture c) {
  c.read();
}
void keyPressed() {
  if (key == 's')
    saveFrame("quadra-#######.jpg");

  if (key == 'q') {
    videoExport.endMovie();
    exit();
  }
}