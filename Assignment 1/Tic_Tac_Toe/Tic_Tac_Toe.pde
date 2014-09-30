//This is the code for multiplayer Tic Tac Toe game
//Use the mouse to click on differnt blocks in the arena accroding to the player turn

//This code is developed by Jinali M Sheth 
//Email id : jms1333@nyu.edu

import java.awt.Rectangle;

int player_num=1;
int current_box=1;
int winner=-1;
int square_size=200;
int game_over=0;
//012
//345
//678
long lastTime = 0;
Rectangle[] blocks = new Rectangle[10];
int block_key[]= new int[10];

//This function inits the Rectangles holding the boundries of each block
void init_arena()
{
  fill(204, 102, 0);
  int i,j;
  int block_index=0;
  for(j=0;j<3;j++)
  for(i=0;i<3;i++)
  {
    blocks[block_index]= new Rectangle((20+i*square_size),(30+j*square_size),square_size,square_size);
    block_index++;
  }
 for(i=0;i<9l;i++)
  block_key[i]=0; 
}

//This function draws the blocks (Squares)
void draw_arena()
{
  fill(204, 102, 0);
  int i;
  for(i=0;i<9;i++)
  {
  if (blocks[i].contains(mouseX,mouseY)) { 
    fill(102,204, 0);
  } else {
   fill(204, 102, 0);
  }
   rect(blocks[i].x, blocks[i].y, blocks[i].width,blocks[i].height); 
  } 
}
//This function returns the current block number based on mouse location 
// Return value = block numbers from  from 0 to 8
int get_block_number()
{
  int i=0;
  for(i=0;i<9;i++)
  {
    if (blocks[i].contains(mouseX,mouseY)) {
      return i; 
    }
    
  }
  return -1;
}
//When mouse released this function is executed 
void mouseReleased() {
  int i;
  current_box= get_block_number();//get the current block number based on mouse location (block numbers are from 0 to 8)
  println("current block number= "+current_box+"player_num="+player_num);
  block_key[get_block_number()]=player_num;
  print_block_keys();
  winner=check_for_match(); 
  println("winner="+winner);
  toggle_player();
}

