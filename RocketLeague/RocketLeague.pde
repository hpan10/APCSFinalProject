Car p1;
Car p2;
Ball b1;
ScoreboardAndTimer t1;
long millis;

void setup() {
  size(1600, 900);
  p1 = new Car((float)width/5 , 6 * (float)width/16,0, color(0, 0, 255));
  p2 = new Car(4 * (float)width/5,6 * (float)width/16,180, color (255, 140, 0));
  b1 = new Ball(50);
  t1 = new ScoreboardAndTimer();
  millis = System.currentTimeMillis();
}

//void background() {
//  for (float x = 
//}

void draw() {
  tick();
  background();
  p1.display();
  p2.display();
  b1.display();
  t1.display();
  move();
}
void background() {
background(255);
fill(0,255,0);
rect(0,600,1600,900);
fill(51,255,248);
rect(0,0,1600,600);
fill(255);
noStroke();
rect(0,300,100,320,20);
rect(80,300,100,600,20);
rect(1600,300,1500,320,20);
rect(1500,300,1520,600,20);
stroke(1);
}

void reset() {
  
}

void move() {
  System.out.println(p1.dy);
  if (p1.y < 600) p1.inAir = true;
  if (p2.y < 600) p2.inAir = true;
  if (p1.inAir) p1.dy += height/900;
  else {
    if (p1.dx >= -width/300 && p1.left) {
      p1.drive((float)-width/10000);
    }
    if (p1.dx <= width/300 && p1.right) {
      p1.drive((float)width/10000);
    }
  }
  if (p2.inAir) p2.dy += height/900;
  else {
    if (p2.dx >= -width/300 && p2.left) {
      p2.drive((float)-width/10000);
    }
    if (p2.dx <= width/300 && p2.right) {
      p2.drive((float)width/10000);
    }
  }
  if (p1.y >= 600) {
    p1.dy = 0;
    p1.y = 600;
    p1.inAir = false;
  }
  if (p2.y >= 600) {
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
  if (Math.abs(p1.x-p2.x) <= p1.size && Math.abs(p1.y-p2.y) <= p1.size) {
    float temp = p1.dx;
    if (p1.dx > .5 && p2.dx > .5) {
      if (p2.x > p1.x) {
        p2.dy -= (float)height/180 * Math.abs(p1.dx - p2.dx);
        p1.dx -= p2.dx;
        p2.dx += temp;
      }
      else {
        p1.dy -= (float)height/180 * Math.abs(p2.dx - p1.dx);
        p1.dx += p2.dx;
        p2.dx -= temp;
      }
    }
    else if (p1.dx < -.5 && p2.dx < -.5) {
      if (p2.x < p1.x) {
        p2.dy -= (float)height/180 * Math.abs(p1.dx - p2.dx);
        p1.dx -= p2.dx;
        p2.dx += temp;
      }
      else {
        p1.dy -= (float)height/180 * Math.abs(p2.dx - p1.dx);
        p1.dx += p2.dx;
        p2.dx -= temp;
      }
    }
    else {
      p1.dy -= (float)height/180 * Math.abs(p2.dx/1.5);
      p2.dy -= (float)height/180 * Math.abs(p1.dx/1.5);
      p1.dx = p2.dx;
      p2.dx = temp;
    }
    if (p1.x > p2.x) {
      p1.x = p1.x + (float)width/320;
      p2.x = p2.x - (float)width/320;
    }
    else {
      p1.x = p1.x - (float)width/320;
      p2.x = p2.x + (float)width/320;
    }
  }
  if (!p1.inAir) p1.dx /= 1.01;
  if (!p2.inAir) p2.dx /= 1.01;
}

void keyPressed() {
  System.out.println(keyCode);
  if ((key == 'a' || key == 'A')) p1.left = true;
  if ((key == 'd' || key == 'D')) p1.right = true;
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
  if (keyCode == 37) p2.left = true;
  if (keyCode == 39) p2.right = true;
  if (key == '/' || key == '?') {
    p2.boost();
  }
  
}

void keyReleased() {
  if ((key == 'a' || key == 'A')) p1.left = false;
  if ((key == 'd' || key == 'D')) p1.right = false;
  if (keyCode == 37) p2.left = false;
  if (keyCode == 39) p2.right = false;
}

void tick() {
  long nowMillis = System.currentTimeMillis();
  t1.time = 300 - (int)(nowMillis - millis) / 1000;
}
