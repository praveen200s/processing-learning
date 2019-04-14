class Warp {

  int wa_max=25;  
  float wa_o = height/wa_max;  
  float wa_i = (wa_o)*0.8;
  Strand[] stran = new Strand[wa_max];
  color c,c1,c2;
  //boolean[] p = {true,false};//For sequence of 12
  boolean[] p = {true,false,false};//For sequence of 123
  Weft we;
  int countX =0,plen =p.length;

  Warp() {
    
    c1 = color(69,125,151);
    c2 = color(255,253,192);
    
    we = new Weft();
    for (int i= 0; i < wa_max; i++) {
      
      //c= c2; // for Wa-W
     
      //if(i%2 == 0) // for Wa-BW
      //if(i%2 == 1)// for Wa-WB
      //if(i%3 == 0) // for Wa-BWW
      //if(i%4 == 0) // for Wa-BWWW
      //if(i%4 == 0 || i%4 == 1)  // for Wa-BBWW
      //  c = c1;
      //else  
        c = c2;
      
       
        
        
        
        
        
      
      stran[i] = new Strand(c, wa_i, wa_o, p[i%plen], 0, i*wa_o);
      //stran[i] = new Strand(c, wa_i, wa_o, random(1)>=0.5?true:false, 0, i*wa_o);
    }
  }

  void paint() {
    we.st.posy =0;
    for (int i= 0; i < wa_max; i++) {
      simple_w(i);
      //twill_w(i); //only works for the p array of TFF
    }
    we.st.moveX();
    countX++;
    //if(countX%2 == 0)  //for We-BW
     //if(countX%3 == 0) // for We-BWW
     //if(countX%4 == 0) // for We-BWWW
     //if(countX%4 == 0 || countX%4 == 1)  // for We-BBWW
     //  we.st.c = c1;
     //else
     //  we.st.c = c2;
    
    
    if (we.st.posx > width){
      noLoop();
    //setup();
    countX = 0; 
  }
  }

  void simple_w(int i) {
    if (stran[i].pedal) {
       we.st.drawStrand(we.st.inner, wa_o);
      stran[i].drawStrand(we.st.outer, wa_i);
       
  } else {
       stran[i].drawStrand(we.st.outer, wa_i);
      we.st.drawStrand(we.st.inner, wa_o); 
  }
    stran[i].moveX();
    stran[i].invertPedal();
    we.st.moveY();
    
}
  
  void twill_w(int i){
  if (stran[i].pedal) {
      stran[i].drawStrand(we.st.outer, wa_i);
      we.st.drawStrand(we.st.inner, wa_o);  
  } else {
      we.st.drawStrand(we.st.inner, wa_o);
      stran[i].drawStrand(we.st.outer, wa_i);  
  }
    stran[i].moveX();
    we.st.moveY();
    if(countX%plen == 0){
        if(i%plen == 0 || i%plen == 2)
          stran[i].invertPedal();
    }
     if(countX%plen == 1){
        if(i%plen == 0 || i%plen == 1)
          stran[i].invertPedal();
    }
     if(countX%plen == 2){
        if(i%plen == 1 || i%plen == 2)
          stran[i].invertPedal();
    }
          
  }
  
}