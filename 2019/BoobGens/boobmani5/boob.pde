class Boob {

  float fw, fh, unit;
  float noise;
  float al, ar, nl, nr;
  float rLBx1, rLBy1, rLBx2, rLBy2;
  float rRBx1, rRBy1, rRBx2, rRBy2;
  boolean blob, boob;
  color c;
  color bg =  color(0, 0, 100);
  color[] skin = { color(53, 64, 91), color(5, 77, 88), 
    color(211, 50, 85), color(170, 99, 64), 
    color(8, 42, 91), color(314, 42, 72), 
    color(9, 5, 91), color(254, 43, 57) };

  Boob(float _s) {
    fw = _s;
    fh = _s;
    unit = _s/10;

    //status of blob
    blob = false;
    boob = random(1)>0.5;

    c = this.skin[(int)random(8)];

    //noise
    noise = random(10);

    al = random(0.4, 0.6);
    ar = random(0.4, 0.6);

    nl = nr = 0.2;

    rLBx1 = random(0.25, 1.75)*unit;
    rLBy1 = random(5.25, 6.75)*unit;
    rLBx2 = random(5.25, 6.75)*unit;
    rLBy2 =random(5.25, 6.75)*unit;

    rRBx1 = 10*unit - rLBx1;
    rRBy1 = rLBy1;
    rRBx2 = 10*unit - rLBx2;
    rRBy2 = rLBy2;
  }

  void drawBoob() {
    noStroke();
    //fill(0, 0, 100);
    //rect(0, 0, fw, fh);

    strokeWeight(2);
    stroke(0, 0, 0);
    noFill();

    //bellybutton
    //bezier(5*unit, 8*unit, 4.75*unit, 8.5*unit, 5.25*unit, 8.5*unit, 5*unit, 7.75*unit);
    bezier(5*unit, 8*unit, random(4.5, 5)*unit, random(8.25, 8.75)*unit, random(5, 5.5)*unit, random(8.25, 8.75)*unit, 5*unit, 7.75*unit);

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
    ellipse(3.5*unit, 4.5*unit, al*unit, al*unit);
    //right areola
    ellipse(6.5*unit, 4.5*unit, ar*unit, ar*unit);

    fill(bg);
    //Nipples
    //left nipple
    ellipse(3.5*unit, 4.5*unit, nl*unit, nl*unit);
    //right nipple
    ellipse(6.5*unit, 4.5*unit, nr*unit, nr*unit);


    if (!blob) {
      //makeBlob(0);
      //for (int i=0; i<2; i++)
      //makeBlob(1);
    }
    blendMode(BLEND);
  }

  void leftBoob() {
    //bezier(2.5*unit, 3*unit, 1*unit, 6*unit, 6*unit, 6*unit, 5*unit, 3.5*unit);
    bezier(2.5*unit, 3*unit, rLBx1, rLBy1, rLBx2, rLBy2, 5*unit, 3.5*unit);
  }

  void rightBoob() {
    //bezier(7.5*unit, 3*unit, 9*unit, 6*unit, 4*unit, 6*unit, 5*unit, 3.5*unit);
    bezier(7.5*unit, 3*unit, rRBx1, rRBy1, rRBx2, rRBy2, 5*unit, 3.5*unit);
  }

  void makeBlob(int m) {
    float q=random(this.noise), n=this.noise;
    blendMode(MULTIPLY);
    noStroke();
    //pushMatrix();

    fill(this.skin[(int)random(8)], 25);
    if (m == 0) {
      beginShape();
      vertex(5*unit, 1*unit);
      quadraticVertex(random(1, 3)*unit, random(4, 5)*unit, 1*unit, 3*unit);
      vertex(random(2, 4)*unit, random(4, 5)*unit);
      quadraticVertex(random(3, 5)*unit, random(7, 10)*unit, 4*unit, 9*unit);
      vertex(random(5, 7)*unit, random(7, 10)*unit);
      quadraticVertex(random(6, 8)*unit, random(4, 5)*unit, 8*unit, 4.5*unit);
      vertex(random(8, 10)*unit, random(4, 5)*unit);
      quadraticVertex(random(7, 10)*unit, random(4, 5)*unit, 5*unit, 1*unit);
      endShape();
    } else {   
      float r= random(1, 5);
      if (random(1)>0.5)
        ellipse(random(3, 7)*unit, random(3, 7)*unit, r*unit, r*unit);
      else
        triangle(random(3, 7)*unit, random(3, 7)*unit, random(3, 7)*unit, random(3, 7)*unit, random(3, 7)*unit, random(3, 7)*unit);
    }
    //popMatrix();
    blob = true;
  }
}