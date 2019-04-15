class Rect {
  int x=0, y=0, w=0, h=0;
  int[][] iPixels;
  boolean[] flags; 
  int sq, rgb, count=10;
  boolean sw = false;
  Rect(int _x, int _y, int _w, int _h) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;



    iPixels = new int[w][h];

    if (h >= count)
      sq = w/count;
    else
      println("count higher than the box");

    flags = new boolean[count];
    fillbooleans();

    rgb = (int)random(4);
  }

  void fillbooleans() {
    for (int f=0; f<this.count; f++) {
      this.flags[f] = (random(1)<0.2?true:false);
    }
  }

  void splitinv() {

    if (frameCount%30 ==0)
      sw = !sw;

    if (sw) { 
      swapvertical();
      swaphorizontal();
    } else
      swaphorizontal();
  }

  void swaphorizontal() {
    //horizontal

    img.loadPixels();

    for (int i=0; i<this.h; i++) {
      for (int j=0; j<this.w; j++) {   

        if (flags[int(i/this.sq)]) {
          this.iPixels[j][i] = img.pixels[(this.y+i)*img.width + (this.x+this.w-j-1)];
          if (rgb == 0)
            this.iPixels[j][i] = color(random(200, 250), green(iPixels[j][i]), blue(iPixels[j][i]));
          if (rgb == 1)
            this.iPixels[j][i] = color(red(iPixels[j][i]), 200, blue(iPixels[j][i]));
          if (rgb == 2)
            this.iPixels[j][i] = color(red(iPixels[j][i]), green(iPixels[j][i]), 250);
        } else
          this.iPixels[j][i] = img.pixels[(this.y+i)*img.width + (this.x+j)];
      }
    }

    for (int i=0; i<this.h; i++) {
      for (int j=0; j<this.w; j++) {   
        img.pixels[(this.y+i)*img.width + (this.x+j)] = this.iPixels[j][i];
      }
    }
    img.updatePixels();
  }
  void swapvertical() {
    //horizontal

    img.loadPixels();

    for (int i=0; i<this.h; i++) {
      for (int j=0; j<this.w; j++) {   

        if (flags[int(j/this.sq)]) {
          this.iPixels[j][i] = img.pixels[(this.y+this.h-i-1)*img.width + (this.x+j)];
          if (rgb == 1)
            this.iPixels[j][i] = color(random(200, 250), green(iPixels[j][i]), blue(iPixels[j][i]));
          if (rgb == 2)
            this.iPixels[j][i] = color(red(iPixels[j][i]), 250, blue(iPixels[j][i]));
          if (rgb == 3)
            this.iPixels[j][i] = color(red(iPixels[j][i]), green(iPixels[j][i]), 150);
        } else
          this.iPixels[j][i] = img.pixels[(this.y+i)*img.width + (this.x+j)];
      }
    }

    for (int i=0; i<this.h; i++) {
      for (int j=0; j<this.w; j++) {   
        img.pixels[(this.y+i)*img.width + (this.x+j)] = this.iPixels[j][i];
      }
    }
    img.updatePixels();
  }
}