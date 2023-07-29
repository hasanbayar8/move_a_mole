int time, score, moleLocation, moleX, moleY, WinPanel;
import processing.sound.*;
boolean gameOver;
boolean winPanel;

PImage bg;    
PImage base;

PImage character1;
PImage character2;
PImage character3;
PImage character4;
PImage character5;
PImage character6;
PImage character7;
PImage character8;
PImage character9;
//
PImage character1caught;
PImage character2caught;
PImage character3caught;
PImage character4caught;
PImage character5caught;
PImage character6caught;
PImage character7caught;
PImage character8caught;
PImage character9caught;

//

PImage skull1;
PImage skull2;
PImage skull3;
 
Drops d[];

SoundFile file;
String audioName = "sample.mp3";
String path;



//////// error sound 
SoundFile ErrorFile;
String ErrorSound = "Errormusic.mp3";
String ErrorPath;

/////false clicking sound
SoundFile ErrorTick;
String ErrorTikSound = "laughing.mp3";
String ErrorTikPath;


/////catch sound
SoundFile GoodFilee;
String GoodSoundd = "goodd.mp3";
String GoodPathh;


///// GameWin Ses
SoundFile WinFilee;
String WinSoundd = "win.mp3";
String WinPathh;


////// Low Time 
SoundFile LowFilee;
String LowSoundd = "lowtime.mp3";
String LowPathh;

void setup()
{
    path = sketchPath(audioName);
    file = new SoundFile(this, path);
    file.play();

  
  d=new Drops[500];
  for(int i=0;i<500;i++){  
  d[i]=new Drops();
  }
  
  size(900, 900);
  time = 30;
  score = 0;
  ellipseMode(CORNER); 
  bg = loadImage ("background.jpg");
  base = loadImage ("soil.png");
  
  //Main character
  character1 = loadImage ("fear1.png");
  character2 = loadImage ("fear2.png");
  character3 = loadImage ("fear3.png");
  character4 = loadImage ("fear4.png");
  character5 = loadImage ("fear5.png");
  character6 = loadImage ("fear6.png");
  character7 = loadImage ("fear7.png");
  character8 = loadImage ("fear8.png");
  character9 = loadImage ("fear9.png");
  
  //caught characters 
  character1caught = loadImage ("character1caught.png");
  character2caught = loadImage ("character2caught.png");
  character3caught = loadImage ("character3caught.png");
  character4caught = loadImage ("character4caught.png");
  character5caught = loadImage ("character5caught.png");
  character6caught = loadImage ("character6caught.png");
  character7caught = loadImage ("character7caught.png");
  character8caught = loadImage ("character8caught.png");
  character9caught = loadImage ("character9caught.png");
  
  //map extra 
  skull1 = loadImage ("skull1.png");
  skull2 = loadImage ("skull2.png");
  skull3 = loadImage ("skull3.png");
  
  moleLocation=(int)random(1, 10);
  
}
void draw(){
  background(255);
  image(bg, 0, 0 );
  fill(0,50);
  rect(0,0,width,height);
  for(int i=0;i<500;i++){ 
      if(d[i].y>d[i].endPos){
         d[i].endPos();
 }
 else
  d[i].display();
}

  holes();
  mole();
  time();
  score();
  gameOver();
  winPanel();
}



void holes() {
  ellipseMode(CORNER); 
 
  image(base, 175, 185, 185, 230);
  image(base, 375, 185, 185, 230);
  image(base, 575, 185, 185, 230);
  image(base, 175, 385, 185, 230);
  image(base, 375, 385, 185, 230);
  image(base, 575, 385, 185, 230);
  image(base, 175, 585, 185, 230);
  image(base, 375, 585, 185, 230);
  image(base, 575, 585, 185, 230);
  
  //map extra
  image(skull1, 575, 510, 60, 80);
  image(skull2, 330, 280, 100, 100);
  image(skull3, 175, 680, 70, 100);
   
}

void mole(){
  if(time >0){   
    fill(180,105,105);
    if(frameCount%30 ==0){   // KARAKTER SPAWNI ICIN % DEĞERİ
      moleLocation=(int)random(1,10);   
}

if(moleLocation ==1){
  moleX = 210;
  moleY = 210;
  image(character1, moleX,moleY,130,150);
}
if(moleLocation ==2){
  moleX = 410;
  moleY = 210;
  image(character2, moleX,moleY,130,150);
}
if(moleLocation ==3){
  moleX = 610;
  moleY = 210;
  image(character3, moleX,moleY,130,150);
}
if(moleLocation ==4){
  moleX = 210;
  moleY = 410;
  image(character4, moleX,moleY,130,150);
}
if(moleLocation ==5){
  moleX = 410;
  moleY = 410;
  image(character5, moleX,moleY,130,150);
}
if(moleLocation ==6){
  moleX = 610;
  moleY = 410;
  image(character6, moleX,moleY,130,150);
}
if(moleLocation ==7){
  moleX = 210;
  moleY = 610;
  image(character7, moleX,moleY,130,150);
}
if(moleLocation ==8){
  moleX = 410;
  moleY = 610;
  image(character8, moleX,moleY,130,150);
}
 if(moleLocation ==9){
  moleX = 610;
  moleY = 610;
  image(character9, moleX,moleY,130,150);
}
}
}

