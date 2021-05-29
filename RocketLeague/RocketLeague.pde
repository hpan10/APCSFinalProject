Car p1;
Car p2;
Ball b1;
ScoreboardAndTimer t1;
long millis;

void setup() {
  size(1600, 900);
  p1 = new Car(100,300,0, color(0, 0, 255));
  p2 = new Car(800,300,180, color (255, 140, 0));
  b1 = new Ball(50);
  t1 = new ScoreboardAndTimer();
  millis = System.currentTimeMillis();
}

void draw() {
  tick();
  move();
  background(255);
  p1.display();
  p2.display();
  b1.display();
  t1.display();
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
  if (b1.y < 600 - b1.radius) {
    b1.dy += 1;
  }
  if (b1.y > 600 - b1.radius) {
    if (b1.dy > 2) {
      b1.y = 600 - b1.radius;
      b1.dy = -(b1.dy / 2);
    }
    else {
      b1.dy = 0;
      b1.y = 600 - b1.radius;
    }
  }
  if (p1.x <=20) {
    
    p1.x = 25;
    p1.dx = 0;
  }
  if (p2.x <=20) {
    p2.x = 25;
    p2.dx = 0;
  }
  if (p1.x >= 1590) {
    p1.x = 1580;
    p1.dx = 0;
  }
  if (p2.x >= 1590) {
    p2.x = 1580;
    p2.dx = 0;
  }
  if (Math.abs(p1.x-p2.x) <=20 && Math.abs(p1.y-p2.y) <=20) {
    p1.dx = 0;
    p1.dy = 0;
    p2.dx = 0;
    p2.dy = 0;
    if (p1.x > p2.x) {
      p1.x = p1.x + 5;
      p2.x = p2.x -5;
    }
    else {
      p1.x = p1.x - 5;
      p2.x = p2.x +5;
    }
    
    
    
    
  }
}

void keyPressed() {
  if ((key == 'a' || key == 'A')) {
    if (p1.dx >=0) {
    p1.drive((int)p1.dx-10);
    }
  }
  else if ((key == 'd' || key == 'D')) {
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
    if (p1.dx < 0) {
    p1.drive(10);
    }
  }
  if (key == 'd' || key == 'D') {
    if (p1.dx > 0) {
    p1.drive(-10);
    }
  }
  
  
  if (keyCode == 37) {
    if (p2.dx < 0) {
    p2.drive(10);
    }
  }
  if (keyCode == 39) {
        if (p2.dx > 0) {
    p2.drive(-10);
    }
  }
  
  
}

void tick() {
  long nowMillis = System.currentTimeMillis();
  t1.time = 300 - (int)(nowMillis - millis) / 1000;
}
