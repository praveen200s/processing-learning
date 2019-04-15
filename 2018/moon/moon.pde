float R = 150,a=0,h=100,t=50;
color bg,c1;
int maxp = 2500;
Particle P[] = new Particle[maxp];


void setup(){
  size(800,800);
  colorMode(HSB,100);
  
  c1 = color(map(random(360),0,360,0,100),h,90);
  bg = color(0,0,100);
  background(bg);
  
  for(int i = 0;i < maxp; i++){
  //P[i] = new Particle(width/2+R*1.2*pow(cos(a*1),1),height/2+R*1.2*pow(sin(a),1)+t*sin(-a)); 
   P[i] = new Particle(R*1.2*pow(cos(a*4),5),R*1.2*pow(sin(a*3),1)+t*sin(-a));
   a+=0.1;
  }
  a=0.0;

}

void draw(){
  //background(bg);
   
   translate(width/2,height/2);
   scale(0.25);
  rotate(a*5);
  a+=0.01;
  for(int i = 0;i < maxp; i++){
  P[i].show();
  P[i].update();
  P[i].update();
  P[i].update();
  P[i].update();
  
  }
  h-=0.2;
  if(h <30)
  h=30;
  
}

void keyPressed(){
if(key == 's')
  saveFrame("Image-########.jpg");

}