/*
Sketch made to present a concept of AntiFragile of randomeness & fargility.
*/
int diceSize = 117;
int side;
boolean l = true;
PFont f;
void setup() {
  frameRate(4);
  randomSeed(0);
  size(800, 500);
  f = createFont("Lato",16,true);
  noLoop(); 
}
void draw() {
  background(#57DED1);
  //text
  textFont(f);       
  fill(50);
  textAlign(CENTER);
  text("ROBUST",400,250);
  text("FRAGILE",150,250);
  text("ANTI-FRAGILE",650,250);
  
  //dice
  noStroke();
  fill(#FFF3D6);
  rectMode(CENTER);
  rect(400, 100, diceSize, diceSize, diceSize/5);

  //dots
  fill(50);
  side = int(random(1, 7));
  if (side == 1 || side == 3 || side == 5)
    ellipse(400, 100, diceSize/5, diceSize/5); 
  if (side == 2 || side == 3 || side == 4 || side == 5 || side == 6) { 
    ellipse(400 - diceSize/4, 100 - diceSize/4, diceSize/5, diceSize/5);
    ellipse(400 + diceSize/4, 100 + diceSize/4, diceSize/5, diceSize/5);
  }
  if (side == 4 || side == 5 || side == 6) {
    ellipse(400 - diceSize/4, 100 + diceSize/4, diceSize/5, diceSize/5);
    ellipse(400 + diceSize/4, 100 - diceSize/4, diceSize/5, diceSize/5);
  }
  if (side == 6) {
    ellipse(400, 100 - diceSize/4
    , diceSize/5, diceSize/5);
    ellipse(400, 100 + diceSize/4, diceSize/5, diceSize/5);
  }

  antifragile(side);
  fragile(side);
  robust(side);
  //roll
  if(l)
    loop();
  else{
    if(side < 3){
    fill(50);
  textAlign(CENTER);
  text("Systems do have limits.",600,100);
    }
    noLoop();
  }
}
void mousePressed(){
keyPressed();
}
void keyPressed(){
  l = !l;
  draw();
}
void antifragile(int x){
  fill(#fffc19);
  ellipse(650,350,100,100);
  if(x>2){
  for(int i = 0; i <x*4 ; i++){
    float rad = random(20,30);
    ellipse(650+random(-50,50),350+random(-50,50),rad,rad);
  }
  }
}
void fragile(int x){
  fill(#ff0000);
  ellipse(150,350,100,100);
  if(x>2){
  fill(#57DED1);
  for(int i = 0; i <x*5 ; i++){
    float rad = random(20,30);
    ellipse(150+random(-50,50),350+random(-50,50),rad,rad);
  }
  }
}

void robust(int x){
  fill(#1485cc);
  for(int i = 0 ; i<x;i++)
    ellipse(400,350,100+i*0.2,100+i*0.2);
}