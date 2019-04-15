class Human{
  PVector pos,vel;
  color c;
  boolean alive;
  boolean target;
  float angle;
  int imgnum;
  
  Human(){
  pos = new PVector(random(width),random(height));
  vel = new PVector(random(-2,2),random(-2,2));
  
  c = c1;
  alive = true;
  target = false;
  angle = random(0,TWO_PI);
  imgnum = floor(random(3));
  }

  void show(int deathcount){

  if(target && alive){
    strokeWeight(20);
  stroke(c3);
  fill(c3);  
  }
  else{
    strokeWeight(1);
  stroke(c1);
  noFill();  
}
    if(alive && deathcount < maxdead){ 
    ellipse(pos.x,pos.y,2,2);
  }else if(!alive){
    noStroke();
    pushMatrix();
    translate(width/2, height/2);
    rotate(theta);
    translate(pos.x-width/2,pos.y-height/2);
    rotate(angle);
    //if(deathcount >=maxdead){
    //bl[imgnum].filter(BLUR,6);
    //}
    if(deathcount < maxdead)
    image(bl[imgnum],0,0, 30, 30);
    else
    image(bl[imgnum],0,0, 10, 10);
    popMatrix();
}
  
  }
  
  void move(PVector _cv){

    if(alive){ //move when the person is alive & victim status is false
  //pos.x+=map(noise(nFactor,pos.y),0,1,-5,5);
  //pos.y+=map(noise(nFactor,pos.x),0,1,-5,5);
  pos.x +=vel.x;
  pos.y +=vel.y;
  if(pos.x >width)
    pos.x = 0;
  if(pos.x <0)
    pos.x = width;
  if(pos.y >height)
    pos.y = 0;
  if(pos.y <0)
    pos.y = height;
    
  //if(pos.x >width || pos.x <0)
  //  vel.x = -vel.x;
  //if(pos.y >height || pos.y <0)
  //  vel.y = -vel.y;
    
    
    float rnd = random(150,200);
  if(pos.dist(_cv) < rnd){
      
      PVector temp1 = new PVector();
      PVector temp2 = new PVector();
      
      temp1.x = pos.x - _cv.x;
      temp1.y = pos.y - _cv.y;
      temp2.x = _cv.x + (temp1.x/temp1.mag())*rnd;
      temp2.y = _cv.y + (temp1.y/temp1.mag())*rnd;
      //ellipse(temp2.x,temp2.y,10,10);
      pos.lerp(temp2,0.02);
  }
  }  
}
int attack(PVector pv,PVector _cv){
  if(pos.dist(pv) < 200){
    
  pos.lerp(pv, 0.012);
  }else{
  move(_cv);
  }
  if(pos.dist(pv) < 20)
    return 1;
  else
    return 0;
}

}