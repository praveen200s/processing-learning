import peasy.*;
PeasyCam cam;
import com.hamoid.*;

Boob[] fs;
int cell, num=1;
int uni;
boolean rec = false;
VideoExport videoExport;

void setup() {
  size(800,800,P3D);

  colorMode(HSB,360,100,100,100);
  background(0,0,100);
  color(0,0,0);
  stroke(0,0,0);
  strokeCap(SQUARE);

  cell = width/num;
  fs = new Boob[num*num];
  uni = width/10;

  for (int i=0; i<num*num; i++) {
    fs[i] = new Boob(cell);   
  }
  
  videoExport = new VideoExport(this);
  videoExport.setFrameRate(30);
  videoExport.startMovie();
  
  cam = new PeasyCam(this,400,400,0, 800);
    state = cam.getState();
}

void draw() {

  //if(!rec){
  cam.beginHUD();
  fill(0,0,100);
  rect(0, 0, width, height);
  cam.endHUD();
  //}
  
  //guide();
  //if(frameCount%30 == 0){
    
    //cell = width/num;
    //fs = new Ass[num*num];
    
    
  for (int i=0; i<num*num; i++) {
    float xp = cell*(i%num);
    float yp = cell*int(i/num);
    pushMatrix();
    translate(xp,yp);
    //fs[i] = new Ass(cell);
    fs[i].drawBoob();
    popMatrix();
}
//}
//noLoop();
//if(frameCount%120 == 0 && num<=3){
//num++;
//if(num==4)
//  {
//    videoExport.endMovie();
//    exit();
//  }
//}

//}
if(rec)
videoExport.saveFrame();

  //if(frameCount > 900){
    //videoExport.endMovie();
    //exit();
  //}

}
CameraState state;
public void keyReleased() {
  if (key == '1') state = cam.getState();
  if (key == '2'){ 
    cam.setState(state, 10000);
    rec = true; 
  }
}

void guide() {
  strokeWeight(1);
  stroke(0,0,0);
  
  //verticals
  for(int i=1;i<10;i++)
  line(i*uni,0,i*uni,width);
  
  //horizontal
  for(int i=1;i<10;i++)
  line(0,i*uni,height,i*uni);
  
}

void keyPressed() {
  if (key == 's')
    saveFrame("facemani-#######.jpg");
  if(key == 'q'){
    videoExport.endMovie();
    exit();
  }
    
}