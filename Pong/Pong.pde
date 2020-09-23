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
  
  void move(int yPos){//Move Paddle up or down
    y = yPos;
    
  }
}

class PongBall{
  int x = 300;  //x-position of ping-pong ball
  int y = 300; //y-position of ping-pong ball
  int speedX = 5;
  int speedY = 2;
  
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
  
  void draw(){  //Draw game pong
    b1.draw();
  
    rect(width/2,height/2,10,height);  //Net
    
    textSize(50);        
    textAlign(CENTER);
    text(str(scoreP1),width/4,height/10);   //Score Player 1
    text(str(scoreP2),width*3/4,height/10);  //Score Player 2
  }
  
  void startGame(){  //Run ping-pong game
      b1.move();
    
    //boucing ball when touch top screen
    if(b1.y<0 || b1.y > height){
      b1.speedY *= -1;
    }
    
    //boucing ball when touch left or right screen
    if(b1.x<0 || b1.x > width){
      b1.speedX *= -1;
    }
  }
}

PongPaddle p1;
PongPaddle p2;
PongGame engine = new PongGame();

void setup(){
  background(0);
  size(600,600);
  p1 = new PongPaddle(10,height/2);
  p2 = new PongPaddle(width-10,height/2);
}
void draw(){
  background(0);
  engine.draw();
  engine.startGame();
  p1.draw();
  p2.draw();
}
void mouseDragged(){
  if(mouseX>p1.x-5 && mouseX < p1.x+20 && mouseY> p1.y-100 && mouseY< p1.y+100){
    p1.move(mouseY);
    println("hi");
  }else if(mouseX>p2.x-5 && mouseX < p2.x+5 && mouseY> p2.y-75 && mouseY< p2.y+75){
    p2.move(mouseY);
  }
}
