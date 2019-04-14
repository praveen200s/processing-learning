color pu, pu_s, pra, bg;
int pra_num = 1001, pu_s_w = 1;
Prakriti[] ps = new Prakriti[pra_num];
float pra_n = 0, H;
int purush;
int pra_t;

void setup() {
  //fullScreen();
  size(displayHeight, displayHeight);
  smooth();
  purush = floor(random(0, 8));
  pra_t = floor(random(0, 6));
  
  colorMode(HSB, 360, 100, 100);
  H = random(260, 360);
  pu = color(0, 0, 6);
  pu_s = color(329, 98, 99);
  pra = color(329, 58, 99);
  bg = color(57, 18, 99);


  background(bg);
  for (int i = 0; i < pra_num; i++) {
    ps[i] = new Prakriti(pra_t, pra_n);
    pra_n += 0.03;
  }
  frameRate(10);
}
void draw() {

  for (int i=0; i < ps.length; i++) {
    ps[i].drawPrakriti();
    ps[i].updatePrakriti();
  }
  fill(bg, 80);
  rect(0, 0, width, height);


  drawPurush();

  pu_s = color(H, 98, 99);
  pra = color(H, 48, 99);
  H += 0.5;
  if ( H >= 360 || H <= 260)
    H = random(260, 360);
  if( frameCount%30 == 0){
    filter(DILATE);  
    //saveFrame("insta/f-#####.jpg");
    noLoop();
    setup();
    loop();
  }
  if(frameCount >300){
  noLoop();
  }
    
}

void reset(){

}

void drawPurush() {




  switch(purush) {

  case 0:
    makeSquare(pu, pu_s);
    break;
  case 1:
    makeTriangle(pu, pu_s);
    break;
  case 2:  
    makeCircle(pu, pu_s);
    break;
  case 3:
    makeSquare2(pu, pu_s);
    break;
  case 4:
    makeTriangle2(pu, pu_s);
    break;
  case 5:
    makeCircle2(pu, pu_s);
    break;
  case 6:
    makeLinga2(pu, pu_s);
    break;
  default:
    makeLinga(pu, pu_s);
    break;
  }
}