PImage enemyImg, fighterImg, bg1Img, bg2Img, hpImg , treasureImg, start1Img , start2Img,
       end1Img , end2Img ;

final int GAME_START=0,GAME_RUN=1,GAME_WIN=2,GAME_OVER=3 ;
int gameState ;

int enemyX1,enemyX2,enemyX3, enemyY1,enemyY2,enemyY3, treasureX , treasureY ,hpX ;
int a,b,c;

float x , y ,fighterSpeed =5;

boolean upPressed = false ;
boolean downPressed = false ;
boolean leftPressed = false ;
boolean rightPressed = false ;


void setup () {
  size(640,480) ;  
  fighterImg=loadImage("img/fighter.png");
  enemyImg=loadImage("img/enemy.png");
  bg1Img=loadImage("img/bg1.png");
  bg2Img=loadImage("img/bg2.png");
  hpImg=loadImage("img/hp.png");
  treasureImg=loadImage("img/treasure.png");
  start1Img=loadImage("img/start1.png");
  start2Img=loadImage("img/start2.png");
  end1Img=loadImage("img/end1.png");
  end2Img=loadImage("img/end2.png");
  treasureX=floor(random(30,500));
  treasureY=floor(random(50,400));
  hpX=40;
  enemyX1=-70;
  enemyY1=floor(random(30,400));
  enemyX2=-70-280-640;
  enemyY2=floor(random(30,200));
  enemyX3=-70-280-640-280-640;
  enemyY3=floor(random(200,300));
  a=0;
  b=0;
  c=0;
  x=550;
  y=height/2;
  gameState=GAME_START;

} 

void draw() {
  //gamestart
  switch(gameState){
    case GAME_START:
          image(start2Img,0,0);
                if( 210<mouseX && mouseX<450 && 370<mouseY&& mouseY<400 ){
                   if(mousePressed){
                   gameState=GAME_RUN;
                     x=550;
                     y=height/2;
                     hpX=40;
                    enemyX1=0;
                    enemyY1=floor(random(30,400));
                   }else{
                   image(start1Img,0,0);
                   }
                  }
          
           
    break;
    
    case GAME_RUN:
               //bg
              background(0);
              image(bg1Img,a,0);
              a++;
              a%=1280;
              image(bg2Img,b-640,0);
              b++;
              b%=1280;
              image(bg1Img,c-1280,0); 
              c++;
              c%=1280;
              
              //fighter
              
              image(fighterImg,x,y);
               if(upPressed){
               y-=fighterSpeed;
               }
               if(downPressed){
               y+=fighterSpeed;
               }
               if(leftPressed){
               x-=fighterSpeed;
               }
               if(rightPressed){
               x+=fighterSpeed;
               }
               
               //boundary detection
               if(x<35){
                 x=35;
               }if(x>570){
                 x=570;
               }if(y<35){
                 y=35;
               }if(y>420){
                 y=420;
               }
              
              //hp
              
              fill(255,0,0);
              rect(15,15,hpX,20);
              image(hpImg,10,10);
              if(hpX>=200){
                hpX=200;
              }
              
              //treasure
              
              image(treasureImg,treasureX,treasureY);
              
              if(x>=treasureX&& x-treasureX<=45 && y>=treasureY && y-treasureY<=45)
                {
                  hpX=hpX+20;
                    treasureX=floor(random(30,500));
                    treasureY=floor(random(50,400));
                    if(hpX>=200){
                   hpX=200;
                }
                }
                 if(x>=treasureX&& x-treasureX<=45 && y<=treasureY && treasureY-y<=45)
                {
                  hpX=hpX+20;
                    treasureX=floor(random(30,500));
                    treasureY=floor(random(50,400));
                     if(hpX>=200){
                   hpX=200;
                     }
                }
                  if(x<=treasureX&& treasureX-X<=45 && y>=treasureY && y-treasureY<=45)
                {
                  hpX=hpX+20;
                    treasureX=floor(random(30,500));
                    treasureY=floor(random(50,400));
                     if(hpX>=200){
                   hpX=200;
                     }
                }
                  if(x<=treasureX&& treasureX-x<=45 && y<=treasureY && treasureY-y<=45)
                {
                  hpX=hpX+20;
                    treasureX=floor(random(30,500));
                    treasureY=floor(random(50,400));
                     if(hpX>=200){
                   hpX=200;
                     }
                }
              
              //enemy
              final int COUNT=5;
              int enemyspacingX =-70 ; 
              int enemyspacingY =50 ; 
              
              //5 at a row
              for (int i=0 ; i<COUNT ; i++ ){
              int otherenemyX=enemyX1+i*enemyspacingX;
              image(enemyImg,otherenemyX,enemyY1);             
              }
              enemyX1+=4;
              enemyX1%=640*5-100;
              if(enemyX1>width+350){ 
                enemyY1=floor(random(30,400));
              } 
              
              // 5 enemy row as '/'
              for (int i=0 ; i<COUNT ; i++ ){
              int otherenemyX=enemyX2+i*enemyspacingX;
              int otherenemyY=enemyY2+i*enemyspacingY;
              image(enemyImg,otherenemyX,otherenemyY);             
              }
              enemyX2+=4;
              enemyX2%=640*5-100;
              if(enemyX2>width+350){ 
                enemyY2=floor(random(30,200));
              } 
              
              // 8 enemy row as '<>'
              for (int i=0 ; i<COUNT ; i++ ){
                int otherenemyX=enemyX3+i*enemyspacingX;
                if(i<=2){
                int otherenemyY1=enemyY3+i*enemyspacingY;    
                image(enemyImg,otherenemyX,otherenemyY1); 
                int otherenemyY2=enemyY3-i*enemyspacingY;
                image(enemyImg,otherenemyX,otherenemyY2); 
                
                }else{
                int otherenemyY1=enemyY3+i*enemyspacingY-4*enemyspacingY;
                image(enemyImg,otherenemyX,otherenemyY1);
                int otherenemyY2=enemyY3-i*enemyspacingY+4*enemyspacingY;
                image(enemyImg,otherenemyX,otherenemyY2); 
                }
                 
              }
              enemyX3+=4;
              enemyX3%=640*5-100;
              if(enemyX3>width+350){ 
                enemyY3=floor(random(200,300));
              } 

              
             
               
            //gameOver
            
            if( hpX<=0){         
             gameState=GAME_OVER;
            }
            
    break;
    case GAME_OVER:
       image(end2Img,0,0);
       if (210<mouseX &&mouseX<450 && 288<mouseY && mouseY<336  ){
           if(mousePressed){
           gameState = GAME_RUN;
             x=550;
              y=height/2;
              hpX=40;
              enemyX1=0;
              enemyY1=floor(random(30,400));
           }else{
           image(end1Img,0,0);
           }          
     break;
      
      }
   
  }
}

void keyPressed(){
  
     if(key==CODED){
      switch(keyCode){
      case UP:
      upPressed=true;
      break;
      case DOWN:
      downPressed=true;
      break;
      case LEFT:
      leftPressed=true;
      break;
      case RIGHT:
      rightPressed=true;
      break;
      }
     }
 
   }

void keyReleased(){
  
     if(key==CODED){
      switch(keyCode){
      case UP:
      upPressed=false;
      break;
      case DOWN:
      downPressed=false;
      break;
      case LEFT:
      leftPressed=false;
      break;
      case RIGHT:
      rightPressed=false;
      break;
      }
     }

 
    
    }
