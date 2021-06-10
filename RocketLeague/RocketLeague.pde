import java.util.*;
Car p1;
Car p2;
Ball b1;
ScoreboardAndTimer t1;
long millis;
ArrayList<Float> grassX, grassY;

void setup() {
  size(1600, 900);
  p1 = new Car((float)width/5 , 6 * (float)width/16,1, color(0, 0, 255));
  p2 = new Car(4 * (float)width/5,6 * (float)width/16,-1, color (255, 140, 0));
  b1 = new Ball((float)height/20);
  t1 = new ScoreboardAndTimer();
  grassX = new ArrayList<Float>();
  grassY = new ArrayList<Float>();
  millis = System.currentTimeMillis();
  makeGrass();
}

void draw() {
  if (b1.inGoal()) {
    if (b1.x < width/2) t1.p2Goals++;
    else t1.p1Goals++;
    reset();
  }
  tick();
  background();
  p1.display();
  p2.display();
  b1.display();
  t1.display();
  drawGoals();
  move();
}

void makeGrass() {
  stroke(38,38,255);
  for (int i = 0; i < 100; i++) {
    grassX.add((float)Math.random() * width);
    grassY.add((float)Math.random() * (float)(height/3) + (float)(height*2/3));
  }
}

void background() {
  background(255);
  fill(0,255,0);
  rect(0,2 * (float)height/3,(float)width,(float)height);
  fill(51,255,248);
  rect(0,0,(float)width,2 * (float)height/3);
  stroke(38,38,255);
  strokeWeight(10);
  for (int i = 0; i < 100; i++) {
    float x = grassX.get(i);
    float y = grassY.get(i);
    line(x,y,x,y-5);
  }
  strokeWeight(1);
  stroke(0);
}

void drawGoals() {
  fill(255);
  noStroke();
  rect(-(float)width/16,(float)height/3 - (float)height/150,(float)width/16 + (float)width/200,16 * (float)height/45 - (float)height/150,(float)width/80);
  rect((float)width/20 + (float)width/200,(float)height/3,(float)width/16 + (float)width/200,2 * (float)height/3 + (float)height/50,(float)width/80);
  rect((float)width + (float)width/16,(float)height/3 - (float)height/150,15 * (float)width/16 - (float)width/200,16 * (float)height/45 - (float)height/150,(float)width/80);
  rect(19 * (float)width/20 - (float)width/200,(float)height/3,15 * (float)width/16 - (float)width/200,2 * (float)height/3 + (float)height/50,(float)width/80);
  stroke(255);
  strokeWeight(4);
  fill(0);
  line((float)width/32,(float)height/3 + (float)height/60,(float)width/16,7 * (float)height/18 + (float)height/60);
  line(0,(float)height/3 + (float)height/60,(float)width/16,4 * (float)height/9 + (float)height/60);
  line(0,7 * (float)height/18 + (float)height/60,(float)width/16,(float)height/2 + (float)height/60);
  line(0,4 * (float)height/9 + (float)height/60,(float)width/16,5 * (float)height/9 + (float)height/60);
  line(0,(float)height/2 + (float)height/60,(float)width/16,11 * (float)height/18 + (float)height/60);
  line(0,5 * (float)height/9 + (float)height/60,(float)width/16,2 * (float)height/3 + (float)height/60);
  line(0,11 * (float)height/18 + (float)height/60,(float)width/32,2 * (float)height/3 + (float)height/60);
  line((float)width/32,(float)height/3 + (float)height/60,0,7 * (float)height/18 + (float)height/60);
  line((float)width/16,(float)height/3 + (float)height/60,0,4 * (float)height/9 + (float)height/60);
  line((float)width/16,7 * (float)height/18 + (float)height/60,0,(float)height/2 + (float)height/60);
  line((float)width/16,4 * (float)height/9 + (float)height/60,0,5 * (float)height/9 + (float)height/60);
  line((float)width/16,(float)height/2 + (float)height/60,0,11 * (float)height/18 + (float)height/60);
  line((float)width/16,5 * (float)height/9 + (float)height/60,0,2 * (float)height/3 + (float)height/60);
  line((float)width/16,11 * (float)height/18 + (float)height/60,(float)width/32,2 * (float)height/3 + (float)height/60);
  line(31 * (float)width/32,(float)height/3 + (float)height/60,15 * (float)width/16,7 * (float)height/18 + (float)height/60);
  line(31 * (float)width/32,(float)height/3 + (float)height/60,(float)width,7 * (float)height/18 + (float)height/60);
  line(15 * (float)width/16,(float)height/3 + (float)height/60,(float)width,4 * (float)height/9 + (float)height/60);
  line(15 * (float)width/16,7 * (float)height/18 + (float)height/60,(float)width,(float)height/2 + (float)height/60);
  line(15 * (float)width/16,4 * (float)height/9 + (float)height/60,(float)width,5 * (float)height/9 + (float)height/60);
  line(15 * (float)width/16,(float)height/2 + (float)height/60,(float)width,11 * (float)height/18 + (float)height/60);
  line(15 * (float)width/16,5 * (float)height/9 + (float)height/60,(float)width,2 * (float)height/3 + (float)height/60);
  line(15 * (float)width/16,5 * (float)height/9 + (float)height/60,15 * (float)width/16,2 * (float)height/3 + (float)height/60);
  line(15 * (float)width/16,11 * (float)height/18 + (float)height/60,31 * (float)width/32,2 * (float)height/3 + (float)height/60);
  line(31 * (float)width/32,2 * (float)height/3 + (float)height/60,(float)width,11 * (float)height/18 + (float)height/60);
  line((float)width,(float)height/3 + (float)height/60,15 * (float)width/16,4 * (float)height/9 + (float)height/60);
  line((float)width,7 * (float)height/18 + (float)height/60,15 * (float)width/16,(float)height/2 + (float)height/60);
  line((float)width,4 * (float)height/9 + (float)height/60,15 * (float)width/16,5 * (float)height/9 + (float)height/60);
  line((float)width,(float)height/2 + (float)height/60,15 * (float)width/16,11 * (float)height/18 + (float)height/60);
  line((float)width,5 * (float)height/9 + (float)height/60,15 * (float)width/16,2 * (float)height/3 + (float)height/60);
  
  strokeWeight(1);
  stroke(1);
}

