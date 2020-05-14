
float SPEED = 5; // 移動量
float R = 5; //半径
float dt = 1;
Ball a_ball;
Wave[] wave = new Wave[11];
int numOfWave = 1;
float obsX = width/2.0;
float obsY = height;

void setup() {
  size(1000, 500);
  frameRate(20);
  background(255);
  noFill();
  stroke(0);
//  ellipseMode(Center);
  
  a_ball = new Ball(0, height / 5, SPEED,0);

  for( int i = 0; i < 11; i++){
    wave[i] = new Wave( i * width/10.0, a_ball.y, 0);
  }

}

void draw() {
  
  if(mousePressed == false) {
  //  fadeToBlack();
    background(255);

    if(a_ball.x - R < width)
      numOfWave = (int)(a_ball.x / (width/10.0)) + 1;
    System.out.println(numOfWave);
    for(int i = 0; i < numOfWave; i++){
      wave[i].draw();
      wave[i].spread();

    }

    a_ball.draw();
    a_ball.move();

  }
}

class Ball
{
  float x, y; //ボールの現在位置（中心）
  float vx, vy; //ボールの移動量

  //コンストラクタ
  Ball(
  float _x, float _y, float _vx, float _vy) {
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
  }

  void move() {

    x = x + vx; 
    if (x - R <= 0) {
      x = R;
      vx *= -1;
    }
    //if (x + R >= width) {
    //  x = width - R;
    //  vx *= -1;
    //}

    y = y + vy;
    if (y - R <= 0) {
      y = R;
      vy *= -1;
    }
    if (y + R >= height) {
      y = height - R;
      vy *= -1;    }
  }
  
  void draw() {
    stroke(0);
    ellipse(x, y, R * 2, R * 2);
  }
}

class Wave {
 float radPointX;
 float radPointY;
 float radius;
 
 Wave(float x, float y, float radius){
   this.radPointX = x;
   this.radPointY = y;
   this.radius = radius;
 }

 Wave(){
   this(a_ball.x, a_ball.y, 0.0); 
 }
 
 void spread(){
   this.radius += 0.1 * a_ball.vx * dt;
 }

 void draw(){
   stroke(0);
   ellipse(radPointX, radPointY, 2 * radius, 2 * radius);
 }
  
}

//フェードアウト
void fadeToBlack() {
  noStroke();
  fill(0, 10);
  rectMode(CORNER);
  rect(0, 0, width, height);
}
