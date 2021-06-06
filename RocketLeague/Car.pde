public class Car {
  
  float x, y, dx, dy;
  float size;
  boolean inAir;
  int lastDirection;
  int angle;
  color c;
  boolean left, right, boosting;
  
  Car(float x, float y, int direction, color c) {
    this.x = x;
    this.y = y;
    angle = 0;
    lastDirection = direction;
    inAir = false;
    dx = 0;
    dy = 0;
    size = width/32;
    this.c = c;
    left = false;
    right = false;
  }
  
  void boost() {
    dx += (float)width/8000 * lastDirection * cos(radians(angle));
    dy += (float)width/1000 * lastDirection * sin(radians(angle));
  }
  
  void drive(float acceleration) {
    dx += acceleration;
  }
  
  void jump() {
    dy -= (float)height/45;
    inAir = true;
  }
  
  void display() {
    x += dx;
    y += dy;
    ellipseMode(CENTER);
    if (boosting) {
      noStroke();
      float opacity = 255;
      for (int i = 2; i <= 16; i++) {
        fill(c, opacity);
        ellipse(x - (cos(radians(angle)) * size/8 * i) * lastDirection, y + size/16 - (sin(radians(angle)) * size/16 * i), size/8, size/8);
        ellipse(x - (cos(radians(angle)) * size/8 * i) * lastDirection, y - size/16 - (sin(radians(angle)) * size/16 * i), size/8, size/8);
        opacity /= 1.2;
      }
      stroke(0);
    }
    fill(127);
    ellipse(x - size/4, y + size/2, size/5, size/5);
    ellipse(x + size/4, y + size/2, size/5, size/5);
    fill(c);
    quad(x - sin(radians(90 - angle) + atan(.5)) * size * (float)Math.sqrt(5) / 4, 
         y + cos(radians(90 - angle) + atan(.5)) * size * (float)Math.sqrt(5) / 4, 
         x - size/4, 
         y - size/4, 
         x + size/4, 
         y - size/4, 
         x + size/2, 
         y + size/4);
    //quad(x - size/2, y + size/4, x - size/4, y - size/4, x + size/4, y - size/4, x + size/2, y + size/4);
  }
  
}
