class Strand {

  color c; // color of the thread
  float inner, outer; // inner is actual thread, outer is the space around thread
  boolean pedal; // true means up false means down
  float posx,posy; //position of the strand top left corner co-ordinates

  Strand(color tempc, float tempinner, float tempouter, boolean temppedal,float tempposx,float tempposy) {
    c = tempc;
    inner = tempinner;
    outer = tempouter;
    pedal = temppedal;
    posx  = tempposx;
    posy  = tempposy;
  }

  void invertPedal() {
    pedal = !pedal;
  }
  void moveX(){
    posx += outer;
  }
  void moveY(){
    posy += outer;
  }

  void drawStrand(float w,float h) {
    fill(c);
    noStroke();
    rect(posx,posy,w,h);   
  }
}