class PongPaddle{
  int x,y;
  PongPaddle(int xPos, int yPos){
    x = xPos;
    y = yPos;
  }
  void draw(){  //Create Paddleove 
  }
  void move(char direction){  //Move Paddle up or down
  }
}

class PongBall{
  int x = width/2;  //x-position of ping-pong ball
  int y = height/2; //y-position of ping-pong ball
  int speed = 1;
  void draw(){
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
