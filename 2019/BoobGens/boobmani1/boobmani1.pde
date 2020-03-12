//import com.hamoid.*;

Boob[] fs;
int cell, num=1;
int uni;
float a =1;
//VideoExport videoExport;

void setup() {
  size(800,800);

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
  
  //videoExport = new VideoExport(this);
  //videoExport.setFrameRate(30);
  //videoExport.startMovie();
//a =12;
}

void draw() {
  //guide();
  if(frameCount%30 == 0){
    
    //cell = width/num;
    //fs = new Ass[num*num];
    
    
  for (int i=0; i<num*num; i++) {
    float xp = cell*(i%num);
    float yp = cell*int(i/num);
    pushMatrix();
    translate(xp,yp);
    
    fs[i] = new Boob(cell);
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

}
//println(a);
//if(frameCount%15 == 0 && a <12 && frameCount >=60){
//cross();
//if(a>4.5 && a<7){
//fill(0,0,100);
//textSize(42);
//text("\"CENSORED\"",width/2,height/2,250,50);
//}
//if(a>=7 && a<10){
//fill(0,0,100);
//textSize(42);
//text("\"UNACCEPTABLE\"",width/2,height/2,350,50);
//}
//}
//if(a >= 10){
//cross();
//fill(0,0,100);
//textSize(42);
//text("\"LAW\"",width/2,height/2,150,50);

//if(a > 15){
//videoExport.endMovie();
    //exit();
//}
//}
//videoExport.saveFrame();

  //if(frameCount > 900){
  //  videoExport.endMovie();
  //  exit();
  //}
}

void cross(){
  
  //a+=0.1;
  
  rectMode(CENTER);
  noStroke();
  fill(0,0,0,80);
  pushMatrix();
  translate(3.5*cell*0.1,5.5*cell*0.1);
  scale(a);
  rotate(HALF_PI/2);
  
  rect(0,0,cell*0.1*2,cell*0.1*0.5);
  rotate(HALF_PI);
  rect(0,0,cell*0.1*2,cell*0.1*0.5);
  popMatrix();
  
  pushMatrix();
  translate(6.5*cell*0.1,5.5*cell*0.1);
  scale(a);
  rotate(HALF_PI/2);
  rect(0,0,cell*0.1*2,cell*0.1*0.5);
  rotate(HALF_PI);
  rect(0,0,cell*0.1*2,cell*0.1*0.5);
  popMatrix();
  
  
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
}