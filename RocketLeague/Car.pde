public class Car {
  
  float x, y, dx, dy;
  float size;
  boolean inAir;
  float angle; 
  color c;
  boolean left, right, boosting;
  
  Car(float x, float y, int angle, color c) {
    this.x = x;
    this.y = y;
    this.angle = angle;
    inAir = false;
    dx = 0;
    dy = 0;
    size = width/32;
    this.c = c;
    left = false;
    right = false;
  }
  
  void boost() {
    dx += (float)width/8000 * cos(angle);
    dy += (float)width/8000 * sin(angle);
  }
  
  void drive(float acceleration) {
    dx += acceleration;
  }
  
  void jump() {
    dy -= height/45;
    inAir = true;
  }
  
  void display() {
    x += dx;
    y += dy;
    ellipseMode(CENTER);
    if (boosting) {
      fill(c);
      for (int i = 2; i <= 8; i++) {
        ellipse(x - (cos(angle) * size/4 * i), y + size/8, size/8, size/8);
        ellipse(x - (cos(angle) * size/4 * i), y - size/8, size/8, size/8);
      }
    }
    fill(127);
    ellipse(x - size/4, y + size/2, size/5, size/5);
    ellipse(x + size/4, y + size/2, size/5, size/5);
    fill(c);
    quad(x - size/2, y + size/4, x - size/4, y - size/4, x + size/4, y - size/4, x + size/2, y + size/4);
  }
  
}
