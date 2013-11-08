//stuff to add: turn on collisions
    //variable gravity and friction?
    //clear button
    //auto mode (like the existing version)
    //auto mode plus clicky mode?

    file1 = "sound/d3.wav";
    file2 = "sound/a3.wav";
    file3 = "sound/g3.wav";
    file4 = "sound/f3.wav";
    file5 = "sound/c3.wav";

    Audio audio1 = new Audio();
    Audio audio2 = new Audio();
    Audio audio3 = new Audio();
    Audio audio4 = new Audio();
    Audio audio5 = new Audio();
    
    // String[] audioObjects = new String[3];
    // audioObjects[0] = "audio1";
    // audioObjects[1] = "audio2";
    // audioObjects[2] = "audio3";


    int numBalls = 1;
    float spring = 0.1;
    float gravity = 0.3;
    float friction = -0.2;
    ArrayList balls;
    
    
    String processingString = "Hello from Processing!";





    void setup() {
        printMessage(jsString + " " + processingString);
      size(600, 600);
      noStroke();
      smooth();
      audio1.setAttribute("src", file1);
      audio2.setAttribute("src", file2);
      audio3.setAttribute("src", file3);
      audio3.setAttribute("src", file4);
      audio3.setAttribute("src", file5);
      balls = new ArrayList();
      for (int i = 0; i < numBalls; i++) {
        balls.add(new Ball(random(width), random(height), random(20, 150), i, balls));
      }
    }

    void draw() 
    {
      background(255);
      for (int i = balls.size() - 1; i>= 0; i--) {
        Ball ball = (Ball) balls.get(i);
        ball.collide();
        ball.move();
        ball.display(); 
      }
    }

    class Ball {
      color c;
      float x, y;
      float diameter;
      float vx = 0;
      float vy = 0;
      int id;
      ArrayList others;
  
 
      Ball(float xin, float yin, float din, int idin, ArrayList oin) {
        c = color(random(255),random(255),random(255),random(50,175));
        x = xin;
        y = yin;
        diameter = din;
        id = idin;
        others = oin;
        
      } 
  
  void collide() {
    for (int i = id + 1; i < balls.size() ; i++) {
      float dx = ((Ball) others.get(i)).x - x;
      float dy = ((Ball) others.get(i)).y - y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = ((Ball) others.get(i)).diameter*0.5 + diameter*0.5; 
      if (distance <= minDist) { 
        float angle = atan2(dy, dx);
        float targetX = x + cos(angle) * minDist;
        float targetY = y + sin(angle) * minDist;
        float ax = (targetX - ((Ball) others.get(i)).x) * spring;
        float ay = (targetY - ((Ball) others.get(i)).y) * spring;
        vx -= ax;
        vy -= ay;
        ((Ball) others.get(i)).vx += ax;
        ((Ball) others.get(i)).vy += ay;
        }
      }   
    }
      
    void move() {
      vy += gravity;
      x += vx;
      y += vy;
      if (x + diameter/2 > width) {
        x = width - diameter/2;
        vx *= friction; 
      }
      else if (x - diameter/2 < 0) {
        x = diameter/2;
        vx *= friction;
      }
      if (y + diameter/2 > height) {
        y = height - diameter/2;
        vy *= friction; 
      } 
      else if (y - diameter/2 < 0) {
        y = diameter/2;
        vy *= friction;
      }
      if (((y+diameter/2) > (height-1)) && ((y+diameter/2) < height)) {
        //println(y+diameter/2);
        
        sound = int(random(4));

        println(sound);
      if (sound == 1) {  
        audio2.play();
        } else if (sound == 0) {
        audio1.play();
        } else if (sound == 2) {
          audio5.play();
        } else if (sound == 3) {
          audio3.play();
        } else if (sound == 4) {
          audio4.play();
        }
        
      }
        
      
    }
  
  void display() {
    fill(c);
    ellipse(x, y, diameter, diameter);
  }
}

  void mousePressed() {
     balls.add(new Ball(mouseX, mouseY, random(20, 100), numBalls, balls)); 
    }