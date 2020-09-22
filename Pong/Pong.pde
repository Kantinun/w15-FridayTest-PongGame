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
  int speed = 1;
  int direction;  // 1 represent ball go right or -1 represent ball go left
  
  void draw(){  // drawing ball
  ellipseMode(CENTER);
  ellipse(x,y,50,50);
  }
  
  void move(){ //Move ping-pong ball
  }
  
  void bouceBall(){  //Bouncing ball 
  }
}

class PongGame{
  void draw(){  //Draw table and scoreboard
    rect(width/2,height/2,10,height);
  }
  
  void startGame(){  //Run ping-pong game
  }
}

PongPaddle p1;
PongPaddle p2;
PongBall b1 = new PongBall();
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
  p1.draw();
  p2.draw();
  b1.draw();
}
void mouseDragged(){
  if(mouseX>p1.x-5 && mouseX < p1.x+20 && mouseY> p1.y-100 && mouseY< p1.y+100){
    p1.move(mouseY);
    println("hi");
  }else if(mouseX>p2.x-5 && mouseX < p2.x+5 && mouseY> p2.y-75 && mouseY< p2.y+75){
    p2.move(mouseY);
  }
}