void time(){
  textAlign(CENTER);
  textSize(50);
  fill (225, 225, 225);
  text("Time:" + time, 200, 100);
  
 if(time <= 5){
    LowPathh = sketchPath(LowSoundd);
    LowFilee = new SoundFile(this, LowPathh);
    LowFilee.play();

  }
  
  if(time <= 0){
    LowPathh = sketchPath(LowSoundd);
    LowFilee = new SoundFile(this, LowPathh);
    LowFilee.pause();

  }
  
  if(time > 0 && frameCount%30 == 0){  //SÜRE HIZLANDIRMA VE YA YAVAŞLATMAK İÇİNDE % DEĞERİNİ DEĞİŞTİRİN
    time = time -1;
  }
}

void score() {
  
   fill (225, 225, 225);
  textSize(50);
  text("Score:" + score, 700, 100);
  
  if(score <= -1)
  {
        image(character1, 210, 210, 100, 150);
        image(character2, 410, 210, 100, 150);
        image(character3, 610, 210, 100, 150);
        image(character4, 210, 410, 100, 150);
        image(character5, 410, 410, 100, 150);
        image(character6, 610, 410, 100, 150);
        image(character7, 210, 610, 100, 150);
        image(character8, 410, 610, 100, 150);
        image(character9, 610, 610, 100, 150);
      fill (225, 3, 3);
      textSize(50);
      text("Game Over \n press any key to restart" , width/2, height/9);  
      if(keyPressed){
      setup();
  }
}
}  
void mouseClicked() {
  if(mouseX >= moleX && mouseY <= moleX + 900 && mouseY >= moleY && mouseY <= moleY + 900 && time >0){
    score = score +1;
    if(time <=30){
      time=time +1;
    }
 moleLocation= (int) random(1,10);

/////////
    GoodPathh = sketchPath(GoodSoundd);
    GoodFilee = new SoundFile(this, GoodPathh);
    GoodFilee.play();
/////
    }
    else
    {
     time=time -5;
     score = score -1;
     fill (221, 222, 234);
      textSize(35);
      text("OMG! \n Time : -5 \n Score -1" , width/2, height/9);
    /////////// error tick    
    ErrorTikPath = sketchPath(ErrorTikSound);
    ErrorTick = new SoundFile(this, ErrorTikPath);
    ErrorTick.play();
    
    }    
  } 
  void winPanel()
  {
    if(score >= 10) {     
        image(character1caught, 210, 210, 130, 150);
        image(character2caught, 410, 210, 130, 150);
        image(character3caught, 610, 210, 130, 150);
        image(character4caught, 210, 410, 130, 150);
        image(character5caught, 410, 410, 130, 150);
        image(character6caught, 610, 410, 130, 150);
        image(character7caught, 210, 610, 130, 150);
        image(character8caught, 410, 610, 130, 150);
        image(character9caught, 610, 610, 130, 150);  
        
        ////////////
    WinPathh = sketchPath(WinSoundd);
    WinFilee = new SoundFile(this, WinPathh);
    WinFilee.play();
    
        
     fill (8, 252, 230);
      textSize(50);
      text("Game Win \n press any key to restart" , width/2, height/9);
      if(keyPressed){
        WinFilee.pause();
        setup();
      }
    }
  }  
  void gameOver() {
    if(time <= 0) {          
        image(character1, 210, 210, 130, 150);
        image(character2, 410, 210, 130, 150);
        image(character3, 610, 210, 130, 150);
        image(character4, 210, 410, 130, 150);
        image(character5, 410, 410, 130, 150);
        image(character6, 610, 410, 130, 150);
        image(character7, 210, 610, 130, 150);
        image(character8, 410, 610, 130, 150);
        image(character9, 610, 610, 130, 150);
        
    /////////// horror sound effect  
    ErrorPath = sketchPath(ErrorSound);
    ErrorFile = new SoundFile(this, ErrorPath);
    ErrorFile.play();
    //////////////////
    
      fill (225, 3, 3);
      textSize(50);
      text("Game Over \n press any key to restart" , width/2, height/9);  
      if(keyPressed){
      ErrorFile.pause();
      setup();
      }
    }
  } 
  class Drops{
    float x,y,speed;
    float ellipseX,ellipseY,endPos;
    color c;
    Drops(){
    init();
    }    
    void init(){
       x=random(width);
      y=random(-300,0);
      speed=random(1,4)*6;
      c=color(random(255),random(0),random(0));
      ellipseX=0;
      ellipseY=0;
      endPos=height-100+(random(300));
    }   
    void update(){
      y+=speed;
    }
    
      void display(){
        fill(c);
        noStroke();
        rect(x,y,2,15);
        update();
      }
      
      void endPos(){
        stroke(c);
        noFill();
        ellipse(x,y, ellipseX,ellipseY);
        
        ellipseY+=speed * 0.2;
        ellipseX+=speed * 0.5;
        
        if(ellipseX>50)
        init();
      }
  }
