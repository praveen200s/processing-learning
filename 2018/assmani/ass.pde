class Ass {

  float fw, fh, unit;
  float noise,LoR;
  float rLHx1,rLHy1,rLHx2,rLHy2;
  float rRHx1,rRHy1,rRHx2,rRHy2;
  boolean blob;
  color c;
  color bg =  color(0,0,100);
  color[] skin = {color(27, 22, 99), color(24, 52, 89), 
    color(0, 12, 92), color(28, 66, 78), 
    color(25, 31, 87), color(18, 55, 75), 
    color(8, 48, 43), color(32, 29, 99)};

  Ass(float _s) {
    fw = _s;
    fh = _s;
    unit = _s/10;
    
    //status of blob
    blob = false;
 
    c = this.skin[(int)random(8)];
    
    //noise
    noise = random(10);
    
    //randomVals
    LoR = random(1);
    
    rLHx1 = random(0,2)*unit;
    rLHy1 = random(6,10)*unit;
    rLHx2 = random(5,7)*unit;
    rLHy2 =random(6,8)*unit;
    
    rRHx1 = 10*unit - rLHx1;
    rRHy1 = rLHy1;
    rRHx2 = 10*unit - rLHx2;
    rRHy2 = rLHy2;
    
  }

  void drawAss() {  

    //if(!blob)
    //makeBlob();  

    //rectangle to remove
    noStroke();
    fill(0,0,100);
    rect(0,0,fw,fh);

    setGradient(2*unit,4.5*unit,6*unit,4.5*unit,c,bg);
    setGradient(2*unit,1*unit,6*unit,2.5*unit,bg,c);

    stroke(0,0,0);
    stroke(c);
    //waist
    strokeWeight(2);
    line(2*unit, 1*unit, 2*unit, 3*unit);
    line(8*unit, 1*unit, 8*unit, 3*unit);

    strokeWeight(2);
    line(5*unit, 1*unit, 5*unit, 2.5*unit);

    //legs
    strokeWeight(2);
    line(2*unit, 3*unit, 2*unit, 9*unit);
    line(8*unit, 3*unit, 8*unit, 9*unit);

    strokeWeight(unit*0.8);
    line(5*unit, 4*unit, 5*unit, 9*unit);
    stroke(0,0,100);
    strokeWeight(unit*0.6);
    line(5*unit, 4*unit, 5*unit, 9.5*unit);

    //hips
    strokeWeight(2);
    //stroke(0,0,0);
    stroke(c);
    //fill(0,0,100);

    if (LoR<0.5) {
      leftHip();
      rightHip();
    } else {
      rightHip();
      leftHip();
    }
  }

  void leftHip() {
    bezier(2*unit, 3*unit, rLHx1, rLHy1, rLHx2,  rLHy2, 5*unit, 4*unit);
  }

  void rightHip() {
    bezier(8*unit, 3*unit, rRHx1, rRHy1, rRHx2,  rRHy2, 5*unit, 4*unit);
  }

  void setGradient(float x1,float y1,float x2,float y2,color _c,color _bg){
    
  pushMatrix();
  
  for (float i = y1; i <= y1+y2; i++) {
      float inter = map(i, y1, y1+y2, 0, 1);
      color c = lerpColor(_bg, _c, inter);
      strokeWeight(1);
      stroke(c);
      line(x1, i, x1+x2, i);
      stroke(bg);
      point(random(x1,x1+x2),i);
    }
  
  popMatrix();
  }



  void makeBlob() {
    float q=random(this.noise), n=this.noise;

    noStroke();
    fill(0, 0, 100, 10);
    rect(0, 0, fw, fh);
    pushMatrix();
    translate(fw/2, fh/2);

    fill(this.skin[(int)random(8)], 80);
    beginShape();
    for (float a= -HALF_PI; a<TWO_PI; a+=PI*0.01) {
      n = noise(q,n);
      //n=noise(q*2.5);
      //n = sin(q*0.099);
      //ellipse(n*fw*0.7*cos(a),n*fh*0.7*sin(a),5,5);
      vertex(n*fw*0.7*cos(a), n*fh*0.7*sin(a));
      q+=0.009;
    }
    endShape();
    popMatrix();
    blob = true;
  }
}