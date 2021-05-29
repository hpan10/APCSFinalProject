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
    if (seconds == 0) text("" + minutes + ":00", width/2, height/15);
    else text("" + minutes + ":" + seconds, width/2, height/15);
  }
  
}
