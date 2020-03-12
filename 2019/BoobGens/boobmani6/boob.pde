class Boob {

  float fw, fh, unit;
  float noise;
  boolean boob;
  float m,s;
  color c;
  color bg =  color(0, 0, 100);
  color[] skin = { color(27, 22, 99), color(24, 52, 89), 
    color(0, 12, 92), color(28, 66, 78), 
    color(25, 31, 87), color(18, 55, 75), 
    color(8, 48, 43), color(32, 29, 99) };

  Boob(float _s) {
    fw = _s;
    fh = _s;
    unit = _s/10;
    
    c = this.skin[(int)random(8)];

    if(random(1) > 0.5)
      boob = true;

    //noise
    noise = random(10);
    
    m=-10;
    s= random(0.05,0.25);
  }

  void drawBoob() {
    
    fill(0,0,100);
    noStroke();
    rect(0,0,fw,fh);
      
    
    strokeWeight(3);
    stroke(0, 0, 0);
    noFill();

    beginShape();
    vertex(3*unit, 2*unit);
    bezierVertex(3.5*unit, 4*unit, 1*unit, 3.5*unit, 1*unit, 5.5*unit);
    bezierVertex(1.25*unit, 5.9*unit, 1.75*unit, 6*unit, 2.25*unit, 6*unit);
    vertex(2.5*unit, 5.5*unit);
    bezierVertex(2.5*unit, 6*unit, 3.25*unit, 8*unit, 3*unit, 9*unit);
    bezierVertex(4*unit, 9.5*unit, 6*unit, 9*unit, 7.25*unit, 8.25*unit);
    bezierVertex(6.75*unit, 7*unit, 6.25*unit, 4.25*unit, 7*unit, 4.25*unit);
    vertex(7*unit, 2.75*unit);
    bezierVertex(6.75*unit, 2.5*unit, 4.75*unit, 3.25*unit, 4.5*unit, 1.5*unit);
    endShape(CLOSE);

    //bellybutton
    bezier(5*unit, 8*unit, 4.75*unit, 8.5*unit, 5.5*unit, 8.5*unit, 5*unit, 7.5*unit);

    
    
    fill(0, 0, 0);
    stroke(0,0,0);
    //Ellipses
    pushMatrix();
    translate(7*unit, 3.5*unit);
    rotate(radians(-5));
    ellipse(0*unit, 0*unit, 0.5*unit, 1.5*unit);
    popMatrix();
    pushMatrix();
    translate(3.75*unit, 1.75*unit);
    rotate(radians(-15));
    ellipse(0*unit, 0*unit, 1.6*unit, 0.5*unit);
    popMatrix();


    //Boobs
    fill(bg);
    if (boob) {
      leftBoob();
      rightBoob();
    } else {
      rightBoob();
      leftBoob();
    }

    fill(0, 0, 0);
    //areola
    //left areola
    ellipse(3.5*unit, 5.75*unit, 0.5*unit, 0.5*unit);
    //right areola
    ellipse(5.5*unit, 5.4*unit, 0.5*unit, 0.5*unit);

    fill(bg);
    //Nipples
    //left nipple
    ellipse(3.5*unit, 5.75*unit, 0.2*unit, 0.2*unit);
    //right nipple
    ellipse(5.5*unit, 5.4*unit, 0.2*unit, 0.2*unit);
    
    if(m <= 0 && m >= -10){
    fill(0, 0, 100);
    stroke(0,0,100);
    //rect
    pushMatrix();
    translate(7*unit, 3.5*unit);
    rotate(radians(-5));
    ellipse(m*unit, 0*unit, 10*unit, 10*unit);
    popMatrix();
    }else{
      s = -s;
    }
  }

  void leftBoob() {
    bezier(2.5*unit, 5*unit, 2*unit, 7*unit, 5*unit, 7*unit, 4.5*unit, 5*unit);
  }

  void rightBoob() {
    bezier(6.25*unit, 4.25*unit, 7.25*unit, 6*unit, 4.5*unit, 7*unit, 4.5*unit, 5*unit);
  }

   void move(){
   this.m += this.s;
   }
}