public class Ball {
  
  float x, y, dx, dy;
  float radius;

  Ball(float radius) {
    this.radius = radius;
    x = width/2;
    y = height/2;
    dx = 0;
    dy = 0;
  }
  
  boolean inGoal() {
    return (x < width / 16 || x > width * 15 / 16);
  }
  
  void display() {
    x += dx;
    y += dy;
    fill(127);
    ellipse(x, y, radius * 2, radius * 2);
  }
  
}
