public class ScoreboardAndTimer {
  
  int p1Goals, p2Goals;
  int time; //seconds
  
   ScoreboardAndTimer() {
    time = 300;
    p1Goals = 0;
    p2Goals = 0;
    textSize(height/15);
    textAlign(CENTER);
  }
  
  void display() {
    int minutes = time / 60;
    int seconds = time % 60;
    fill(0);
    rectMode(CORNERS);
    rect(width/2 - width/17, 5, width/2 + width/17, 5 + height/13);
    fill(0, 0, 255);
    rect(width/2 - width/10, 5, width/2 - width/17, 5 + height/13, 10, 0, 0, 10);
    fill(255, 140, 0);
    rect(width/2 + width/17, 5, width/2 + width/10, 5 + height/13, 0, 10, 10, 0);
    fill(255);
    if (seconds < 10) text("" + minutes + ":0" + seconds, width/2, height/15);
    else text("" + minutes + ":" + seconds, width/2, height/15);
  }
  
}
