color a = color(0,0,0);
color b = color(255,255,255);

int pixel_size = 2;
int grid_space = 100;

int circle_diam = 30;

void setup() 
{
  size(500,500);
  background(110);
  noStroke();
  //noLoop();
}

void draw()
{
  circle_diam = int(map(mouseX, 0, width, 10, 300));
  
  for(int y = 0; y<height; y+=pixel_size){
    for(int x= 0; x<width; x+=pixel_size){
      
      int counter = count_overlaps(x,y);
      
      if((counter)%2 == 0){
        pixel(x,y,pixel_size,false);
      }
      if((counter)%2 == 1){
        pixel(x,y,pixel_size,true);
      }
      
    }
  }
}

void pixel(int x, int y, int side, boolean on)
{
  if (on){
    fill(a);
  }
  if(!on){
    fill(b);
  }
  rect(x,y,side,side);
}

int count_overlaps(int x, int y){
  int count = 0;

  for(int k = -height; k < height*2; k += grid_space)
  {
    for(int j = -width; j < width*2; j += grid_space)
    {
      if(dist(j,k,x,y) <= circle_diam)
      {
        count ++;
      }
    }
  }
  return count;
}