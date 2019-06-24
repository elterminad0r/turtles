boolean[] keys;

ArrayList<Turtle> turtles;
int totalTurtles;

void setup() {
  size(1500, 800);
  background(0);

  totalTurtles = 20;
  turtles = new ArrayList<Turtle>();

  colorMode(HSB, 255, 255, 255);
  noStroke();

  for (int i = 0; i < totalTurtles; i++) {
    turtles.add(new Turtle(width / 2, height / 2, TWO_PI / (totalTurtles * 1.0) * i, 255.0 * i / totalTurtles));
  }

  keys = new boolean[255];
  for (int i = 0; i < keys.length; i++) {
    keys[i] = false;
  }
}

void keyPressed() {
  keys[keyCode] = true;
  switch (keyCode) {
    case 'R':
      setup();
      break;
  }
}

void keyReleased() {
  keys[keyCode] = false;
}

void draw() {
  //print(keys[0], keys[1], keys[2], '\n');

  if (keys[LEFT]) {
    for (Turtle t: turtles) {
      t.turn(-0.05);
    }
  } else if (keys[RIGHT]) {
    println("right");
    for (Turtle t: turtles) {
      t.turn(0.05);
    }
  }

  if (keys[UP]) {
    for (Turtle t: turtles) {
      t.forward(1);
      t.rainbow();
    }
  }

  for (Turtle t: turtles) {
    t.drawturtle();
  }

}
