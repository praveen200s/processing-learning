class Particle{
  PVector pos,origin;
  float acc;
  //PVector target = new PVector(random(width/2-10,width/2+10),random(height+100,height+200));
  PVector target = new PVector(width/2,height/2);
  color c;

  Particle(float x,float y){
  pos = new PVector(x,y);
  origin = pos.copy();
  acc = map((height-y)/height,0,1,0.009,0.0009);
  //if(x>=200 && x <300)
  //c = color(random(10,20),h,90);
  //else if(x>=300 && x <400)
  //c = color(random(20,50),h,90);
  //else if(x>=400 && x <500)
  //c = color(random(55,75),h,90);
  //else
  //c = color(random(85,100),h,90);
  c = c1;
  }

  void show(){ 
    noStroke();
    c =color(hue(c),h,90);
    fill(c,25);
    //stroke(c1,50);
    //noFill();
    ellipse(pos.x,pos.y,2,1);
  }
  void update(){

    //pos = PVector.lerp(pos, target, acc);
    acc+=0.001;
    if(acc<1){
    pos.x = origin.x + (acc * (target.x-origin.x));
    pos.y = origin.y + (pow(acc,4) * (target.y-origin.y));
    }  
    if(acc>=1.0)
    noLoop();
}

}