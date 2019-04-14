void makeLinga(color c, color c_s) {
  pushMatrix();
  translate(width/2, height/2);
  strokeWeight(pu_s_w);
  stroke(c_s); 
  fill(c);
  beginShape();
  vertex(-150, 0);
  bezierVertex(-150, 150, -100, 250, 0, 250);
  bezierVertex(100, 250, 150, 150, 150, 0);
  bezierVertex(150, -150, 100, -250, 0, -250);
  bezierVertex(-100, -250, -150, -150, -150, 0);

  endShape(CLOSE);
  popMatrix();
}

void makeSquare(color c, color c_s) {
  pushMatrix();
  translate(width/2, height/2);
  strokeWeight(pu_s_w);
  stroke(c_s); 
  fill(c);
  rect(-150, -150, 300, 300);
  popMatrix();
}
void makeSquare2(color c, color c_s) {
  pushMatrix();
  translate(width/2, height/2);
  strokeWeight(pu_s_w);
  stroke(c_s); 
  fill(c);
  rect(-150, -150, 300, 300);
  noStroke();
  rect(-2,-250,4,110);
  popMatrix();
}
void makeTriangle(color c, color c_s) {
  pushMatrix();
  translate(width/2, height/2);
  strokeWeight(pu_s_w);
  stroke(c_s); 
  fill(c);
  triangle(0, -150,300*cos(PI/4),300*sin(PI/4),-300*cos(PI/4),300*sin(PI/4));
  popMatrix();
}
void makeTriangle2(color c, color c_s) {
    pushMatrix();
  translate(width/2, height/2);
  strokeWeight(pu_s_w);
  stroke(c_s); 
  fill(c);
  triangle(0, -150,300*cos(PI/4),300*sin(PI/4),-300*cos(PI/4),300*sin(PI/4));
  noStroke();
  rect(-2,-250,4,110);
  popMatrix();
}
void makeCircle(color c, color c_s) {
    pushMatrix();
  translate(width/2, height/2);
  strokeWeight(pu_s_w);
  stroke(c_s); 
  fill(c);
  ellipse(0,0,300,300);
  popMatrix();
}
void makeCircle2(color c, color c_s) {
    pushMatrix();
  translate(width/2, height/2);
  strokeWeight(pu_s_w);
  stroke(c_s); 
  fill(c);
  ellipse(0,0,300,300);
  noStroke();
  rect(-2,-250,4,110);
  popMatrix();

}
void makeLinga2(color c, color c_s) {
    pushMatrix();
  translate(width/2, height/2);
  strokeWeight(pu_s_w);
  stroke(c_s); 
  fill(c);
  beginShape();
  vertex(-150, 0);
  bezierVertex(-150, 150, -100, 250, 0, 250);
  bezierVertex(100, 250, 150, 150, 150, 0);
  bezierVertex(150, -150, 100, -250, 0, -250);
  bezierVertex(-100, -250, -150, -150, -150, 0);
  
  endShape(CLOSE);
  noStroke();
  fill(bg);
  rect(-2,-260,5,510);
      
  popMatrix();
}