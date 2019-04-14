import com.hamoid.*;

import processing.sound.*;

SoundFile sf;
VideoExport videoExport;
float theta;   
float a;
float movieFPS = 30;


void setup() {
  size(800, 800);
  background(0); 
  strokeWeight(0.1);
  stroke(255);
  noFill();
  frameRate(movieFPS);
  a = 180f;
  //videoExport = new VideoExport(this);
  //videoExport.setFrameRate(movieFPS);
  //videoExport.setAudioFileName("t5.wav");
  //videoExport.startMovie();
  ////Load a soundfile
  //sf = new SoundFile(this, "t5.wav");
  //sf.play();
}

void draw() {
  background(0); 
  //a=map(millis(), 0, sf.duration()*1000, 0, 180);
  // Convert it to radians
  theta = radians(a);
  // Start the tree from the bottom of the screen
  translate(width/2, height/2);
  // Draw a line 120 pixels
  ellipse(0, 0, 400, 400);
  // Move to the end of that line
  //translate(0,-400*0.2);
  // Start the recursive branching!
  branch(400);
  //videoExport.saveFrame();
  
  //if (millis() > sf.duration()*1000) {
  //  noLoop();
  //  videoExport.endMovie();
  //  exit();
  //}
  //noLoop();
  //saveFrame("snap.jpg");
}

void branch(float h) {
  // Each branch will be 2/3rds the size of the previous one
  h *= 0.66;
  if (h > 100 && random(1)< 0.3)
    stroke(random(255), random(255), random(255));
  else
    stroke(255);


  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (h > 20) {
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(theta);   // Rotate by theta
    if (random(1) <0.8) {
      strokeWeight(0.5);
      ellipse(0, 0, h, h);// Draw the branch
    } else {
      strokeWeight(1);
      rect(0, 0, h, h);
    }
    translate(0, -h*0.2); // Move to the end of the branch
    branch(h);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state

    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-theta);
    if (random(1) <0.8) {
      strokeWeight(0.5);
      ellipse(0, 0, h, h);// Draw the branch
    } else {
      strokeWeight(1);
      rect(0, 0, h, h);
    }
    translate(0, -h*0.2);
    branch(h);
    popMatrix();
  }
}