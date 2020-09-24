class PongPaddle{
  int x,y;  //x,y of paddle
  PongPaddle(int xPos, int yPos){
    x = xPos;
    y = yPos;
  }
  
  void draw(){  //Create Paddle
    rectMode(CENTER);
    rect(x,y,20,150);
  }
  
  void bouce_ball(PongBall ball){
    if((ball.x-35 == x || ball.x+35 == x)&& ball.y > y-75 && ball.y< y+75){
      ball.speedX *= -1;

    }
  }
}

class PongBall{
  int x ;  //x-position of ping-pong ball
  int y ; //y-position of ping-pong ball
  int speedX;  //Speed ball in dimention x 
  int speedY;  //Speed ball in dimention y
  
  PongBall(){
    x = width/2;
    y = height/2;
    speedX = 5;
    speedY = 2;
    
  }
  void draw(){  // drawing ball
  ellipseMode(CENTER);
  ellipse(x,y,50,50);
  
  }
  
  void move(){ //Move ping-pong ball
    x += speedX;
    y += speedY;
  }
}

class PongGame{
  int scoreP1 = 0;
  int scoreP2 = 0;
  PongBall b1 = new PongBall();
  PongPaddle p1 = new PongPaddle(10,300);
  PongPaddle p2 = new PongPaddle(590,300);
  
  void draw(){  //Draw game pong
    rect(width/2,height/2,10,height);  //Net
    
    b1.draw();  //Draw ball
    
    p1.draw();  //Draw paddle
    p2.draw();
    
    textSize(50);        
    textAlign(CENTER);
    text(str(scoreP1),width/4,height/10);   //Score Player 1
    text(str(scoreP2),width*3/4,height/10);  //Score Player 2
  }
  
  void movePaddle(){
    if(mouseX < width/3){
      p1.y = mouseY;
    }else if(mouseX > width - width/3){
      p2.y = mouseY;
    }
  }
  
  void serveBall(int direction){
    b1.x = width/2;
    b1.speedX *= direction;
  }
  
  void startGame(){  //Run ping-pong game
      b1.move();
    
    //bouce of paddle
     p1.bouce_ball(b1);
     p2.bouce_ball(b1);
    
    //boucing ball when touch top screen
     if(b1.y<0 || b1.y > height){
        b1.speedY *= -1;
      }
    
    //Check score point
      if(b1.x<0){
        scoreP2 += 1;
        serveBall(-1);
      }else if(b1.x>width){
        scoreP1 += 1;
        serveBall(-1);
      }
  }
}


PongGame engine = new PongGame();

void setup(){
  background(0);
  size(600,600);
}
void draw(){
  background(0);
  engine.draw();
  engine.startGame();
}
void mouseDragged(){
  engine.movePaddle();
}
