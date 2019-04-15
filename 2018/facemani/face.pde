class Face{

  float fw,fh,e;
  float nPr,eSr,eEr,xcPr,ycPr1,ycPr2,ycPr3,ycPr4;
  float noise;
  boolean blob;
  color[] skin = {color(255,223,196),color(231,158,109),
                  color(240,200,201),color(203,132,66),
                  color(225,184,153),color(198,120,86),
                  color(112,65,57),color(255,220,178)};
  
  Face(float _s){
  fw = _s;
  fh = _s;
  e = _s/10;
  //eye start random
  eSr = random(fh/4,fh/3);
  //eye end random
  eEr = random(fh/3,3*fh/8);
  
  
  //noise tip random
  nPr = random(7*fw/20,9*fw/20);
  
  //x control point random
  xcPr= random(7*fw/12,3*fw/4);
  
  //y control point random
  ycPr1 = random(fh/8,fh/4);
  ycPr2 = random(3*fh/8,fh/2);
  ycPr3 = random(5*fw/8,2*fw/3);
  ycPr4 =  random(13*fh/16,7*fh/8);

  //status of blob
  blob = false;
  
  //noise
  noise = random(10);
  
  }
  
  void drawface(){  
  
  //if(!blob)
  makeBlob();  
   
  stroke(0,0,0);
  fill(0,0,100);
  ellipse(2*fw/3 -fw/3,fh/3,e,e);
  ellipse(2*fw/3,fh/3,e,e);
  stroke(0,0,100);
  strokeWeight(5);
  noFill();
  beginShape();
    
  vertex(fw/2, 0);
  
  //eye
  vertex(fw/2, eSr);
  quadraticVertex(xcPr -fw/3, ycPr1, fw - 5*fw/6, fh/3);
  quadraticVertex(xcPr - fw/3, ycPr2, fw/2, eEr);
  quadraticVertex(xcPr, ycPr1, 5*fw/6, fh/3);
  quadraticVertex(xcPr, ycPr2, fw/2, eEr);
  
  //nose
  vertex(nPr,37*fh/60);
  vertex(fw/2,37*fh/60);
  vertex(fw/2,43*fh/60);
  
  //mouth
  if(random(1)<0.7)
  quadraticVertex(fw/2, ycPr3, 3*fw/4, 23*fh/30);
  else
  vertex(3*fw/4, 23*fh/30);
  
  
  if(random(1)<0.6)
  quadraticVertex(fw/2,ycPr4, fw/2,  23*fh/30);
  else
  vertex(fw/2,  23*fh/30);
 
  
  //chin
  vertex(fw/2, fh);
  
  endShape(OPEN);

  }
  
  void makeBlob(){
  float q=random(this.noise),n=this.noise;
    
  noStroke();
  
  pushMatrix();
  translate(fw/2,fh/2);
  fill(0,0,100,25);
  rect(0,0,fw,fh);
  fill(this.skin[(int)random(8)],80);
  beginShape();
  for(float a= -HALF_PI;a<TWO_PI;a+=PI*0.01){
    //n = noise(q,n);
    //n=noise(q*2.5);
    n = sin(q*0.099);
    //ellipse(n*fw*0.7*cos(a),n*fh*0.7*sin(a),5,5);
    vertex(n*fw*0.7*cos(a),n*fh*0.7*sin(a));
    q+=0.009;
  }
  endShape();
  popMatrix();
  blob = true;
  }
  
}