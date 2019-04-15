class Streak {
  PVector dots[];
  int maxdots = 25;
  float ax=0, ay=0, n=0;
  float a=0;
  Streak() {
    dots = new PVector[maxdots];
    for (int i=0; i<maxdots; i++) { 
      dots[i] = new PVector(ax, ay);
      ax+=(width/maxdots);
      ay+=noise(n)*random(height/maxdots, height/6);
      n+=0.6;
    }
  }

  void update() {
    ax =0;
    ay=0;
    for (PVector dot : dots) {
      ax+=(width/maxdots);
      ay+=noise(n)*random(height/maxdots, height/6);
      n+=0.05; 
      dot.x = ax;
      dot.y = ay;
    }
    a+=PI/250;
  }
  void show(PVector _f,PVector _fv) {
    strokeWeight(4);
    stroke(255, 255, 0,20);
    noFill();
    pushMatrix();
    
    translate(_f.x,+f.y);
    rotate(atan2(_fv.y,_fv.x)-PI/4+PI);
    scale(0.15);
    beginShape();
    for (PVector dot : dots) {
      if (random(1)<0.4)
        vertex(dot.x, dot.y);
    }
    endShape();
  popMatrix();  
}
  
}