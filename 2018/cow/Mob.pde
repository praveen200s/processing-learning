class Mob {
  Human humans[];
  int count=500;
  int vindex;
  boolean vstatus=false;
  boolean pset = false;
  float angle =0;
  int deathcount = 0;
  PVector died[];

  Mob() {
    //initiate humans in the mob
    humans = new Human[count];
    died = new PVector[maxdead];
    for (int i=0; i< count; i++)
      humans[i] = new Human();
    for (int i=0; i< maxdead; i++)
      died[i] = new PVector(width/2,height/2);
      
}

  void plot(PVector _cv) {
    //move & show the humans
  if(deathcount < maxdead){
    if (!vstatus) {
      for (int i=0; i< count; i++) {
        humans[i].move(_cv);
      }
    }else{
      kill(_cv);     
    }
  }
    for (int i=0; i< count; i++) {
      humans[i].show(deathcount);
    }
  }

  void selectVictim(PVector _cv) {
   
    float d = 0;
    boolean condition = true;
    while (condition) {
      vindex = floor(random(count));
      d = humans[vindex].pos.dist(_cv);
      if( humans[vindex].alive && d <= 200 && d >=100)
        condition =false;
    }
    //put the status for victim found
    humans[vindex].target = true;
    vstatus = true;

  }

  void pointer(PVector _cv) {
    //every 5sec find a new victim only if no victim on radar

    //if (millis() - time >= 2000 && !vstatus && random(1) < 0.01) {
      if (!vstatus && random(1) < 0.01) {
      selectVictim(_cv);
      time =millis();
    }
 
    //draw the image
    pushMatrix();
    translate(_cv.x,_cv.y);  
    imageMode(CENTER);
    image(cow, 0, 0, 80, 80 );
    popMatrix();
  }
  
  void kill(PVector _cv){
    int checkdead =0;
    for (int i=0; i< count; i++) {
      if(i != vindex && humans[i].alive)
        checkdead+=humans[i].attack(humans[vindex].pos,_cv);
      }
     //check if dead
     if(checkdead >=5){
       humans[vindex].target = false;
       humans[vindex].alive = false;
       vstatus =false;
       pset = false;
       died[deathcount] = humans[vindex].pos;
       deathcount++;       
     }
  }
  
  void connect(PVector _cv){
    
   
    
    if(deathcount < maxdead){
      stroke(c3,10);
       noFill();
    //fill(c3,10);
    }else{
      noStroke();
    fill(c3);
    }
    //stroke(c3);
    //strokeWeight(1);
    //smooth();
    pushMatrix();
    translate(_cv.x,_cv.y);
    rotate(theta);
    beginShape();
    vertex(0, 0);
    //vertex(width,height);
    for (int i=0; i< died.length; i++) {
      
      if(died[i] != null){
        //println(died[i].x + "--" + died[i].y);
        //curveVertex(died[i].x -_cv.x,died[i].y -cv.y);
        //vertex(died[i].x,died[i].y);
        quadraticVertex(0, 0, died[i].x -_cv.x,died[i].y -cv.y);
        //quadraticVertex(width,height, died[i].x,died[i].y);  
    }
      
    }
    endShape(CLOSE);
    popMatrix();
  }
  
}