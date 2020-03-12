class Boob {
  PGraphics pg;
  float fw, fh, unit;
  float noise;
  float lbcx,lbcy,rbcx,rbcy;
  float al, ar, nl, nr,lnpx,lnpy,rnpx,rnpy;
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
    
    pg = createGraphics((int)_s, (int)_s);
    
    c = this.skin[(int)random(8)];

    //noise
    noise = random(10);
    
    //size of nipples
    al = random(0.5, 0.8);
    ar = random(0.5, 0.8);

    nl = nr = 0.25;
    
    //controls of boobs
    lbcx = random(-1,3);
    lbcy = random(6,8);
    rbcx = random(10,12);
    rbcy = random(-5,1);
    
    
    //lbcx = map(mouseX,0,width,0,10);
    //lbcy = map(mouseY,0,height,0,10);
    
    //position of nipples
    lnpx = random(3,3.5);
    rnpx = 10 - lnpx;
    lnpy = rnpy =random(4,5.5);
    
    
  }

  void drawBoob() {
    
    pg.beginDraw();
    pg.colorMode(HSB, 360, 100, 100, 100);
    //pg.pushMatrix();
    //pg.translate(fw/2,-fh/4);
    //pg.rotate(PI*0.25);
    
    pg.noStroke();
    pg.fill(0,0,100);
    pg.rect(0,0,fw,fh);
    
    pg.strokeWeight(3);
    pg.stroke(0, 0, 0);
    
     
    
    pg.noFill();
  
    pg.beginShape();
    //pg.vertex(3*unit, 3*unit);
    //pg.quadraticVertex(1*unit, 6*unit, 5*unit,5*unit);
    //pg.bezierVertex(10*unit, 7*unit,6.5*unit, 0*unit, 5*unit,5*unit);
    //pg.bezierVertex(4.75*unit, 6*unit,5.5*unit, 7*unit, 5*unit,8*unit);
    //pg.bezierVertex(4.5*unit, 8.5*unit,4.5*unit, 7.5*unit, 5*unit,8*unit);
    
    pg.vertex(0*unit, 0*unit);
    
    //float a = map(mouseX,0,width,10,12);
    //float b = map(mouseY,0,height,-4,1);
    //pg.ellipse(a*unit,b*unit,3,3);
    //println(a+"---"+b);
    
    pg.quadraticVertex(lbcx*unit, lbcy*unit, 5*unit,5*unit);
     //pg.quadraticVertex((10-lbcx)*unit, lbcy*unit, 9*unit,1*unit);
    pg.bezierVertex((10-lbcx)*unit, lbcy*unit,random(5,10)*unit, random(-8,0)*unit, 5*unit,5*unit);
    //pg.line(5*unit,5*unit,5*unit,10*unit);
    pg.line(random(4,4.5)*unit,random(8.5,9.5)*unit,random(5.5,6)*unit,random(8.5,9.5)*unit);
    pg.bezierVertex(random(4.5,5)*unit, random(7,9)*unit,random(5,6)*unit, random(8,10)*unit, 5*unit,10*unit);
    pg.bezierVertex(4.5*unit, 9.5*unit,4.5*unit, 8.5*unit, 5*unit,10*unit);
    
    //feminine
    //pg.vertex(2*unit, 2*unit);
    //pg.quadraticVertex(lbcx*unit, lbcy*unit, 5*unit,5*unit);
    //pg.bezierVertex((10-lbcx)*unit, lbcy*unit,rbcx*unit, rbcy*unit, 5*unit,5*unit);
    //pg.bezierVertex((10-rbcx+4)*unit, (5-rbcy)*unit,random(5,6)*unit, random(8,10)*unit, 5*unit,10*unit);
    //pg.bezierVertex(random(4,5)*unit, random(9,10)*unit,random(4,5)*unit, random(8,9)*unit, 5*unit,10*unit);
    
    pg.endShape();
    
    pg.noStroke();
    
    pg.fill(0,0,0);
    //areola
    //left areola
    pg.ellipse(lnpx*unit,lnpy*unit,al*unit,al*unit);
    //right areola
    pg.ellipse(rnpx*unit,rnpy*unit,ar*unit,ar*unit);
    
    pg.fill(bg);
    //Nipples
    //left nipple
    pg.ellipse(lnpx*unit,lnpy*unit,nl*unit,nl*unit);
    //right nipple
    pg.ellipse(rnpx*unit,rnpy*unit,nr*unit,nr*unit);
 
    //pg.popMatrix();
 
    pg.endDraw();
}
  
  
  
  
}