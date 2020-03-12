class Boob {

  float fw, fh, unit;
  float s, a;
  boolean lb=false, rb=false, boob=false;
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

    if (random(1)> 0.125) {
      lb = true;
    }
    if (random(1)> 0.125) {
      rb = true;
    }
    if (random(1)>0.5)
      boob = true;


    al = random(0.4, 0.6);
    //ar = random(0.4, 0.6);
    ar = al;
    nl = nr = 0.2;

    //rLBx1 = random(0.25, 1.75)*unit;
    //rLBy1 = random(6.25, 7.75)*unit;
    //rLBx2 = random(5.25, 6.75)*unit;
    //rLBy2 =random(6.25, 7.75)*unit;
  
    rLBx1 = 1.75*unit;
    rLBy1 = 6.25*unit;
    rLBx2 = 5.25*unit;
    rLBy2 = 6.25*unit;

    //rLBx1 = map(s, -1, 1, 0.25, 1.75)*unit;
    //rLBy1 = map(s, -1, 1, 6.25, 7.75)*unit;
    //rLBx2 = map(s, -1, 1, 5.25, 6.75)*unit;
    //rLBy2 = map(s, -1, 1, 6.25, 7.75)*unit;



    rRBx1 = 10*unit - rLBx1;
    rRBy1 = rLBy1;
    rRBx2 = 10*unit - rLBx2;
    rRBy2 = rLBy2;

    rNx1 = random(3.5,4.5);
    //rNx1 = map(s, 0, 1, 3.5, 4.5);
    rNx2 = 10 - rNx1;
    rAx1 = random(0.5,1.5);
    //rAx1 = map(s, 0, 1, 0.5, 1.5);
    rAx2 = 10-rAx1;
    rEx1 = random(2,3);
    //rEx1 = map(s, 0, 1, 2, 3);
    rEx2 = 10 - rEx1;
    rWx1 = random(rEx1,3.5);
    //rWx1 = map(s, 0, 1, rEx1, 3.5);
    rWx2 = 10 -rWx1;
  }

  void drawBoob() {

    noStroke();
    fill(0, 0, 100);
    rect(0, 0, fw, fh);


    strokeWeight(4);
    stroke(0, 0, 0);
    noFill();
    //Shoulders
    //left shoulder
    bezier(4*unit, 1*unit, 4*unit, 3.5*unit, 1*unit, 2*unit, 1*unit, 5*unit);
    //bezier(rNx1*unit, 1*unit, rNx1*unit, 3.5*unit, rAx1*unit, 2*unit, rAx1*unit, 5*unit);

    //right shoulder
    bezier(6*unit, 1*unit, 6*unit, 3.5*unit, 9*unit, 2*unit, 9*unit, 5*unit);
    //bezier(rNx2*unit, 1*unit, rNx2*unit, 3.5*unit, rAx2*unit, 2*unit, rAx2*unit, 5*unit);


    //Waists
    //left waist
    bezier(2.5*unit, 5*unit, 3*unit, 6*unit, 2.5*unit, 8*unit, 2.5*unit, 9*unit);
    //right waist
    bezier(7.5*unit, 5*unit, 7*unit, 6*unit, 7.5*unit, 8*unit, 7.5*unit, 9*unit);

    //bellybutton
    bezier(5*unit, 8*unit, 4.75*unit, 8.5*unit, 5.25*unit, 8.5*unit, 5*unit, 7.75*unit);
    //bezier(5*unit, 8*unit, random(4.5, 5)*unit, random(8.25, 8.75)*unit, random(5, 5.5)*unit, random(8.25, 8.75)*unit, 5*unit, 7.75*unit);

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
    //if (lb)
    ellipse(3.5*unit, 5*unit, al*unit, al*unit);
    //right areola
    //if (rb)
    ellipse(6.5*unit, 5*unit, ar*unit, ar*unit);

    fill(bg);
    //Nipples
    //left nipple
    //if (lb)
    ellipse(3.5*unit, 5*unit, nl*unit, nl*unit);
    //right nipple
    //if (rb)
    ellipse(6.5*unit, 5*unit, nr*unit, nr*unit);
  }

  void leftBoob() {

    //if (lb)
    //bezier(2.5*unit, 4*unit, 1*unit, 7*unit, 6*unit, 7*unit, 5*unit, 4.5*unit);
    bezier(2.5*unit, 4*unit, rLBx1, rLBy1, rLBx2, rLBy2, 5*unit, 4.5*unit);
    //else {
    //  stroke(315, 60, 99);
    //  strokeWeight(4);
    //  curve(2.5*unit, 0*unit, 2.5*unit, 4*unit, 5*unit, random(4.5,6)*unit, rLBx2, rLBy2);
    //}
    //stroke(0, 0, 0);
    //strokeWeight(2);
  }

  void rightBoob() {

    //if (rb)
    //bezier(7.5*unit, 4*unit, 9*unit, 7*unit, 4*unit, 7*unit, 5*unit, 4.5*unit);
    bezier(7.5*unit, 4*unit, rRBx1, rRBy1, rRBx2, rRBy2, 5*unit, 4.5*unit);
    //else {
    //  stroke(315, 60, 90);
    //  strokeWeight(4);
    //  curve(7.5*unit, 0*unit, 7.5*unit, 4*unit, 5*unit, random(4.5,6)*unit, rRBx2, rRBy2);
    //}
    //stroke(0, 0, 0);
    //strokeWeight(2);
  }

  void drawRatio() {
    noFill();
   
    strokeWeight(4);

     //stroke(230, 80, 99, 80);
    //neck
    //line((rNx1-0.2)*unit, 1*unit, (rNx2+0.2)*unit, 1*unit);

    //shoulder
    //line(1*unit, 3.5*unit, 9*unit, 3.5*unit);

    //arms
    //line((rAx1-0.2)*unit, 5*unit, (rAx2+0.2)*unit, 5*unit);

    //waist
    //line((rWx1-0.2)*unit, 7*unit, (rWx2+0.2)*unit, 7*unit);

    //end
    //line((rEx1-0.2)*unit, 9*unit, (rEx2+0.2)*unit, 9*unit);



     stroke(0, 80, 99, 40);
    //boobs
    //left
    ellipse(3.6*unit, 5*unit, abs(rLBx1-rLBx2)*0.55, abs(4*unit-rLBy2));  
    //right
    ellipse(6.4*unit, 5*unit, abs(rRBx1-rRBx2)*0.55, abs(4*unit-rRBy2));

    //areola
    //left
    line((3.5-0.5*al)*unit, 5*unit, (3.5+0.5*al)*unit, 5*unit);
    line( 3.5*unit, (5-0.5*al)*unit, 3.5*unit, (5+0.5*al)*unit);
    //right
    line((6.5-0.5*ar)*unit, 5*unit, (6.5+0.5*ar)*unit, 5*unit);
    line( 6.5*unit, (5-0.5*al)*unit, 6.5*unit, (5+0.5*al)*unit);

    //vertical
    //stroke(120, 80, 99, 80);
    //line(5*unit, 0.6*unit, 5*unit, 9.4*unit);
  }

  void update() {
    a=0.01;
    //s= sin(a);

    rLBx1 = lerp(rLBx1,0.5*unit,a);
    rLBy1 = lerp(rLBy1,7.25*unit,a);
    rLBx2 = lerp(rLBx2,6.75*unit,a);
    rLBy2 = lerp(rLBy2,7.25*unit,a);
      
    println(rLBx1/unit);  
    //rLBx1 = map(s, -1, 1, 0.5, 1.75)*unit ;
    //rLBy1 = map(s, -1, 1, 6.25, 7.25)*unit ;
    //rLBx2 = map(s, -1, 1, 5, 6.75)*unit ;
    //rLBy2 = map(s, -1, 1, 6.25, 7.25)*unit ;



    rRBx1 = 10*unit - rLBx1;
    rRBy1 = rLBy1;
    rRBx2 = 10*unit - rLBx2;
    rRBy2 = rLBy2;

    ////rNx1 = random(3.5,4.5);
    //rNx1 = min(map(s, -1, 1, 3.5, 4.5) + noise(a*1.2),4.5);
    //rNx2 = 10 - rNx1;
    ////rAx1 = random(0.5,1.5);
    //rAx1 = min(map(s, -1, 1, 0.5, 1.5) + noise(a*1.5),1.5);
    //println(rNx1);
    //rAx2 = 10-rAx1;
    ////rEx1 = random(2,3);
    //rEx1 = min(map(s, -1, 1, 2, 3) + noise(a*2),3);
    //rEx2 = 10 - rEx1;
    ////rWx1 = random(rEx1,3.5);
    //rWx1 = min(map(s, -1, 1, rEx1, 3.5) + noise(a*2.5),3.5);
    //rWx2 = 10 -rWx1;
  }
}