//This functoin checks for a match combination based on the current block
//This function returns the current winner 1 or 2 else returns -1 
int check_for_match()
{

  
  if(current_box==0)
  {
    if(( block_key[0]==player_num )&&( block_key[1]==player_num )&&( block_key[2]==player_num ) )
    {
    return player_num;  
    }
    else if(( block_key[0]==player_num )&&( block_key[3]==player_num )&&( block_key[6]==player_num ))
    {
      return player_num;
    }
    else if(( block_key[0]==player_num )&&( block_key[4]==player_num )&&( block_key[8]==player_num ))
    {
      return player_num;
    }
  }
  
  if(current_box==1)
  {
    if(( block_key[1]==player_num )&&( block_key[4]==player_num )&&( block_key[7]==player_num ) )
    {
    return player_num;  
    }
    else if(( block_key[1]==player_num )&&( block_key[2]==player_num )&&( block_key[0]==player_num ))
    {
      return player_num;
    }
  }
  if(current_box==2)
  {
    if(( block_key[2]==player_num )&&( block_key[1]==player_num )&&( block_key[0]==player_num ) )
    {
    return player_num;  
    }
    else if(( block_key[2]==player_num )&&( block_key[5]==player_num )&&( block_key[8]==player_num ))
    {
      return player_num;
    }
     else if(( block_key[2]==player_num )&&( block_key[4]==player_num )&&( block_key[6]==player_num ))
    {
      return player_num;
    }
  }
  
  
    if(current_box==3)
  {
    if(( block_key[3]==player_num )&&( block_key[4]==player_num )&&( block_key[5]==player_num ) )
    {
    return player_num;  
    }
    else if(( block_key[3]==player_num )&&( block_key[0]==player_num )&&( block_key[6]==player_num ))
    {
      return player_num;
    }
  }
  
    if(current_box==4)
  {
    if(( block_key[4]==player_num )&&( block_key[1]==player_num )&&( block_key[7]==player_num ) )
    {
    return player_num;  
    }
    else if(( block_key[4]==player_num )&&( block_key[5]==player_num )&&( block_key[3]==player_num ))
    {
      return player_num;
    }
     else if(( block_key[4]==player_num )&&( block_key[0]==player_num )&&( block_key[8]==player_num ))
    {
      return player_num;
    }
  }
    if(current_box==5)
  {
    if(( block_key[5]==player_num )&&( block_key[5]==player_num )&&( block_key[3]==player_num ) )
    {
    return player_num;  
    }
    else if(( block_key[5]==player_num )&&( block_key[2]==player_num )&&( block_key[8]==player_num ))
    {
      return player_num;
    }
  }
  
    if(current_box==6)
  {
    if(( block_key[6]==player_num )&&( block_key[7]==player_num )&&( block_key[8]==player_num ) )
    {
    return player_num;  
    }
    else if(( block_key[6]==player_num )&&( block_key[3]==player_num )&&( block_key[0]==player_num ))
    {
      return player_num;
    }
     else if(( block_key[6]==player_num )&&( block_key[4]==player_num )&&( block_key[2]==player_num ))
    {
      return player_num;
    }
  }
  if(current_box==7)
  {
    if(( block_key[7]==player_num )&&( block_key[6]==player_num )&&( block_key[8]==player_num ) )
    {
    return player_num;  
    }
    else if(( block_key[7]==player_num )&&( block_key[4]==player_num )&&( block_key[1]==player_num ))
    {
      return player_num;
    }

  }
  if(current_box==8)
  {
    if(( block_key[8]==player_num )&&( block_key[4]==player_num )&&( block_key[0]==player_num ) )
    {
    return player_num;  
    }
    else if(( block_key[8]==player_num )&&( block_key[7]==player_num )&&( block_key[6]==player_num ))
    {
      return player_num;
    }
     else if(( block_key[8]==player_num )&&( block_key[5]==player_num )&&( block_key[2]==player_num ))
    {
      return player_num;
    }
  }
  
  

return -1;
 
}
//This functions draws a square or circle in the block based on the player number (1 or 0)
void draw_block_keys()
{
  int j;
  int x;
  int y; 
  for(j=0;j<9;j++)
  {
      if(block_key[j]==1)
      {
      fill(102,2, 0); 
      x=( blocks[j].x + (square_size/2) );
      y=( blocks[j].y + (square_size/2));
      ellipse( x, y ,(square_size/2) ,(square_size/2) ); 
      }
      else if(block_key[j]==2)
      {
        fill(102,2, 0); 
         rect(blocks[j].x+50, blocks[j].y+50, blocks[j].width/2,blocks[j].height/2); 
      }
  }
}
//This function toggles the player number between 1 and 2
void toggle_player()
{
      if(player_num==1)
       player_num=2;
       else if(player_num==2)
       player_num=1;
}
void setup()
{
  size(680,680);
  background(255);
  init_arena();
  textSize(14);
}
int check_if_draw()
{
  int i=0;
  for(i=0;i<9;i++)
  {
   if(block_key[i]==0)
    {
      return 0;
    }   
  }
  return 1;
 
}
void draw()
{
    if(game_over==0)
    {
    background(255);
    draw_arena();
    draw_block_keys();
    }
    
    if(winner!=-1)
    {
      game_over=1;
       background(255);
       text("winner = player "+ winner+ "\nGame OVer", width/2-200, height/2);
       
    }
    else if(winner==-1)
    {
      if(check_if_draw()!=0)
       {
        game_over=1;
       background(255);
       text("Its a DRAW \nGame Over", width/2-200, height/2);
       
         
       }
    }
    if(game_over==0)
    text("current player " +player_num, width-190, 20);
}

//This function is used for debugging the block key values stored in array 
void print_block_keys()
{
  String keys="";
  int i=0;
   for(i=0;i<9;i++)
  keys+=" | "+block_key[i];
  println(keys);
}
