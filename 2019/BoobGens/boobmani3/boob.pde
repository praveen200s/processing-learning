class Boob {

  float fw, fh, unit;
  float s, a;
  boolean boob=false;
  float al, ar, nl, nr;
  float rLBx1, rLBy1, rLBx2, rLBy2;
  float rRBx1, rRBy1, rRBx2, rRBy2;
  float rNx1, rNx2, rAx1, rAx2, rEx1, rEx2, rWx1, rWx2;
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

    a =-1 ;
    s = sin(a);

    if (random(1)>0.5)
      boob = true;


    al = random(0.4, 0.6);
    ar = random(0.4, 0.6);
    //ar = al;
    nl = nr = 0.2;

    rLBx1 = map(s, -1, 1, 1.25, 2.75);
    rLBy1 = map(s, -1, 1, 6.75, 7.75);
    rLBx2 = map(s, -1, 1, 5.25, 6.25);
    rLBy2 = map(s, -1, 1, 5.75, 6.25);



    rRBx1 = 10 - rLBx1;
    rRBy1 = rLBy1;
    rRBx2 = 10 - rLBx2;
    rRBy2 = rLBy2;

    //rNx1 = random(3.5,4.5);
    rNx1 = map(s, -1, 1, 2.5, 3.5);
    rNx2 = 8 - rNx1;
    //rAx1 = random(0.5,1.5);
    rAx1 = map(s, -1, 1, 0.5, 1.5);
    rAx2 = 9-rAx1;
    //rEx1 = random(2,3);
    rEx1 = map(s, -1, 1, 2.5, 3.5);
    rEx2 = 11 - rEx1;
    //rWx1 = random(rEx1,3.5);
    rWx1 = map(s, -1, 1, rEx1, 3.5);
    rWx2 = 10 -rWx1;

  }

  void drawBoob() {

    noStroke();
    fill(0, 0, 100);
    rect(0, 0, fw, fh);

    strokeWeight(3);
    stroke(0, 0, 0);
    noFill();
    //Shoulders
    //left shoulder
    pushMatrix();
    translate(fw*0.5,fh*0.5);
    rotate(a*0.02);
    bezier(rNx1*unit-fw*0.5, 1*unit-fh*0.5, 3.5*unit-fw*0.5, 3*unit-fh*0.5, 1*unit-fw*0.5, 2.5*unit-fh*0.5, rAx1*unit-fw*0.5, 4.5*unit-fh*0.5);
    
    popMatrix();
    //right shoulder
    pushMatrix();
    translate(fw*0.5,fh*0.5);
    rotate(a*0.04);
    bezier(rNx2*unit-fw*0.5, 0.75*unit-fh*0.5, 5*unit-fw*0.5, 2.5*unit-fh*0.5, 8*unit-fw*0.5, 1*unit-fh*0.5, rAx2*unit-fw*0.5, 3*unit-fh*0.5);
    
    popMatrix();
    //Waists
    //left waist
    pushMatrix();
    translate(fw*0.5,fh*0.5);
    rotate(a*0.04);
    bezier(2.5*unit-fw*0.5, 4.5*unit-fh*0.5, rWx1*unit-fw*0.5, 5*unit-fh*0.5, 3.5*unit-fw*0.5, 7*unit-fh*0.5, rEx1*unit-fw*0.5, 9*unit-fh*0.5);
    //right waist
    bezier(7*unit-fw*0.5, 3.5*unit-fh*0.5, rWx2*unit-fw*0.5, 4*unit-fh*0.5, 7*unit-fw*0.5, 7*unit-fh*0.5, rEx2*unit-fw*0.5, 8*unit-fh*0.5);
    popMatrix();
    
    pushMatrix();
    translate(fw*0.5,fh*0.5);
    rotate(a*0.02);
    
    //bellybutton
    bezier(5.25*unit-fw*0.5, 7.5*unit-fh*0.5, 5.75*unit-fw*0.5, 8*unit-fh*0.5, 5.25*unit-fw*0.5, (7.5+noise(a*0.09))*unit-fh*0.5, 5.15*unit-fw*0.5, 7*unit-fh*0.5);
    
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
    ellipse(3.5*unit-fw*0.5, 5.25*unit-fh*0.5, al*unit, al*unit);
    //right areola
    ellipse(6.25*unit-fw*0.5, 4.75*unit-fh*0.5, ar*unit, ar*unit);

    fill(bg);
    //Nipples
    //left nipple
    ellipse(3.5*unit-fw*0.5, 5.25*unit-fh*0.5, nl*unit, nl*unit);
    //right nipple
    ellipse(6.25*unit-fw*0.5, 4.75*unit-fh*0.5, nr*unit, nr*unit);
    popMatrix();
 }

  void leftBoob() {
    bezier(2.5*unit-fw*0.5, 4*unit-fh*0.5, rLBx1*unit-fw*0.5, rLBy1*unit-fh*0.5, rLBx2*unit-fw*0.5, rLBy2*unit-fh*0.5, 4.75*unit-fw*0.5, 4.25*unit-fh*0.5);
  }

  void rightBoob() {
    bezier(6.75*unit-fw*0.5, 3*unit-fh*0.5, (rRBx1+0.5)*unit-fw*0.5, (rRBy1-1)*unit-fh*0.5, (rRBx2+0.5)*unit-fw*0.5, rRBy2*unit-fh*0.5, 4.75*unit-fw*0.5, 4.25*unit-fh*0.5);
  }
  void update() {
    a+=0.09;
    s = sin(a*0.2);

    rLBx1 = map(cos(a*0.12), -1, 1, 1.25, 2.75);
    rLBy1 = map(sin(-a*0.5), -1, 1, 6.75, 7.75);
    rLBx2 = map(cos(-a*0.12), -1, 1, 5.25, 6.25);
    rLBy2 = map(sin(a*0.5), -1, 1, 5.75, 6.25);

    rRBx1 = 10 - rLBx1;
    rRBy1 = rLBy1;
    rRBx2 = 10 - rLBx2;
    rRBy2 = rLBy2;

    //rNx1 = random(3.5,4.5);
    rNx1 = map(s, -1, 1, 2.5, 3.5)+noise(a/10);
    rNx2 = 8 - rNx1;
    //rAx1 = random(0.5,1.5);
    rAx1 = map(s, -1, 1, 0.5, 1.5)+noise(a/100);
    rAx2 = 9-rAx1;
    //rEx1 = random(2,3);
    rEx1 = map(s, -1, 1, 2.5, 3.5)+noise(a/1000);
    rEx2 = 11 - rEx1;
    //rWx1 = random(rEx1,3.5);
    rWx1 = map(s, -1, 1, rEx1, 3.5)+noise(a/1);
    rWx2 = 10 -rWx1;
  }


  void geo() {
    noStroke();
    fill(0, 0, 100);
    rect(0, 0, fw, fh);

    strokeWeight(3);
    stroke(0, 0, 0);
    //noFill();
    fill(0, 0, 100, 90);

    if (random(1)<0.2)
      triangle(1*unit, 4.5*unit, 8.5*unit, 3*unit, 4*unit, 0.8*unit);
    if (random(1)<0.2)
      triangle(3*unit, 9*unit, 8*unit, 8*unit, 4*unit, 0.8*unit);

    if (random(1)<0.2)
      triangle(3.5*unit, 3*unit, 1*unit, 2.5*unit, 5.5*unit, 8.5*unit);
    if (random(1)<0.2)
      triangle(5*unit, 2.5*unit, 8*unit, 1*unit, 5.5*unit, 8.5*unit);
    if (random(1)<0.2)
      triangle(3.5*unit, 1.5*unit, 5*unit, 1*unit, 5.5*unit, 8.5*unit);
    //if (random(1)<0.25)
    //  quad(2.5*unit, 4.5*unit, 3*unit, 9*unit, 8*unit, 8*unit, 7*unit, 3.5*unit);

    if (random(1)<0.2)
      quad(3*unit, 1*unit, 3.5*unit, 3*unit, 1*unit, 2.5*unit, 1*unit, 4.5*unit);
    if (random(1)<0.2)
      quad(5*unit, 0.75*unit, 5*unit, 2.5*unit, 8*unit, 1*unit, 8.5*unit, 3*unit);
    if (random(1)<0.2)    
      quad(2.5*unit, 4.5*unit, 2.5*unit, 5*unit, 3.5*unit, 7*unit, 3*unit, 9*unit);
    if (random(1)<0.2)
      quad(7*unit, 3.5*unit, 7*unit, 4*unit, 7*unit, 7*unit, 8*unit, 8*unit);
    if (random(1)<0.2)
      triangle(1*unit, 4.5*unit, 3*unit, 1*unit, 3*unit, 9*unit);
    if (random(1)<0.2)
      triangle(8.5*unit, 3*unit, 5*unit, 0.75*unit, 8*unit, 8*unit);

    //fill(0, 0, 100, 90);
    if (random(1)<0.9) {
      ellipse(3.5*unit, 4.75*unit, 2.5*unit, 2.5*unit);
      ellipse(3.5*unit, 5.25*unit, 0.2*unit, 0.2*unit);
    }
    if (random(1)<0.9) {
      ellipse(6*unit, 4.25*unit, 2.5*unit, 2.5*unit);
      ellipse(6.25*unit, 4.75*unit, 0.2*unit, 0.2*unit);
    }
  }
}