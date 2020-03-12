class Boob {

  float fw, fh, unit;
  float noise;
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

    //noise
    noise = random(10);
  }

  void drawBoob() {

    
    strokeWeight(3);
    stroke(0, 0, 0);
    noFill();

    beginShape();
    vertex(1*unit, 5*unit);
    bezierVertex(1*unit, 2*unit, 4*unit, 3.5*unit, 4*unit, 1.5*unit);
    bezierVertex(6.25*unit, 0.5*unit, 7*unit, 1.5*unit, 4.25*unit, 1.6*unit);
    bezierVertex( 4*unit, 3.5*unit, 3*unit, 3*unit, 2.5*unit, 4*unit);
    bezierVertex( 1*unit, 7*unit, 4*unit, 7*unit, 5*unit, 5.5*unit);
    bezierVertex(  6*unit, 7*unit, 9*unit, 7*unit, 7.5*unit, 4*unit);
    bezierVertex(  8.75*unit, 5.75*unit, 7*unit, 6.5*unit, 8*unit, 9.5*unit);
    bezierVertex( 6.5*unit, 9.75*unit, 5.5*unit, 9.75*unit, 5*unit, 9.5*unit);
    bezierVertex( 4.75*unit, 7.5*unit, 5.25*unit, 7.5*unit, 5*unit, 8.5*unit);
    endShape();

    //right shoulder
    bezier(6*unit, 1.5*unit, 6*unit, 3.5*unit, 9*unit, 2*unit, 9*unit, 5*unit);

    //Waists
    //left waist
    bezier(2.1*unit, 6.3*unit, 2.3*unit, 7*unit, 2.5*unit, 8*unit, 2*unit, 9.5*unit);
    
    //Boobs
    fill(bg);
    //if (random(1)>0.5) {
    //  leftBoob();
    //  rightBoob();
    //} else {
    //  rightBoob();
    //  leftBoob();
    //}

    fill(0, 0, 0);
    //areola
    //left areola
    ellipse(3.5*unit, 5.5*unit, 0.5*unit, 0.5*unit);
    //right areola
    ellipse(6.5*unit, 5.5*unit, 0.5*unit, 0.5*unit);

    fill(bg);
    //Nipples
    //left nipple
    ellipse(3.5*unit, 5.5*unit, 0.2*unit, 0.2*unit);
    //right nipple
    ellipse(6.5*unit, 5.5*unit, 0.2*unit, 0.2*unit);
    
      barcode();
}

  void leftBoob() {
    //bezier(2.5*unit, 4*unit, 1*unit, 7*unit, 6*unit, 7*unit, 5*unit, 4.5*unit);
  }

  void rightBoob() {
    //bezier(7.5*unit, 4*unit, 9*unit, 7*unit, 4*unit, 7*unit, 5*unit, 4.5*unit);
  }
  
  void barcode(){
    
    line(1*unit, 5*unit,0,1*unit, 5*unit,(float)cam.getDistance() - 800);
    
    line(1*unit, 2*unit,0,1*unit, 2*unit,(float)cam.getDistance() - 800);
    line(4*unit, 3.5*unit,0,4*unit, 3.5*unit,(float)cam.getDistance() - 800);
    line(4*unit, 1.5*unit,0,4*unit, 1.5*unit,(float)cam.getDistance() - 800);
    
    line(6.25*unit, 0.5*unit,0,6.25*unit, 0.5*unit,(float)cam.getDistance() - 800);
    line(7*unit, 1.5*unit,0,7*unit, 1.5*unit,(float)cam.getDistance() - 800);
    line(4.25*unit, 1.6*unit,0,4.25*unit, 1.6*unit,(float)cam.getDistance() - 800);
    
    
    line(4*unit, 3.5*unit,0,4*unit, 3.5*unit,(float)cam.getDistance() - 800);
    line(3*unit, 3*unit,0,3*unit, 3*unit,(float)cam.getDistance() - 800);
    line(2.5*unit, 4*unit,0,2.5*unit, 4*unit,(float)cam.getDistance() - 800);
    
    line(1*unit, 7*unit,0,1*unit, 7*unit,(float)cam.getDistance() - 800);
    line(4*unit, 7*unit,0,4*unit, 7*unit,(float)cam.getDistance() - 800);
    line(5*unit, 5.5*unit,0,5*unit, 5.5*unit,(float)cam.getDistance() - 800);
    
    line(6*unit, 7*unit,0,6*unit, 7*unit,(float)cam.getDistance() - 800);
    line(9*unit, 7*unit,0,9*unit, 7*unit,(float)cam.getDistance() - 800);
    line(7.5*unit, 4*unit,0,7.5*unit, 4*unit,(float)cam.getDistance() - 800);
    
    line(8.75*unit, 5.75*unit,0,8.75*unit, 5.75*unit,(float)cam.getDistance() - 800);
    line(7*unit, 6.5*unit,0,7*unit, 6.5*unit,(float)cam.getDistance() - 800);
    line(8*unit, 9.5*unit,0,8*unit, 9.5*unit,(float)cam.getDistance() - 800);
    
    line(6.5*unit, 9.75*unit,0,6.5*unit, 9.75*unit,(float)cam.getDistance() - 800);
    line(5.5*unit, 9.75*unit,0,5.5*unit, 9.75*unit,(float)cam.getDistance() - 800);
    line(5*unit, 9.5*unit,0,5*unit, 9.5*unit,(float)cam.getDistance() - 800);
    
    line(4.75*unit, 7.5*unit,0,4.75*unit, 7.5*unit,(float)cam.getDistance() - 800);
    line(5.25*unit, 7.5*unit,0,5.25*unit, 7.5*unit,(float)cam.getDistance() - 800);
    line(5*unit, 8.5*unit,0,5*unit, 8.5*unit,(float)cam.getDistance() - 800);
    
    line(6*unit, 1.5*unit,0,6*unit, 1.5*unit,(float)cam.getDistance() - 800);
    line(6*unit, 3.5*unit,0,6*unit, 3.5*unit,(float)cam.getDistance() - 800);
    
    line(9*unit, 2*unit,0,9*unit, 2*unit,(float)cam.getDistance() - 800);
    line(9*unit, 5*unit,0,9*unit, 5*unit,(float)cam.getDistance() - 800);
    
    line(2.1*unit, 6.3*unit,0,2.1*unit, 6.3*unit,(float)cam.getDistance() - 800);
     line(2.3*unit, 7*unit,0,2.3*unit, 7*unit,(float)cam.getDistance() - 800);
    line( 2.5*unit, 8*unit,0, 2.5*unit, 8*unit,(float)cam.getDistance() - 800);
    line( 2*unit, 9.5*unit,0, 2*unit, 9.5*unit,(float)cam.getDistance() - 800);
    
    line(3.5*unit, 5.5*unit,0,3.5*unit, 5.5*unit,(float)cam.getDistance() - 800);
    line( 6.5*unit, 5.5*unit,0, 6.5*unit, 5.5*unit,(float)cam.getDistance() - 800);

 
  }
  
}