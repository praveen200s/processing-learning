class Boob {

  float fw, fh, unit;
  float noise;
  float al, ar, nl, nr;
  float rLBx1, rLBy1, rLBx2, rLBy2;
  float rRBx1, rRBy1, rRBx2, rRBy2;
  boolean blob, boob;
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
    rLBy1 = random(6.25, 7.75)*unit;
    rLBx2 = random(5.25, 6.75)*unit;
    rLBy2 =random(6.25, 7.75)*unit;

    rRBx1 = 10*unit - rLBx1;
    rRBy1 = rLBy1;
    rRBx2 = 10*unit - rLBx2;
    rRBy2 = rLBy2;
  }

  void drawBoob() {
    rectMode(CORNER);
    noStroke();
    fill(0, 0, 100);
    rect(0, 0, fw, fh);
    
    strokeWeight(3);
    stroke(0, 0, 0);
    noFill();
    //Shoulders
    //left shoulder
    bezier(3.75*unit, 0*unit, 3.75*unit, 2.5*unit, 0*unit, 1*unit, 0*unit, 4*unit);
    //right shoulder
    bezier(6.25*unit, 0*unit, 6.25*unit, 2.5*unit, 10*unit, 1*unit, 10*unit, 4*unit);

    //Waists
    //left waist
    bezier(2*unit, 4*unit, 2*unit, 6*unit, 3*unit, 8*unit, 2*unit, 10*unit);
    //right waist
    bezier(8*unit, 4*unit, 8*unit, 6*unit, 7*unit, 8*unit, 8*unit, 10*unit);

    //bellybutton
     bezier(5*unit, 9*unit, 4.5*unit, 9.5*unit, 5.5*unit, 9.5*unit, 5*unit, 8.5*unit);
     
    //Boobs
    fill(bg);
    if(boob){
      leftBoob();
      rightBoob();      
    }else{
      rightBoob();
      leftBoob();          
    }
    
    fill(0,0,0);
    //areola
    //left areola
    ellipse(3.5*unit,5.5*unit,al*unit, al*unit);
    //right areola
    ellipse(6.5*unit,5.5*unit,ar*unit, ar*unit);
    
    fill(bg);
    //Nipples
    //left nipple
    ellipse(3.5*unit,5.5*unit,nl*unit, nl*unit);
    //right nipple
    ellipse(6.5*unit,5.5*unit,nr*unit, nr*unit);
    
    if (!blob) {
      //makeBlob((int)random(1,5));
      //makeBlob(3);  
  }
    
  }
  
  void leftBoob(){
  //bezier(2*unit, 4*unit, 1*unit, 7*unit, 6*unit, 7*unit, 5*unit, 4*unit);
  bezier(2*unit, 4*unit, rLBx1, rLBy1, rLBx2, rLBy2, 5*unit, 4*unit);
  }
  
  void rightBoob(){
  //bezier(8*unit, 4*unit, 9*unit, 7*unit, 4*unit, 7*unit, 5*unit, 4*unit);
  bezier(8*unit, 4*unit, rRBx1, rRBy1, rRBx2, rRBy2, 5*unit, 4*unit);
  }
  
  void makeBlob(int m){
  rectMode(CENTER);  
  noStroke();
  fill(0,0,0);
  
  switch(m){
  case 1:
        rect(fw/2,fh/2,random(3,7)*unit,random(1,5)*unit);
        break;
  case 2:
        //ellipse(fw/2,fh/2,random(3,7)*unit,random(1,5)*unit);
        break;
  case 3:
        triangle(random(1,3)*unit,random(3,5)*unit,random(7,9)*unit,random(3,5)*unit,random(2,8)*unit,random(7,10)*unit);
        break;
  case 4:
        break;  
  default:
        
  }  
  blob = true;
  }
}