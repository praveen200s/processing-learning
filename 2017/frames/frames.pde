/*
Random frames made using randomness & basic shapes & noise.
*/

int max = 30, pad = 600;
Corner[] corners = new Corner[max];

void setup() {
  size(2400, 2400);
  background(255);
  stroke(0);

  for (int i=0; i<max; i++)
    corners[i] = new Corner();
}

void draw() {
beginShape();
  for (int i=0; i<max; i++) {
    
    corners[i].drawpoint();
    
    corners[i].update();
  }
endShape();
  if (millis() > 30*1000) {
    noLoop();
    saveFrame("frame########.jpg");
  }
}


class Corner {

  float x, y, n, s, ox, oy;  

  Corner() {
    x = random(pad, width-pad);
    y = random(pad, height-pad);
    n = random(15, 30);
    s = random(13, 28);
    ox = x;
    oy = y;
  }

  void update() {
    ox = x;
    oy = y;

    if (x>pad && x< width-pad)
      x += (random(n)*sin(x));

    if (y>pad && y< height-pad)
      y += (random(n)*sin(y));
  }

  void drawpoint() {
    fill(255);
    //noFill();
    strokeWeight(s);
    //if(random(1)<0.9)
    //  stroke(255);
    //  else
    //  stroke(0);
    //line(ox,oy,x, y);
    
 //ellipse(x,y,pad/4,pad/4);
    //arc(x,y,pad/2,pad/2,0,PI/18,PIE);
    triangle(ox,oy,x, y,width/2,height/2);
    //rect(x,y,pad/2,pad/2);
   
            //point(x,y);
    //quad(ox,oy,pad,pad,x, y, width-pad,height-pad);
    curveVertex(x,y);  
}
}