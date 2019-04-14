/*
Random Pattern of Customer Satisfaction Feedbacks using Emojis
*/
float w = 20;
int space = 10;
void setup(){
size(680,420);
  background(255);
 frameRate(3);
}

void draw(){
  
  background(255);
  w = (int)random(20,120);
  noStroke();
for( int i = 0; i < width ; i+=(space+ w)){
  for (int j = 0; j < height ; j+=(space+ w)){
    
    
    switch((int)random(0,3)){
    
      case 0: makeHappy(i+ space + w/2,j+ space + w/2,w);
               break;
      
      case 1: makeSad(i+ space + w/2,j+ space + w/2,w);
               break;
    
      case 2: makeOk(i+ space + w/2,j+ space + w/2,w);
               break;
    
    
    }
    
      
  }
}
  noLoop();
}


void makeHappy(float x, float y,float w){
  //Happy
  fill(#00ffdd,255);
  pushMatrix();
  translate(x,y);
  scale(w/150);
  ellipse(-50,-30,20,20);  
  ellipse(50,-30,20,20);  
  beginShape();
  vertex(-80, 0);
  bezierVertex(-60, 70, 60, 70, 80, 0);
  bezierVertex(40,40, -40, 40, -80, 0);
  endShape(CLOSE);
  popMatrix();
}


void makeSad(float x, float y,float w){
  //Sad
  fill(#ff0000,85);
  pushMatrix();
  translate(x,y);
  scale(w/150);
  ellipse(-50,-20,20,20);  
  ellipse(50,-20,20,20);  
  beginShape();
  vertex(-80, 50);
  bezierVertex(-60, -20, 60, -20, 80, 50);
  bezierVertex(40,10, -40, 10, -80, 50);
  endShape(CLOSE);
  popMatrix();
}


void makeOk(float x, float y,float w){
  //OK
  fill(0,85);
  pushMatrix();
  translate(x,y);
  rotate(random(0,PI));
  scale(w/150);
  ellipse(-50,-50,20,20);  
  ellipse(50,-50,20,20);  
  beginShape();
  vertex(-60, 20);
  vertex(-60,40);
  vertex(60,40);
  vertex(60,20);
  endShape(CLOSE);
  popMatrix();
}