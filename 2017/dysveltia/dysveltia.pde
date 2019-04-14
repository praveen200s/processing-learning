/*
Creates a pattern of Visual of + sign reacting to audio of mario game.
*/

// setup the sound library and audio player //<>//
import processing.sound.*;     // import the sound libraries into Processing

int cell = 20, len = 5; // cell is the size of each cell for small crosses, and len is the length of the each hand of small cross //<>//
float a, n = 0, limit ; // a is the angle of rotation, n is the noise for changing the angles, limit is for max number of small crosses on screen;
FloatList angles ; // angles float list to store angles for the cross;
float timer = 0; //timer to add angles into the floatlist
SoundFile sf;
Amplitude amp;

void setup() {

  size(600, 600);
  background(255);
  smooth();  
  //initialize
  angles = new FloatList();
  limit = (width/cell) * (height/cell);
  amp = new Amplitude(this);
  sf = new SoundFile(this, "mario.mp3");
  sf.play();

  amp.input(sf);
  noiseSeed(0);
  //frameRate(10);
}

void draw() {

  //check if the array is filled to the limit, if yes then reset
  if ( angles.size() > limit) {
    sf.stop();
    noLoop();
    //background(255);
    angles.clear();
    timer = 0;
    //n = random(5);
  } else {
    //saveFrame("insta/frame-#########.tga");
  }

  n = amp.analyze()*random(100);

  //print small crosses
  printCrosses();

  //draw the circle
  makeCircle();
  //draw the Cross
  makeCross();

  //increment timer -- dnt change this to other values for increment or the timer doesnt work.
  timer+=0.5;
}

//Prints Crosses on the screen in a geid by taking rotation angle values from floatlist
void printCrosses() {
  int count = 0; //initialize to reset value

  for (int i = 0; i < width; i+= cell) {
    for (int j = 0; j < height; j+=cell) {

      //check if count is less and size pf flot is not 0 and then make small cross on the postion
      if ( count < angles.size() && angles.size() > 0) {
        makesmallcross(i, j, angles.get(count));          
        count++;
      }
    }
  }
}

// Draw a big black circle in the center
void makeCircle() {
  pushMatrix();

  translate(width/2, height/2 );

  //fill(0,20);
  fill(255);
  //strokeWeight(2);
  //stroke(0);
  noStroke();

  ellipse(0, 0, 300, 300);

  popMatrix();
}


// Draw a Cross which rotates based on the value of noise.
void makeCross() {
  pushMatrix();

  translate(width/2, height/2 );
  a = map(noise(n), 0, 1, -45, 45);
  if (frameCount%30 == 0)
    rotate(a);

  println(a);
  scale(0.5);

  stroke(0);

  strokeWeight((int)map(n, 0, 1, 5, 7));
  noFill();

  line(-120, 0, 120, 0);
  line(0, -120, 0, 120);  

  popMatrix();

  // every time a timer gets to even number add angle value to rotatelist.
  if (frameCount%2 == 0)
    angles.append(a);

  //update noise n
  //n += 0.01;
}

// Function takes the value of coordinates of top-corner and then translates to the center of the cell and rotates with an angle r
void makesmallcross(int x, int y, float r) {


  pushMatrix();

  translate(x+cell/2, y+cell/2);
  rotate(r); 

  stroke((int)map(abs(r), 0, 10, 0, 255));
  strokeWeight((int)map(abs(r), 0, 40, 1, 3));
  noFill();

  line(-len, 0, len, 0);
  line(0, -len, 0, len);

  popMatrix();
}