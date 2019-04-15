class Human{
  PVector pos;
  color c;
  boolean alive;
  boolean target;
  float angle;
  int imgnum;
  
  Human(){
  pos = new PVector(random(width),random(height));
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
  if(alive && deathcount <maxdead){ 
    //if(alive){ 
    ellipse(pos.x,pos.y,5,5);
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
    //else
    //image(d[imgnum],0,0, 30, 30);
    popMatrix();
}
  
  }
  
  void move(){
    if(alive){ //move when the person is alive & victim status is false
  pos.x+=map(noise(nFactor,pos.y),0,1,-5,5);
  pos.y+=map(noise(nFactor,pos.x),0,1,-5,5);
  if(pos.x >width)
    pos.x = 0;
  if(pos.x <0)
    pos.x = width;
  if(pos.y >height)
    pos.y = 0;
  if(pos.y <0)
    pos.y = height;
    }
}
int attack(PVector pv){
  if(pos.dist(pv) < 200){
    
  pos.lerp(pv, 0.012);
  }else{
  move();
  }
  if(pos.dist(pv) < 20)
    return 1;
  else
    return 0;
}

}