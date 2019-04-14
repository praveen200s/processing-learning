

void setup(){
size(displayHeight ,displayHeight);

background(255);
 fill(0);
}

void draw(){
  clock();
  //println(second() + "  " + minute() + "  " + hour() +" " + (TWO_PI));
  //noLoop();
  
  
}

void clock(){
//clock part
  fill(0);
  background(255);
  translate(width/2,height/2);
  noStroke();
  pushMatrix();
  rotate(map(second(),0,59,0,TWO_PI) - PI/2);
  rect(0,0,30,2);
  ellipse(40,1,10,10);
  popMatrix();
  pushMatrix();
  rotate(map(minute(),0,59,0,TWO_PI) - PI/2);
  rect(50,0,100,5);
  noFill();
  stroke(0);
  strokeWeight(2);
  ellipse(100,0,50,50);
  popMatrix();
  pushMatrix();
  rotate(map(hour(),0,12,0,TWO_PI) - PI/2);
  fill(0);
  rect(150,0,100,20);
  popMatrix();
  noFill();
  stroke(0);
  strokeWeight(2);
  ellipse(0,0,400,400);
  
}