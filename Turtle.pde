class Turtle {
  float x, y, dir, rth, gth, bth;
  
  Turtle(float x, float y, float dir, float rth, float gth, float bth) {
    this.x = x;
    this.y = y;
    this.dir = dir;
    this.rth = rth;
    this.gth = gth;
    this.bth = bth;
  }
  
  void forward(float steps) {
    this.x += steps * sin(this.dir);
    this.y += steps * cos(this.dir);
  }
  
  void left(float rad) {
    this.dir += rad;
  }
  
  void right(float rad) {
    this.dir -= rad;
  }
  
  void rainbow() {
    this.rth += 0.01;
    this.gth += 0.01;
    this.bth += 0.01;
  }
  
  void drawturtle() {
    float r = (sin(rth) + 1) * 255 / 2;
    float g = (sin(gth) + 1) * 255 / 2;
    float b = (sin(bth) + 1) * 255 / 2;
    
    pushMatrix();
    translate(this.x, this.y);
    rotate(90 - dir);
    fill(r, g, b);
    stroke(r, g, b);
    triangle(-5, 0, 5, 0, 0, 10);
    popMatrix();
  }
  
}


