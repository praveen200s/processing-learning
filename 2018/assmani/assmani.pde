/*
Generative Ass Maker.
*/

import com.hamoid.*;

Ass[] fs;
int cell, num=1;
int uni;
VideoExport videoExport;

void setup() {
  size(800,800);

  colorMode(HSB,360,100,100,100);
  background(0,0,100);
  color(0,0,0);
  stroke(0,0,0);
  strokeCap(SQUARE);

  //cell = width/num;
  //fs = new Ass[num*num];
  uni = width/10;

  //for (int i=0; i<num*num; i++) {
  //  fs[i] = new Ass(cell);
   
  //}
  
  videoExport = new VideoExport(this);
  videoExport.setFrameRate(30);
  videoExport.startMovie();
  //frameRate(2);
}

void draw() {
  //guide();
  if(frameCount%30 == 0){
    
    cell = width/num;
    fs = new Ass[num*num];
    
    
  for (int i=0; i<num*num; i++) {
    float xp = cell*(i%num);
    float yp = cell*int(i/num);
    pushMatrix();
    translate(xp,yp);
    fs[i] = new Ass(cell);
    fs[i].drawAss();
    popMatrix();
}
//}
//noLoop();
if(frameCount%120 == 0 && num<=3){
num++;
//if(num==4)
//  {
//    videoExport.endMovie();
//    exit();
//  }
}

}
videoExport.saveFrame();

  if(frameCount > 900){
    videoExport.endMovie();
    exit();
  }
}
void guide() {
  strokeWeight(1);
  stroke(0,0,0);

  
  
  //verticals
  line(2*uni,0,2*uni,height);
  line(5*uni,0,5*uni,height);
  line(8*uni,0,8*uni,height);
  
  //horizontal
  line(0,3*uni,width,3*uni);
  line(0,6*uni,width,6*uni);
  line(0,9*uni,width,9*uni);
  
}

void keyPressed() {
  if (key == 's')
    saveFrame("facemani-#######.jpg");   
}