class Prakriti {
  int t;
  float x, y, a, n, r=random(150,200),s=3;

  Prakriti(int type, float noise) {

    n = noise;
    t = type;
    //t = floor(random(0, 6));
    a = map(noise(n), 0, 1, 0, TWO_PI);
  }

  void drawPrakriti() {
    

    pushMatrix();
    translate(width/2 , height/2 );
    
    switch(t) {

    case 0:
      strokeWeight(s);
      stroke(pra); 
      noFill();
      ellipse(x, y, 5, 5);
      break;
    case 1:
      noStroke();
      fill(pra);
      ellipse(x, y, 5,5);
      break;  
    case 2:
      strokeWeight(s);
      stroke(pra); 
      line(x, y, x + 100*cos(a), y + 100*sin(a));
      break;
    case 3:
      strokeWeight(s);
      stroke(pra); 
      line(0, 0, x, y);
      break;
    case 4:
      strokeWeight(s);
      stroke(pra);
      noFill();
      curve(x + random(-50,50), y + random(-50,50),0, 0,  x, y , x + random(-150,150), y + random(-150,150));
      break;
    default:
      strokeWeight(s);
      stroke(pra);
      point(x, y);
    }

    popMatrix();
  }
  void updatePrakriti() {
    x = r * cos(a) + random(50);
    y = r * sin(a) + random(50);
    a -= map(sin(n),-1,1,-0.08,0.08);
    r += map(cos(n), -1, 1, -0.5, 0.5);
    s = map(sin(n),-1,1,1,3);
    if (abs(r) > 600) {
      r = 150;
    }
  }
}