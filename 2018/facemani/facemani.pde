import com.hamoid.*;

Face[] fs;
int cell, num=5;
VideoExport videoExport;

void setup() {
  size(800, 800);

  cell = width/num;
  fs = new Face[num*num];

  for (int i=0; i<num*num; i++) {
    fs[i] = new Face(cell);
  }
  
  colorMode(HSB,100);
  
  background(0,0,100);
  color(0,0,0);
  stroke(0,0,0);
  
    videoExport = new VideoExport(this);
  videoExport.setFrameRate(30);
  videoExport.startMovie();
  //frameRate(2);
}

void draw() {
  if(frameCount%30 == 0){
  for (int i=0; i<num*num; i++) {
    float xp = cell*(i%num);
    float yp = cell*int(i/num);
    pushMatrix();
    translate(xp,yp);
    fs[i] = new Face(cell);
    fs[i].drawface();
    popMatrix();
}}
//noLoop();
videoExport.saveFrame();
  if(frameCount > 600){
    videoExport.endMovie();
    exit();
  }
}
void guide() {
  strokeWeight(1);


  //rect
  stroke(0, 255, 255);
  rect(0, 0, 400, 400);

  //horizontal lines
  stroke(255, 0, 255);
  line(0, 400/3, 400, 400/3);
  line(0, 800/3, 400, 800/3);

  //verticals
  stroke(255, 255, 0);
  line(400/12, 0, 400/12, 400); //y

  stroke(255, 0, 255);
  line(800/12, 0, 800/12, 400); //p

  stroke(255, 255, 0);
  line(1200/12, 0, 1200/12, 400); //y

  stroke(255, 0, 255);
  line(1600/12, 0, 1600/12, 400); //p

  stroke(255, 255, 0);
  line(2000/12, 0, 2000/12, 400); //y

  stroke(255, 0, 255);
  line(2400/12, 0, 2400/12, 400); //p

  stroke(255, 255, 0);
  line(2800/12, 0, 2800/12, 400); //y

  stroke(255, 0, 255);
  line(3200/12, 0, 3200/12, 400); //p

  stroke(255, 255, 0);
  line(3600/12, 0, 3600/12, 400); //y

  stroke(255, 0, 255);
  line(4000/12, 0, 4000/12, 400); //p

  stroke(255, 255, 0);
  line(4400/12, 0, 4400/12, 400); //y
}

void keyPressed() {
  if (key == 's')
    saveFrame("facemani-#######.jpg");
    
}