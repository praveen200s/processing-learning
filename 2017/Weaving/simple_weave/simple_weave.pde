/* Simple Weave Algorithm*/

float l_size, b_size;
Warp w;

void setup() {
  size(500, 500);
  background(255,255,255);
  l_size = width;
  b_size = height;
  w = new Warp();
  //frameRate(10);
}
void draw(){
mousePressed();
}

void mousePressed(){
//paint a weft
w.paint();
// Call the warp and move as per each thread of warp
//compare the bool val and paint the first one where ever possible.
//move the weft position and direction
}
void keyPressed(){
if(key == 's')
  saveFrame("frame-#####.jpg");
}