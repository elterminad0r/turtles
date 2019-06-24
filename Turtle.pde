float TURTLE_HEIGHT = 10;
float TURTLE_WIDTH = 10;

class Turtle {
  float x, y, dir, hue;

  Turtle(float x, float y, float dir, float hue) {
    this.x = x;
    this.y = y;
    this.dir = dir;
    this.hue = hue;
  }

  void forward(float steps) {
    this.x += steps * cos(this.dir);
    this.y += steps * sin(this.dir);
  }

  void turn(float angle) {
    this.dir += angle;
  }

  void rainbow() {
    this.hue += 1;
    this.hue %= 255;
  }

  void drawturtle() {
    pushMatrix();
    translate(this.x, this.y);
    rotate(-HALF_PI + dir);
    fill(hue, 255, 255);
    triangle(-0.5 * TURTLE_WIDTH, 0, 0.5 * TURTLE_WIDTH, 0, 0, TURTLE_HEIGHT);
    popMatrix();
  }
}
