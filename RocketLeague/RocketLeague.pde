Car p1;
Car p2;
Ball b1;
ScoreboardAndTimer t1;
long millis;

void setup() {
  size(1600, 900);
  p1 = new Car((float)width/5 , 6 * (float)width/16,0, color(0, 0, 255));
  p2 = new Car(4 * (float)width/5,6 * (float)width/16,180, color (255, 140, 0));
  b1 = new Ball((float)height/18);
  t1 = new ScoreboardAndTimer();
  millis = System.currentTimeMillis();
}

void draw() {
  tick();
  background();
  p1.display();
  p2.display();
  b1.display();
  t1.display();
  drawGoals();
  move();
}

void background() {
  background(255);
  fill(0,255,0);
  rect(0,2 * height/3,width,height);
  fill(51,255,248);
  rect(0,0,width,2 * height/3);
}

void drawGoals() {
  fill(255);
  noStroke();
  rect(-width/16,height/3 - height/150,width/16 + width/200,16 * height/45 - height/150,width/80);
  rect(width/20 + width/200,height/3,width/16 + width/200,2 * height/3 + height/50,width/80);
  rect(width + width/16,height/3 - height/150,15 * width/16 - width/200,16 * height/45 - height/150,width/80);
  rect(19 * width/20 - width/200,height/3,15 * width/16 - width/200,2 * height/3 + height/50,width/80);
  stroke(255);
  strokeWeight(4);
  fill(0);
  line(width/32,height/3 + height/60,width/16,7 * height/18 + height/60);
  line(0,height/3 + height/60,width/16,4 * height/9 + height/60);
  line(0,7 * height/18 + height/60,width/16,height/2 + height/60);
  line(0,4 * height/9 + height/60,width/16,5 * height/9 + height/60);
  line(0,height/2 + height/60,width/16,11 * height/18 + height/60);
  line(0,5 * height/9 + height/60,width/16,2 * height/3 + height/60);
  line(0,11 * height/18 + height/60,width/32,2 * height/3 + height/60);
  line(width/32,height/3 + height/60,0,7 * height/18 + height/60);
  line(width/16,height/3 + height/60,0,4 * height/9 + height/60);
  line(width/16,7 * height/18 + height/60,0,height/2 + height/60);
  line(width/16,4 * height/9 + height/60,0,5 * height/9 + height/60);
  line(width/16,height/2 + height/60,0,11 * height/18 + height/60);
  line(width/16,5 * height/9 + height/60,0,2 * height/3 + height/60);
  line(width/16,11 * height/18 + height/60,width/32,2 * height/3 + height/60);
  line(31 * width/32,height/3 + height/60,15 * width/16,7 * height/18 + height/60);
  line(31 * width/32,height/3 + height/60,width,7 * height/18 + height/60);
  line(15 * width/16,height/3 + height/60,width,4 * height/9 + height/60);
  line(15 * width/16,7 * height/18 + height/60,width,height/2 + height/60);
  line(15 * width/16,4 * height/9 + height/60,width,5 * height/9 + height/60);
  line(15 * width/16,height/2 + height/60,width,11 * height/18 + height/60);
  line(15 * width/16,5 * height/9 + height/60,width,2 * height/3 + height/60);
  line(15 * width/16,5 * height/9 + height/60,15 * width/16,2 * height/3 + height/60);
  line(15 * width/16,11 * height/18 + height/60,31 * width/32,2 * height/3 + height/60);
  line(31 * width/32,2 * height/3 + height/60,width,11 * height/18 + height/60);
  line(width,height/3 + height/60,15 * width/16,4 * height/9 + height/60);
  line(width,7 * height/18 + height/60,15 * width/16,height/2 + height/60);
  line(width,4 * height/9 + height/60,15 * width/16,5 * height/9 + height/60);
  line(width,height/2 + height/60,15 * width/16,11 * height/18 + height/60);
  line(width,5 * height/9 + height/60,15 * width/16,2 * height/3 + height/60);
  
  strokeWeight(1);
  stroke(1);
}

void reset() {
  
}

