//import com.hamoid.*;

Boob[] fs;
int cell, num=8;
int uni;
//float a =0;
//VideoExport videoExport;

void setup() {
  size(800, 800);

  colorMode(HSB, 360, 100, 100, 100);
  imageMode(CENTER);
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

  //videoExport = new VideoExport(this);
  //videoExport.setFrameRate(30);
  //videoExport.startMovie();
}

void draw() {
  //guide();
  
  if (frameCount%30 == 0) {

    //cell = width/num;
    //fs = new Ass[num*num];


    for (int i=0; i<num*num; i++) {
      float xp =0;
      //if (i >= num && int(i/num)%2 != 0)
      //xp = cell*(i%num)+cell*0.5;
      //else
      xp = cell*(i%num);

      //println(xp);

      float yp = cell*int(i/num);
     
      pushMatrix();

      translate(cell/2+xp, cell/2+yp);
      if(i%2==0 ||i==0)
       rotate(-HALF_PI);
       else
       rotate(HALF_PI);
      if(random(1) <0.1618*2)
      scale(1,-1);
      //rotate(HALF_PI*(int)random(4));
      //fs[i] = new Boob(cell);
      fs[i].drawBoob();
      image(fs[i].pg, 0, 0);
      popMatrix();
    }
    //a+=0.03;
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
  }
  //videoExport.saveFrame();

  //if(frameCount > 900){
  //videoExport.endMovie();
  //exit();
  //}
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