void reset() {
  p1 = new Car((float)width/5 , 6 * (float)width/16,1, color(0, 0, 255));
  p2 = new Car(4 * (float)width/5,6 * (float)width/16,-1, color (255, 140, 0));
  b1 = new Ball((float)height/18);
}

void move() {
  if (p1.y < 2 * (float)height/3) p1.inAir = true;
  if (p2.y < 2 * (float)height/3) p2.inAir = true;
  if ((p1.x < (float)width/16 + (float)width/200 || p1.x > 15 * (float)width/16 - (float)width/200) && p1.dy >= 0 && p1.y >= (float)height/3 - (float)height/150 - p1.size * Math.sqrt(5) / 4 && p1.y <= 16 * (float)height/45 - (float)height/150 ) {
    p1.dy = 0;
    p1.y = (float)height/3 - (float)height/150 - p1.size * (float)Math.sqrt(5) / 4;
    p1.inAir = false;
  }
  if ((p2.x < (float)width/16 + (float)width/200 || p2.x > 15 * (float)width/16 - (float)width/200) && p2.dy >= 0 && p2.y >= (float)height/3 - (float)height/150 - p2.size * Math.sqrt(5) / 4 && p2.y <= 16 * (float)height/45 - (float)height/150 ) {
    p2.dy = 0;
    p2.y = (float)height/3 - (float)height/150 - p2.size * (float)Math.sqrt(5) / 4;
    p2.inAir = false;
  }
  if (p1.inAir) {
    if (p1.left && !p1.right) p1.angle -= 3;
    if (p1.right && !p1.left) p1.angle += 3;
    p1.dy += (float)height/900;
  }
  else {
    if (p1.dx >= -(float)width/300 && p1.left) {
      p1.drive(-(float)width/10000);
      if (!p1.right) p1.lastDirection = -1;
    }
    if (p1.dx <= (float)width/300 && p1.right) {
      p1.drive((float)width/10000);
      if (!p1.left) p1.lastDirection = 1;
    }
    p1.angle = 0;
  }
  if (p2.inAir) {
    if (p2.left && !p2.right) p2.angle -= 3;
    if (p2.right && !p2.left) p2.angle += 3;
    p2.dy += (float)height/900;
  }
  else {
    if (p2.dx >= -(float)width/300 && p2.left) {
      p2.drive(-(float)width/10000);
      if (!p2.right) p2.lastDirection = -1;
    }
    if (p2.dx <= (float)width/300 && p2.right) {
      p2.drive((float)width/10000);
      if (!p2.left) p2.lastDirection = 1;
    }
    p2.angle = 0;
  }
  if (p1.y <= 0) {
    p1.y = p1.size/2;
    p1.dy = p1.dy*-1;
  }
  if (b1.y <= b1.radius) {
    b1.y = b1.radius;
    b1.dy = b1.dy*-1;
  }
  if (p2.y <= 0) {
    p2.y = p2.size/2;
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
  if (b1.x < (float)width/16 + (float)width/200 + b1.radius || b1.x > 15 * (float)width/16 - (float)width/200 - b1.radius) {
    if (Math.abs(b1.y - 9 * (float)height/25) <= b1.radius) {
      if (b1.y < 9 * (float)height/25) {
        b1.y = 9 * (float)height/25 - b1.radius;
        if (Math.abs(b1.dy) > (float)height/300) {
          b1.dy = -Math.abs(b1.dy / 1.5);
          b1.dx /= 1.1;
        }
        else {
          b1.dy = 0;
          b1.inAir = false;
        }
      }
      else {
        b1.y = 9 * (float)height/25 + b1.radius;
        b1.dy *= -1;
      }
    }
  }
  if (b1.y < 2 * (float)height/3 - b1.radius + p1.size/2) {
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
  if (p1.x < p1.size/2 || p1.x > (float)width - p1.size/2) {
    if (p1.x < p1.size/2) p1.x = p1.size/2;
    else p1.x = (float)width - p1.size/2;
    p1.dx *= -1;
  }
  if (p2.x < p2.size/2 || p2.x > (float)width - p2.size/2) {
    if (p2.x < p2.size/2) p2.x = p2.size/2;
    else p2.x = (float)width-p2.size/2;
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
      p1.dy -= (float)height/180 * Math.abs(p2.dx * 1600/(float)width);
      p2.dy -= (float)height/180 * Math.abs(p1.dx * 1600/(float)width);
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
        if (p1.x < b1.x) {
          b1.dx = Math.abs(p1.dx * 2 - cos(currentBallAngle) * velocityCar);
          b1.dy = -(Math.abs(p1.dx) * (float)width/480) - sin(currentBallAngle) * velocityCar;
        }
        else {
          b1.dx = -Math.abs(p1.dx * 2 - cos(currentBallAngle) * velocityCar);
          b1.dy = -(Math.abs(p1.dx) * (float)width/480) - sin(currentBallAngle) * velocityCar;
        }
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
    if (b1.x < p1.x) {
      if (b1.y > p1.y) b1.x = p1.x - p1.size/2 - b1.radius;
      else b1.dx -= 1;
    }
    else {
      if (b1.y > p1.y) b1.x = p1.x + p1.size/2 + b1.radius;
      else b1.dx += 1;
    }
  }
  if (Math.pow(b1.x-p2.x, 2) + Math.pow(b1.y-p2.y, 2) <= Math.pow(b1.radius + p2.size/2, 2)) {
    if (b1.inAir) {
      float currentBallAngle = atan2(b1.dy, b1.dx);
      float currentCarAngle  = atan2(p2.dy, p2.dx);
      float velocityBall = sqrt((b1.dx * b1.dx) + (b1.dy * b1.dy));
      float velocityCar  = sqrt((p2.dx * p2.dx) + (p2.dy * p2.dy));
      if (b1.dx > 0 && p2.dx > 0 || b1.dx < 0 && p2.dx < 0) {
        if (p2.x < b1.x) {
          b1.dx = Math.abs(p2.dx * 2 - cos(currentBallAngle) * velocityCar);
          b1.dy = -(Math.abs(p2.dx) * (float)width/480) - sin(currentBallAngle) * velocityCar;
        }
        else {
          b1.dx = -Math.abs(p2.dx * 2 - cos(currentBallAngle) * velocityCar);
          b1.dy = -(Math.abs(p2.dx) * (float)width/480) - sin(currentBallAngle) * velocityCar;
        }
      }
      else {
        b1.dx = p2.dx * 2 - cos(currentBallAngle - currentCarAngle) * velocityCar;
        b1.dy = -(Math.abs(p2.dx) * (float)width/480) - sin(currentBallAngle - currentCarAngle) * velocityCar;
        p2.dx += cos(currentBallAngle) * velocityBall/10;
      }
    }
    else {
      float tempDx = b1.dx;
      b1.dx = p2.dx * 2;
      b1.dy = -(Math.abs(p2.dx) * (float)width/480);
      p2.dx = tempDx/10;
    }
    if (b1.x < p2.x) {
      if (b1.y > p2.y) b1.x = p2.x - p2.size/2 - b1.radius;
      else b1.dx -= 1;
    }
    else {
      if (b1.y > p2.y) b1.x = p2.x + p2.size/2 + b1.radius;
      else b1.dx += 1;
    }

  }

  if (b1.x < b1.radius || b1.x > (float)width - b1.radius) {
    if (b1.x < b1.radius) b1.x = b1.radius;
    else b1.x = (float)width-b1.radius;
    b1.dx *= -1;
  }
  if (p1.boosting && Math.abs(p1.dx) < (float)width/200) p1.boost();
  if (p2.boosting && Math.abs(p2.dx) < (float)width/200) p2.boost();
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
