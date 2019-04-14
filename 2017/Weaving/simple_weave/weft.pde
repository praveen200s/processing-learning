class Weft {
  int we_max=25;  
  float we_o = width/we_max;  
  float we_i = (we_o)*0.8;
  Strand st;
  color c;
  
  Weft() {  
    c = color(69,125,151);
    st = new Strand(c, we_i, we_o, true,0,0);
  }
}