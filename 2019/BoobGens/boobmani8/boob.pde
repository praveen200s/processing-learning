class Boob {

  float fw, fh, unit;
  float al, ar, nl, nr;
  float rLBx1, rLBy1, rLBx2, rLBy2;
  float rRBx1, rRBy1, rRBx2, rRBy2;
  float ty, tx;
  boolean boob;
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

    boob =  random(1) <0.5 ? true : false ;

    al = random(0.4, 0.6);
    ar = random(0.4, 0.6);

    nl = nr = 0.2;

    rLBx1 = random(0.25, 1.75)*unit;
    rLBy1 = random(6.25, 7.75)*unit;
    rLBx2 = random(5.25, 6.75)*unit;
    rLBy2 =random(6.25, 7.75)*unit;

    rRBx1 = 10*unit - rLBx1;
    rRBy1 = rLBy1;
    rRBx2 = 10*unit - rLBx2;
    rRBy2 = rLBy2;

    ty = tx =0;
  }

  void drawBoob() {
    fill(0, 0, 100);
    noStroke();
    rect(0, 0, fw, fh);    

    //ty = 0.5*unit;
    //ty = map(mouseY,0,height,-1,1)*unit;
    //tx = map(mouseX,0,width,-1,1)*unit;
    strokeWeight(3);
    stroke(0, 0, 0);
    noFill();

    //Shoulders
    //left shoulder
    bezier(6*unit+tx, 1*unit+ty, 6*unit+tx, 4*unit+ty, 1*unit+tx, 1*unit+ty, 1*unit+tx, 5*unit+ty);
    //right shoulder
    bezier(4*unit+tx, 1*unit+ty, 4*unit+tx, 4*unit+ty, 9*unit+tx, 1*unit+ty, 9*unit+tx, 5*unit+ty);

    //fill(c);
    ////heart
    //beginShape();
    //vertex(5*unit, 2.4*unit);
    //bezierVertex(2*unit, 1.2*unit, 4.5*unit, -1*unit, 5*unit, 1*unit);
    //bezierVertex(5.5*unit, -1*unit, 8*unit, 1.2*unit, 5*unit, 2.4*unit);    
    //endShape();

    noFill();
    //Waists
    //left waist
    bezier(2.5*unit, 5*unit, 3*unit, 6*unit, 2.5*unit, 8*unit, 2.5*unit, 9*unit);
    //right waist
    bezier(7.5*unit, 5*unit, 7*unit, 6*unit, 7.5*unit, 8*unit, 7.5*unit, 9*unit);

    //bellybutton
    bezier(2.5*unit, 9*unit, 2.5*unit, 9.5*unit, 5.25*unit, 8.5*unit, 5*unit, 8*unit);
    bezier(5*unit, 8*unit, 4.75*unit, 8.5*unit, 5.25*unit, 8.5*unit, 5*unit, 7.75*unit);
    bezier( 7.5*unit, 9*unit, 7.5*unit, 9.5*unit, 4.75*unit, 8.75*unit, 5*unit, 7.75*unit);

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
    //neck
    ellipse(5*unit+tx, 1*unit+ty, 2*unit, 0.5*unit);

    //fill(c);
    //beginShape();
    //vertex(4*unit, 1*unit+ty);
    //vertex(4.25*unit, random(0.25, 1)*unit+ty);
    //vertex(4.5*unit, random(0.25, 1)*unit+ty);
    //vertex(4.75*unit, random(0, 1)*unit+ty);
    //vertex(5*unit, random(0, 1)*unit+ty);
    //vertex(5.25*unit, random(0.25, 1)*unit+ty);
    //vertex(5.5*unit, random(0, 1)*unit+ty);
    //vertex(5.75*unit, random(0, 1)*unit+ty);
    //vertex(6*unit, 1*unit+ty);
    //endShape();

    //fill(0, 0, 0);


    //beginShape();
    //vertex(4*unit, 1*unit+ty);
    //vertex(4.25*unit, random(0, 1)*unit+ty);
    //vertex(4.5*unit, random(0, 1)*unit+ty);
    //vertex(4.75*unit, random(0.25, 1)*unit+ty);
    //vertex(5*unit, random(0.25, 1)*unit+ty);
    //vertex(5.25*unit, random(0, 1)*unit+ty);
    //vertex(5.5*unit, random(0.25, 1)*unit+ty);
    //vertex(5.75*unit, random(0.25, 1)*unit+ty);
    //vertex(6*unit, 1*unit+ty);
    //endShape();




    //fill(0, 0, 0);
    //areola
    //left areola
    ellipse(3.5*unit, 5.5*unit, al*unit, al*unit);
    //right areola
    ellipse(6.5*unit, 5.5*unit, ar*unit, ar*unit);

    fill(bg);
    //Nipples
    //left nipple
    ellipse(3.5*unit, 5.5*unit, nl*unit, nl*unit);
    //right nipple
    ellipse(6.5*unit, 5.5*unit, nr*unit, nr*unit);
  }

  void changeColor(){
  c = this.skin[(int)random(8)];
  }

  void leftBoob() {
    //bezier(2.5*unit, 4*unit, 1*unit, 7*unit, 6*unit, 7*unit, 5*unit, 4.5*unit);
    bezier(2.5*unit, 4*unit, rLBx1, rLBy1, rLBx2, rLBy2, 5*unit, 4.5*unit);
  }

  void rightBoob() {
    //bezier(7.5*unit, 4*unit, 9*unit, 7*unit, 4*unit, 7*unit, 5*unit, 4.5*unit);
    bezier(7.5*unit, 4*unit, rRBx1, rRBy1, rRBx2, rRBy2, 5*unit, 4.5*unit);
  }
}