void move() {
  if (p1.y < 2 * height/3) p1.inAir = true;
  if (p2.y < 2 * height/3) p2.inAir = true;
  if (p1.boosting && Math.abs(p1.dx) < (float)width/200) p1.boost();
  if (p2.boosting && Math.abs(p2.dx) < (float)width/200) p2.boost();
  if (p1.inAir) p1.dy += (float)height/900;
  else {
    if (p1.dx >= (float)-width/300 && p1.left) {
      p1.drive((float)-width/10000);
      p1.angle = 180;
    }
    if (p1.dx <= (float)width/300 && p1.right) {
      p1.drive((float)width/10000);
      p1.angle = 0;
    }
    if (p1.left && p1.right) {
      if (p1.dx > 0) p1.angle = 0;
      else p1.angle = 180;
    }
  }
  if (p2.inAir) p2.dy += (float)height/900;
  else {
    if (p2.dx >= (float)-width/300 && p2.left) {
      p2.drive((float)-width/10000);
      p2.angle = 180;
    }
    if (p2.dx <= (float)width/300 && p2.right) {
      p2.drive((float)width/10000);
      p2.angle = 0;
    }
    if (p2.left && p2.right) {
      if (p2.dx > 0) p2.angle = 0;
      else p2.angle = 180;
    }
  }
  if (p1.y <= 0) {
    p1.dy = p1.dy*-1;
  }
  if (p2.y <= 0) {
    p2.dy = p2.dy*-1;
  }
  if (p1.y >= 2 * (float)height/3) {
    p1.dy = 0;
    p1.y = 2 * (float)height/3;
    p1.inAir = false;
  }
  if (p2.y >= 2 * (float)height/3) {
    p2.dy = 0;
    p2.y = 2 * (float)height/3;
    p2.inAir = false;
  }
  if (b1.y < 2 * height/3 - b1.radius + p1.size/2) {
    b1.inAir = true;
    b1.dy += (float)height/900;
  }
  if (b1.y > 2 * (float)height/3 - b1.radius + p1.size/2) {
    if (Math.abs(b1.dy) > (float)height/300) {
      b1.y = 2 * (float)height/3 - b1.radius + p1.size/2;
      b1.dy = -Math.abs(b1.dy / 1.5);
      b1.dx /= 1.1;
    }
    else {
      b1.dy = 0;
      b1.y = 2 * (float)height/3 - b1.radius + p1.size/2;
      b1.inAir = false;
    }
  }
  if (p1.x < p1.size/2 || p1.x > width - p1.size/2) {
    if (p1.x < p1.size/2) p1.x = p1.size/2;
    else p1.x = width - p1.size/2;
    p1.dx *= -1;
  }
  if (p2.x < p2.size/2 || p2.x > width - p2.size/2) {
    if (p2.x < p2.size/2) p2.x = p2.size/2;
    else p2.x = width-p2.size/2;
    p2.dx *= -1;
  }
  if (Math.abs(p1.x-p2.x) <= p1.size && Math.abs(p1.y-p2.y) <= p1.size) {
    if (p1.y != p2.y) {
      if (p1.x > p2.x) {
        p1.x += p1.size/2;
        p2.x -= p2.size/2;
      }
      else {
        p1.x -= p1.size/2;
        p2.x += p2.size/2;
      }
    }
    float temp = p1.dx;
    if (p1.dx > .5 && p2.dx > .5) {
      if (p2.x > p1.x) {
        p2.dy -= (float)height/360 * Math.abs(p1.dx - p2.dx);
        p1.dx -= p2.dx;
        p2.dx += temp;
      }
      else {
        p1.dy -= (float)height/360 * Math.abs(p2.dx - p1.dx);
        p1.dx += p2.dx;
        p2.dx -= temp;
      }
    }
    else if (p1.dx < -.5 && p2.dx < -.5) {
      if (p2.x < p1.x) {
        p2.dy -= (float)height/360 * Math.abs(p1.dx - p2.dx);
        p1.dx -= p2.dx;
        p2.dx += temp;
      }
      else {
        p1.dy -= (float)height/360 * Math.abs(p2.dx - p1.dx);
        p1.dx += p2.dx;
        p2.dx -= temp;
      }
    }
    else {
      p1.dy -= (float)height/180 * Math.abs(p2.dx * 1600/width);
      p2.dy -= (float)height/180 * Math.abs(p1.dx * 1600/width);
      p1.dx = p2.dx;
      p2.dx = temp;
    }
  }
  if (!p1.inAir) p1.dx /= 1.01;
  if (!p2.inAir) p2.dx /= 1.01;
  if (!b1.inAir) b1.dx /= 1.01;
  if (Math.pow(b1.x-p1.x, 2) + Math.pow(b1.y-p1.y, 2) <= Math.pow(b1.radius + p1.size/2, 2)) {
    if (b1.inAir) {
      float currentBallAngle = atan2(b1.dy, b1.dx);
      float currentCarAngle  = atan2(p1.dy, p2.dx);
      float velocityBall = sqrt((b1.dx * b1.dx) + (b1.dy * b1.dy));
      float velocityCar  = sqrt((p1.dx * p1.dx) + (p1.dy * p1.dy));
      if (b1.dx > 0 && p1.dx > 0 || b1.dx < 0 && p1.dx < 0) {
        b1.dx = p1.dx * 2 - cos(currentBallAngle) * velocityCar;
        b1.dy = -(Math.abs(p1.dx) * (float)width/480) - sin(currentBallAngle) * velocityCar;
      }
      else {
        b1.dx = p1.dx * 2 - cos(currentBallAngle - currentCarAngle) * velocityCar;
        b1.dy = -(Math.abs(p1.dx) * (float)width/480) - sin(currentBallAngle - currentCarAngle) * velocityCar;
        p1.dx += cos(currentBallAngle) * velocityBall/10;
      }
    }
    else {
      float tempDx = b1.dx;
      b1.dx = p1.dx * 2;
      b1.dy = -(Math.abs(p1.dx) * (float)width/480);
      p1.dx = tempDx/10;
    }
  }
  if (b1.x < b1.radius || b1.x > width - b1.radius) {
    if (b1.x < b1.radius) b1.x = b1.radius;
    else b1.x = width-b1.radius;
    b1.dx *= -1;
  }
}

void keyPressed() {
  if ((key == 'a' || key == 'A')) p1.left = true;
  if ((key == 'd' || key == 'D')) p1.right = true;
  if (key == 'w' || key == 'W') {
    if (!p1.inAir) {
    p1.jump();
    }
  }
  if (keyCode == 32) p1.boosting = true;
  if (keyCode == 38) {
    if (!p2.inAir) {
    p2.jump();
    }
  }
  if (keyCode == 37) p2.left = true;
  if (keyCode == 39) p2.right = true;
  if (key == '/' || key == '?') p2.boosting = true;
  
}

void keyReleased() {
  if ((key == 'a' || key == 'A')) p1.left = false;
  if ((key == 'd' || key == 'D')) p1.right = false;
  if (keyCode == 37) p2.left = false;
  if (keyCode == 39) p2.right = false;
  if (keyCode == 32) p1.boosting = false;
  if (key == '/' || key == '?') p2.boosting = false;
}

void tick() {
  long nowMillis = System.currentTimeMillis();
  t1.time = 300 - (int)(nowMillis - millis) / 1000;
}
