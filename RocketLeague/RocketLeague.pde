Car p1;
Car p2;
Ball b1;

void setup() {
  size(1600, 900);
  p1 = new Car(100,300,0);
 p2 = new Car(800,300,180);
 b1 = new Ball(50);

}

void draw() {
  move();
  background(255);
  p1.display();
  p2.display();
  b1.display();
}

void background() {
  
}

void reset() {
  
}

void move() {
  //while (b1.y > 300) {
  //  b1.y--;
  //}
  if (p1.inAir == true) p1.dy += 4.9;
  if (p2.inAir == true) p2.dy += 4.9;
  if (p1.y > 600) {
    p1.dy = 0;
    p1.y = 600;
    p1.inAir = false;
  }
  if (p2.y > 600) {
    p2.dy = 0;
    p2.y = 600;
    p2.inAir = false;
  }
}

void keyPressed() {
  if (key == 'a' || key == 'A') {
    if (p1.dx >=0) {
    p1.drive((int)p1.dx-10);
    }
  }
  if (key == 'd' || key == 'D') {
    if (p1.dx <=0) {
    p1.drive((int)p1.dx+10);
    }
  }
  if (key == 'w' || key == 'W') {
    if (!p1.inAir) {
    p1.jump();
    }
  }
  if (keyCode == 32) {
    p1.boost();
  }
  if (keyCode == 38) {
    if (!p2.inAir) {
    p2.jump();
    }
  }
  if (keyCode == 37) {
    if (p2.dx >=0) {
    p2.drive((int)p2.dx-10);
    }
  }
  if (keyCode == 39) {
    if (p2.dx <=0) {
    p2.drive((int)p2.dx+10);
    }
  }
  if (key == '/' || key == '?') {
    p2.boost();
  }
  
}
void keyReleased() {
  if (key == 'a' || key == 'A') {
    p1.drive(10);
  }
  if (key == 'd' || key == 'D') {
    p1.drive(-10);
  }
  
  
  if (keyCode == 37) {
    p2.drive(10);
  }
  if (keyCode == 39) {
    p2.drive(-10);
  }
  
  
}

void tick() {
  
}
