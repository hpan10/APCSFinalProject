public class Car {
  
  float x, y, dx, dy;
  float size;
  boolean inAir;
  float angle; 
  
  Car(float x, float y, int angle) {
    this.x = x;
    this.y = y;
    this.angle = angle;
    inAir = false;
    dx = 0;
    dy = 0;
    size = 20;
  }
  
  void boost() {
    
  }
  
  void drive(int acceleration) {
    dx += acceleration;
  }
  
  void jump() {
    dy += 50;
  }
  
  void display() {
    x += dx;
    y += dy;
    ellipseMode(CENTER);
    ellipse(x - size/4, y + size/2, size/5, size/5);
    ellipse(x + size/4, y + size/2, size/5, size/5);
    quad(x - size/2, y + size/4, x - size/4, y - size/4, x + size/4, y - size/4, x + size/2, y + size/4);
  }
  
}
