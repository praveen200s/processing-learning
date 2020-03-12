import com.hamoid.*;

Boob[] fs;
int cell, num=2;
int uni;
float n=0;
VideoExport videoExport;

void setup() {
  size(800, 800);

  colorMode(HSB, 360, 100, 100, 100);
  background(0, 0, 100);
  color(0, 0, 0);
  stroke(0, 0, 0);
  strokeCap(SQUARE);

  cell = width/num;
  fs = new Boob[num*num];
  uni = width/10;

  for (int i=0; i<num*num; i++) {
    fs[i] = new Boob(cell);
  }

  videoExport = new VideoExport(this);
  videoExport.setFrameRate(30);
  videoExport.startMovie();
}

void draw() {
  //guide();

  if (frameCount%3 == 0) {

    //cell = width/num;
    //fs = new Ass[num*num];


    for (int i=0; i<num*num; i++) {
      float xp = cell*(i%num);
      float yp = cell*int(i/num);
      pushMatrix();
      translate(xp, yp);
 
      
      //if (random(1)<0.5)
        //shearX(((HALF_PI-n)/(1.5*num*num))*(i+1-num*num*0.5));
      //if (random(1)<0.5)
        //shearY(((HALF_PI+n)/(1.5*num*num))*(i+1-num*num*0.5));
       
      //shearX((HALF_PI/(1.5*num*num))*(random(-num*num,num*num)));  
      //shearY((HALF_PI/(1.5*num*num))*(random(-num*num,num*num)));   
      
      //scale(random(1,2));  
      //if(random(1)<0.3)
        //rotate(PI/random(10,18));
       
        
      //fs[i] = new Boob(cell);
      fs[i].drawBoob();
      popMatrix();
    }
    //}
    noLoop();
    //if(frameCount%120 == 0 && num<=3){
    //num++;
    //if(num==4)
    //  {
    //    videoExport.endMovie();
    //    exit();
    //  }
    //}
    n+=HALF_PI/15;
  }
  //videoExport.saveFrame();

  if(frameCount > 900){
  videoExport.endMovie();
  exit();
  }
}
void guide() {
  strokeWeight(1);
  stroke(0, 0, 0);

  //verticals
  for (int i=1; i<10; i++)
    line(i*uni, 0, i*uni, width);

  //horizontal
  for (int i=1; i<10; i++)
    line(0, i*uni, height, i*uni);
}

void keyPressed() {
  if (key == 's')
    saveFrame("facemani-#######.jpg");
}