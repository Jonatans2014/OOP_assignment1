// global array list

ArrayList<Data> DataInfo =  new ArrayList<Data>();
color [] colarray = { color(#FFFFFF), color(220,200,85),
 color(185,65,200), color(0,145,35), color(245,35,200) };
//declaring variable to load img
 PImage img;

void setup()
{
  
  size(500,500);
  background(255);
  smooth();
  // load image
  
  loadData();
  
  
}



// load data
void loadData()
{
    // this line of code gonna load the data called gdp
      String[] lines = loadStrings("Economies.csv");
      for(int i = 0; i < lines.length; i ++)
      {
          // populate classes
          Data dataobject = new Data(lines[i]);
         //populate array lsit
          DataInfo.add(dataobject); 
      }
}



// implement the rect method

void drawrect()
{    
  
        
        
          float barWidth = (width * 0.7f) / (float)DataInfo.size();
          float border = width *0.1f;
          float windowsRange = width - (width* 0.12);
          float max = Float.MIN_VALUE;
        
          
          // find the max value
          for (Data Data1 : DataInfo)
          {
            if (Data1.economy > max)
            {
              max = Data1.economy;
            }
          }
          
          
          // finds the min value
          
           float min = Float.MAX_VALUE;
        
          for (Data Data1 : DataInfo)
          {
            if (Data1.economy < min)
            {
              min = Data1.economy;
            }
          }
          for (int i =0; i < DataInfo.size(); i++)
          {
                fill(#0C027C);
                float x =map(i,0,DataInfo.size(),20,480);
                float y = map(DataInfo.get(i).economy, min, max, border, height/2);
                rect( x, windowsRange, barWidth, -y);
                
                 fill(#4B4B50);
                 stroke(#4B4B50);
                float textmap  = map(DataInfo.get(i).economy,min,max,350,150);
                text(DataInfo.get(i).country.substring(0,3),x,480);
                text(DataInfo.get(i).economy,x,textmap);
          }
        
          
  
      
  
}





void draw()
{
    background(255);
     drawrect();
  
    
}
