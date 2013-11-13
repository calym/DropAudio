

    String[] files = {"sound/a3.wav","sound/d3.wav","sound/c3.wav","sound/f3.wav","sound/g3.wav","sound/f4.wav","sound/f2.wav","sound/d4.wav","sound/d2.wav","sound/c5.wav","sound/c4.wav","sound/c2.wav"};

    int state = 0;
    int numBalls = 1;
    float spring = 0.1;
    float gravity = 0.3;
    float friction = -0.2;
    ArrayList balls;

    void setup() {
      width = 650;
      height = 350;
      state = 0;
      numBalls = 1;
      spring = 0.1;
      gravity = 0.3;
      friction = -0.2;
      size(width, height);
      background(255);
      noStroke();
      smooth();
      balls = new ArrayList();
      for (int i = 0; i < numBalls; i++) {
        balls.add(new Ball(random(width), random(height), random(20, 150), i, balls));
      }
    }

    void draw() {
      switch(state) {
        case 0:
        background(255);
        for (int i = balls.size() - 1; i>= 0; i--) {
          Ball ball = (Ball) balls.get(i);
          ball.move();
          ball.display();
        }
        break;

        case 1:
        background(255);
        for (int i = balls.size() - 1; i>= 0; i--) {
          Ball ball = (Ball) balls.get(i);
          ball.collide();
          ball.move();
          ball.display();
        }
        break;
      }
    }
  

    class Ball {
      function f;
      color c;
      float x, y;
      float diameter;
      float vx = 0;
      float vy = 0;
      int id;
      ArrayList others;

 
      Ball(float xin, float yin, float din, int idin, ArrayList oin) {
        f = new Audio(files[int(random(files.length))]);
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


      //This code triggers the audio when the balls hit the bottom.
      
      if (((y+diameter/2) > (height-1)) && ((y+diameter/2) < height)) {
        f.play();
        //println("bounce" + f);
        }

      //This code triggers the audio when the balls hit the top

      if ((y-diameter/2 > 0) && ((y-diameter/2) < 5)) {
        f.play();
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

  void changeGravity(g) {
    gravity = g;  
  }  

  void collisionOn() {
    state = 1;
  }

  void collisionOff() {
    state = 0;
  }

  void changeFriction(fr) {
    friction = fr;
  }

  void changeSpring(spr) {
    spring = spr;
  }

  
