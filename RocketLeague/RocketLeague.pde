void setup() {
  Car p1 = new Car(100,300,0);
  Car p2 = new Car(800,300,180);
  Ball b1 = new Ball(50);
}

void draw() {
  
}

void background() {
  
}

void reset() {
  
}

void move() {
  while (b1.y > 300) {
    b1.y--;
  }
  while (p1.y > 300) {
    p1.y--;
  }
  while (p2.y > 300) {
    p2.y--;
  }
}

void keyPressed() {
  if (key == 'a' || key == 'A') {
    p1.drive(-10);
  }
  if (key == 'd' || key == 'D') {
    p1.drive(10);
  }
  if (key == 'w' || key == 'W') {
    p1.jump();
  }
  if (keyCode == VK_SPACE) {
    p1.boost();
  }
  if (keyCode == VK_KP_UP) {
    p2.jump();
  }
  if (keyCode == VK_KP_LEFT) {
    p2.drive(-10);
  }
  if (keyCode == VK_KP_RIGHT) {
    p2.drive(10);
  }
  if (key == '/' || key == '?') {
    p2.boost();
  }
  
}

void tick() {
  
}
