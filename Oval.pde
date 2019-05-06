// Matthew Bardoe
// 
// Much of this code was in a setup and draw sketch
// Now it has been placed in a wrapper object to
// support serialization.


class Oval {

  int[] w, h; 
  int lanes;
  
  Oval(int ww, int hh, int ml) {
    lanes=ml;
    w= new int[lanes];
    h= new int[lanes];
    w[0]=ww;
    h[0]=hh;
    for (int i=1; i<lanes; i++) {
      w[i]=w[i-1]-150;
      h[i]=h[i-1]-150;
    }
  }





  void show() {
    // 
    push();
    strokeWeight(8);
    stroke(255);
    fill(0);
    translate(width/2, height/2);
    for (int i=0; i<lanes; i++) {
      line(-(w[i]-h[i])/2, h[i]/2, (w[i]-h[i])/2, h[i]/2);
      line(-(w[i]-h[i])/2, -h[i]/2, (w[i]-h[i])/2, -h[i]/2);
      ellipseMode(CENTER);
      arc(-(w[i]-h[i])/2, 0, h[i], h[i], PI/2, 3*PI/2);
      arc((w[i]-h[i])/2, 0, h[i], h[i], -PI/2, PI/2);
    }
    strokeWeight(0);
    pop();
  }
}
