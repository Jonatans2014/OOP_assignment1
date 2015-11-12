// global array list

PFont titleF,LabelF;

 PShape  rect;
ArrayList<Data> DataInfo =  new ArrayList<Data>();
color [] colarray = { color(#FFFFFF), color(220,200,85),
 color(185,65,200), color(0,145,35), color(245,35,200) };
//declaring variable to load img

PImage[] flags = new PImage[10];

String[] flagNames = {"uk.jpg","rus.jpg","chi.png","bra.png","usa.png","ger.png","jap.jpg","fra.png","ind.png","ita.png"};

void setup()
{
  
  size(500,500,P3D);
  background(255);
  smooth();
  // load image
  
  loadData();
 
  
}



// load data
void loadData()
{
    // this line of code gonna load the data called gdp
      String[] lines =  loadStrings("Economies.csv");
      String[] lines2 = loadStrings("Economies2016.csv");
      String[] lines3 = loadStrings("Economies2017.csv");
      
      
      for(int i = 0; i < lines.length; i ++)
      {
          // populate classes
          Data dataobject = new Data(lines[i]);
         //populate array lsit
          DataInfo.add(dataobject); 
      }
}


// load 

// implement years

void drawYears()
{
  
   // choice
             fill(0);
            stroke(50);
              
              for (int i =0; i < 3; i++)
              {
                  float xchoice =  map(i,0,3,100,300);
                                
                  text(DataInfo.get(i).year,xchoice,50);
                  
                  
               if(mouseX<=144 &&  mouseY <=99 )
               {
                   fill(55);
                   text(DataInfo.get(i).year,xchoice,50);
               }
                  
                  
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
                
                  // code to do the roll over and load flag
                 
                 if(mouseX > x && mouseX < x +barWidth && mouseY > height/2 && mouseY < windowsRange)
                  {
                        imageMode(CENTER);
                        image(flags[i],x,-y,x,450);
                       
                            
                    
                  }
                
                rect( x, windowsRange, barWidth, -y);
                
                 fill(#4B4B50);
                 stroke(#4B4B50);
                float textmap  = map(DataInfo.get(i).economy,min,max,350,150);
                text(DataInfo.get(i).country.substring(0,3),x,480);
                text(DataInfo.get(i).economy,x,textmap);
                
                 flags[i] = loadImage(flagNames[i]);
                 println(y);
                 
                   
                 
                 
          }
        
          
          
        
       
          
          
     
}






void draw()
{
    background(255);
     
     drawrect();
     drawYears();

}