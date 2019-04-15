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

  void plot() {
    //move & show the humans


    if (!vstatus) {
      for (int i=0; i< count; i++) {
        humans[i].move();
      }
    }else{
      kill();     
    }
  
    for (int i=0; i< count; i++) {
      humans[i].show(deathcount);
    }
  }

  void selectVictim() {
    // select human randomly
    vindex = floor(random(count));
    //check if its already dead
    while (!humans[vindex].alive) {
      vindex = floor(random(count));
    }
    //put the status for victim found
    humans[vindex].target = true;
    vstatus = true;
    //ping.play();
  }

  void pointer() {
    //every 5sec find a new victim only if no victim on radar

    if (millis() - time >= 2000 && !vstatus && !pset && random(1) < 0.2) {
      selectVictim();
      time =millis();
    }

    if (!vstatus && !pset) { //if no victim & pointer not set then move else dont move
      angle = noise(nFactor)*TWO_PI;
      nFactor+=0.03;
    } else if (vstatus && !pset) { //if victim there but pointer not set - set it
      float dx = humans[vindex].pos.x - width/2;
      float dy = humans[vindex].pos.y - height/2;
      angle = atan2(dy, dx)+ PI*1.25;
    }  

    //draw the image
    pushMatrix();
    translate(width/2, height/2);
    rotate(angle);
    imageMode(CENTER);
    image(wapp, 0, 0, width/6, height/6 );
    popMatrix();
  }
  
  void kill(){
    int checkdead =0;
    for (int i=0; i< count; i++) {
      if(i != vindex && humans[i].alive)
        checkdead+=humans[i].attack(humans[vindex].pos);
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
  
  void connect(){
    
    //noFill();
    //noStroke();
    //if(deathcount < maxdead)
    //fill(c3,10);
    //else
    //fill(c3);
    stroke(c3);
    strokeWeight(2);
    //smooth();
    pushMatrix();
    translate(width/2, height/2);
    rotate(theta);
    beginShape(QUADS);
    vertex(0, 0);
    //vertex(width,height);
    for (int i=0; i< died.length; i++) {
      
      if(died[i] != null){
        //println(died[i].x + "--" + died[i].y);
        //if(random(1) <0.2)
        //curveVertex(died[i].x -width/2,died[i].y -height/2);
        //else
        //if(i!=0)
        vertex(died[i].x -width/2,died[i].y -height/2);
        //quadraticVertex(0, 0, died[i].x -width/2,died[i].y -height/2);
        //quadraticVertex(width,height, died[i].x,died[i].y);  
    }
      
    }
    endShape(CLOSE);
    popMatrix();
  }
  
}