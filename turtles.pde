boolean[] keys;

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

ArrayList<Turtle> turtles;
int totalTurtles;

void setup() {
  
  size(1500, 800);
  background(0);
  
  totalTurtles = 20;
  turtles = new ArrayList<Turtle>();
  
  for (int i = 0; i < totalTurtles; i++) {
    float rth = i / (totalTurtles * 1.0) * 2 * PI;
    float gth = rth + 2 * PI / 3;
    float bth = rth + 4 * PI / 3;

    turtles.add(new Turtle(width / 2, height / 2, radians(360 / (totalTurtles * 1.0) * i), rth, gth, bth));
  }
  
  keys = new boolean[]{false, false, false};
}

void keyPressed() {
  switch (keyCode) {
    case LEFT:
      keys[0] = true;
      break;
    case UP:
      keys[1] = true;
      break;
    case RIGHT:
      keys[2] = true;
      break;
    case 'R':
      setup();
      break;
  }
}

void keyReleased() {
  switch (keyCode) {
    case LEFT:
      keys[0] = false;
      break;
    case UP:
      keys[1] = false;
      break;
    case RIGHT:
      keys[2] = false;
      break;
  }
}

void draw() {
  //print(keys[0], keys[1], keys[2], '\n');

  if (keys[0]) {
    for (Turtle t: turtles) {
      t.left(radians(3));
    }
  } else if (keys[2]) {
    for (Turtle t: turtles) {
      t.right(radians(3));
    }
  }
  
  if (keys[1]) {
    for (Turtle t: turtles) {
      t.forward(1);
      t.rainbow();
    }
  }
  
  for (Turtle t: turtles) {
    t.drawturtle();
  }

}