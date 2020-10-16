class PongPaddle{
  int x,y;  //x,y of paddle
  float coolDown;
  PongPaddle(int xPos, int yPos){
    x = xPos;
    y = yPos;
    coolDown =2;
  }
  
  void draw(){  //Create Paddle
    rectMode(CENTER);
    rect(x,y,20,150);
  }
  
  void bouce_ball(PongBall ball){
      ball.speedX *= -1.02;
      ball.speedY *= 1.02;
      coolDown =0;
    
  }
}

class PongBall{
  int x ;  //x-position of ping-pong ball
  int y ; //y-position of ping-pong ball
  float speedX;  //Speed ball in dimention x 
  float speedY;  //Speed ball in dimention y
  
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
  int scoreP1,scoreP2;
  PongBall b1;
  PongPaddle p2;
  
  PongGame(){
    scoreP1 = 0;
    scoreP2 = 0;
    b1 = new PongBall();
    p2 = new PongPaddle(width-10,height/2);
  }
  
  void draw(){  //Draw game pong
    
    b1.draw();  //Draw ball
    
    //Draw paddle
    p2.draw();
    
  }
  
  void movePaddle(){
      p2.y = mouseY;
  }
  
  void serveBall(int direction){
    b1.x = width/2;
    b1.y = height/2;
    b1.speedX = 5*direction;
    b1.speedY = 2;
  }
  
  void startGame(){  //Run ping-pong game
      b1.move();
    //bouce of paddle
   if(b1.x+25>p2.x-10&& b1.y > p2.y-75 && b1.y< p2.y+75&&p2.coolDown>2){
       p2.bouce_ball(b1);
     }
     p2.coolDown ++;
    
    //boucing ball when touch top screen
     if(b1.y<0 || b1.y > height){
        b1.speedY *= -1;
      }
      if(b1.x-25<0){
        b1.speedX *= -1;
      }
    
    //Check score point
      if(b1.x<-50){
        scoreP2 += 1;
        serveBall(1);
      }else if(b1.x>width+50){
        scoreP1 += 1;
        serveBall(1);
      }
  }
}


PongGame engine;

void setup(){
  background(0);
  size(600,600);
  engine = new PongGame();
}
void draw(){
  background(0);
  engine.draw();
  engine.startGame();
  engine.movePaddle();

}
