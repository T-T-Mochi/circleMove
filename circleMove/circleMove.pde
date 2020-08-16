// 力  
PVector force;  
// 加速度  
PVector acceleration;  
// 位置  
PVector location;  
// 速度  
PVector velocity;  
// 質量  
float mass;  

float rad = (TWO_PI/30.0)/3;
float r = 100;
float theta = 0;    //角度

boolean rightMove = false;
boolean leftMove = false;

int vector = 0;
int leftNum = 0;

void setup() {  
  size(800, 600);  
  frameRate(30);  

  // 位置、速度を初期化  
  location = new PVector(0.0, 0.0);  
  velocity = new PVector(0.0, 0.0);  

  // (3.0, 2.0)の力を加える  
  force = new PVector(3.0, 2.0);  

  // 質量は1.0に設定  
  mass = 1.0;  

  // 質量と力から加速度を算出  
  // 加速度 = 力 × 質量   
  acceleration = force.mult(mass);
}  

void draw() {  
  // 背景をフェード  
  //background(0);
  //translate(width/2, height/2);
  fill(0, 31);  
  rect(0, 0, width, height);  

  fill(255);  
  noStroke();  
  // 加速度から速度を算出  
  velocity.add(acceleration);  
  // 速度から位置を算出  
  location.add(velocity);  

  // 加速度を0にリセット  
  // ※ 等速直線運動のため、加速度は最初の1フレームのみの加算で、  
  // その後は0にリセット  
  acceleration.set(0, 0);  

  // 円を描く  
  circle(width/2+r*sin(theta), height/2+r*cos(theta), 40);  

  println(theta);
  //if (abs(theta) > 2*PI) {
  //    theta = 0;
  //    vector = 0;
  //  }
  if (rightMove) {
    if (theta <= vector*PI/2) {
      theta = theta + rad;
    }
  } else if (leftMove) {
    if (theta >= vector*PI/2) {
      theta = theta - rad;
    }
  }
}

void keyPressed() {
  if (key == CODED) {      // コード化されているキーが押された
    if (keyCode == RIGHT) {    // キーコードを判定
      rightMove = true;
      vector++;
    } else if (keyCode == LEFT) {
      leftMove = true;
      vector--;
    }
  }
}
