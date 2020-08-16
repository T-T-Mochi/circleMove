/*
 *　円を円回転させるプログラム
 */

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
}  

void draw() {  
  // 背景をフェード  
  //background(0);
  //translate(width/2, height/2);
  fill(0, 31);  
  rect(0, 0, width, height);  

  fill(255);  
  noStroke();  

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
      leftMove = false;
      vector++;
    } else if (keyCode == LEFT) {
      leftMove = true;
      rightMove = false;
      vector--;
    }
  }
}
