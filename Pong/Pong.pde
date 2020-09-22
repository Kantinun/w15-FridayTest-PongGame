class PongPaddle{
  int x,y;  //x,y of paddle
  PongPaddle(int xPos, int yPos){
    x = xPos;
    y = yPos;
  }
  
  void draw(){  //Create Paddle
    ellipse(x,y,10,100);
  }
  
  void move(char direction){  //Move Paddle up or down
  }
}

class PongBall{
  int x = width/2;  //x-position of ping-pong ball
  int y = height/2; //y-position of ping-pong ball
  int speed = 1;
  int direction;  // 1 represent ball go right or -1 represent ball go left
  
  void draw(){  // drawing ball
  }
  
  void move(){ //Move ping-pong ball
  }
  
  void bouceBall(){  //Bouncing ball 
  }
}

class PongGame{
  void draw(){  //Draw table and scoreboard
  }
  
  void startGame(){  //Run ping-pong game
  }
}
PongPaddle p1;
void setup(){
  size(600,600);
  p1 = new PongPaddle(10,height/2);
}
void draw(){
  p1.draw();
}
