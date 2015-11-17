import processing.video.*;
import de.fhpotsdam.unfolding.mapdisplay.*;
import de.fhpotsdam.unfolding.utils.*;
import de.fhpotsdam.unfolding.marker.*;
import de.fhpotsdam.unfolding.tiles.*;
import de.fhpotsdam.unfolding.interactions.*;
import de.fhpotsdam.unfolding.ui.*;
import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.core.*;
import de.fhpotsdam.unfolding.mapdisplay.shaders.*;
import de.fhpotsdam.unfolding.data.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.texture.*;
import de.fhpotsdam.unfolding.events.*;
import de.fhpotsdam.utils.*;
import de.fhpotsdam.unfolding.providers.*;
import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.providers.Microsoft;



UnfoldingMap map;
// Create point markers for locations
SimplePointMarker usaMarker;
SimplePointMarker chnMarker;

SimplePointMarker japMarker;
SimplePointMarker gerMarker;
SimplePointMarker ukMarker;
SimplePointMarker fraMarker;
SimplePointMarker braMarker;
SimplePointMarker rusMarker;
SimplePointMarker itaMarker;
SimplePointMarker indMarker;

// global array list
int mode = 5;
PFont text;

PShape  rect;
ArrayList<Data> DataInfo =  new ArrayList<Data>();
color rectHighlight;
color [] colarray = { 
  color(#FFFFFF), color(220, 200, 85), 
  color(185, 65, 200), color(0, 145, 35), color(245, 35, 200)
};
PImage bg;
PImage img;
//declaring variable to load img
PImage[] flags = new PImage[10];
String[] flagNames = {
  "usa.png",  "chi.png", "jap.jpg", "ger.png","uk.jpg", "fra.png", "bra.png","rus.jpg" , "ita.png","ind.png"
};

void setup()
{
  
  size(500, 500, P3D);
  smooth();
  bg = loadImage("bg_night.png");
  
   rectHighlight = color(51);
  
  
  // load image
  
  text = createFont("Arial-BoldItalicMT-20.vlw", 20);

  textFont(text);
  
  // INITIALIZING MAP OBJECTS
  
  map = new UnfoldingMap(this, new Google.GoogleMapProvider());
  MapUtils.createDefaultEventDispatcher(this, map);

  // search for the location
  Location usaLocation = new Location(37, -95.71);
  usaMarker = new SimplePointMarker(usaLocation);



  Location chnLocation = new Location(35.86, 104.19);
  chnMarker= new SimplePointMarker(chnLocation);

  Location japLocation = new Location(36.20, 138.2);
  japMarker= new SimplePointMarker(japLocation);

  Location gerLocation = new Location(51.16, 10.45);
  gerMarker =new SimplePointMarker(gerLocation);

  Location ukLocation = new Location(52.3, -1.17);
  ukMarker =new SimplePointMarker(ukLocation);

  Location fraLocation = new Location(46.2, 2.21);
  fraMarker =new SimplePointMarker(fraLocation);

  Location braLocation = new Location(-14.2, -51.9);
  braMarker= new SimplePointMarker(braLocation);

  Location rusLocation = new Location(61.5, 105.3);
  rusMarker =new SimplePointMarker(rusLocation);

  Location itaLocation = new Location(41.8, 12.5);
  itaMarker =new SimplePointMarker(itaLocation);


  Location indLocation = new Location(20.5, 78.9);
  indMarker= new SimplePointMarker(indLocation);

}



// load data
void loadData()
{
           int changeYear= 0;
           String[] lines = {"Economies.csv" };
           
           if(mode == 0)
           {
                lines = loadStrings("Economies.csv");

           }
           if(mode == 1)
           {  
                 lines =  loadStrings("Economies2017.csv");
                 
           }
           
          // this line of code gonna load the data called gdp
        
        
          float rectwidth = width * 0.08f;
          float recty = width * 0.05f;
          float border = width * 0.1f;
            
            
            
          for (int i = 0; i < lines.length; i ++)
          {
            // populate classes
            Data dataobject = new Data(lines[i]);
            //populate array lsit
            DataInfo.add(dataobject);
          }
  
   
     // if mouse presse statement
    
   
  
  
}


// load 

// implement years

void drawrect()
{    


   
  float barWidth = (width * 0.7f) / (float)DataInfo.size();
  float border = width *0.1f;
  float windowsRange = width - (width* 0.12);
  float heightRange = height - (height * 0.12);
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
  for (int i =0; i < DataInfo.size (); i++)
  {
    fill(#0C027C);
    float x = map(i, 0, DataInfo.size()-1, border, windowsRange);
    float y = map(DataInfo.get(i).economy, min, max, border, height/2);



    rect( x, heightRange, barWidth, -y);

    float rectwidth = width * 0.08f;
    float recty = width * 0.05f;
    
    // draw the rectagle
    rect(x, border, barWidth, recty);

    fill(255);
    stroke(#4B4B50);
    float textmap  = map(DataInfo.get(i).economy, min, max, 380, 160);
    textAlign(LEFT);
    text(DataInfo.get(i).country, x, windowsRange + recty);

    text(nf(DataInfo.get(i).economy, 1, 1), x, textmap);

    flags[i] = loadImage(flagNames[i]);


      
    // code to do the roll over and load flag

    if (mouseX > x && mouseX < x +barWidth && mouseY > height/1.5 && mouseY < windowsRange)
    {
      imageMode(CENTER);
      image(flags[i], width/2, height/2, width*0.2, height*0.2);
      
    }


    // code to draw 10 rect 

    smooth();

    strokeWeight(2);
    fill(255);
    textSize(16);

    text(DataInfo.get(i).year, x, 70);


    float x2 =  map(i, 0, DataInfo.size()-1, 20, 450);


    // code to do the mouse over
    if (mouseX > x2 && mouseX < x2 +rectwidth && mouseY > border && mouseY < border+recty)
    {
        
        img = loadImage("cool.png");
        image(img, x2-10, border-10, barWidth, 50);
       stroke(rectHighlight);
         fill(rectHighlight);
      
      println("hey tell me somethi right not  " +mouseY);
    }
      
     
    
  }
  
 
}

// method to implement the map 

void WorldMap()
{
   map.draw();
  ScreenPosition usaPos = usaMarker.getScreenPosition(map);
  ScreenPosition chnPos = chnMarker.getScreenPosition(map);
  ScreenPosition japPos = japMarker.getScreenPosition(map);
  ScreenPosition gerPos = gerMarker.getScreenPosition(map);
  ScreenPosition ukPos =  ukMarker.getScreenPosition(map);
  ScreenPosition fraPos = fraMarker.getScreenPosition(map);
  ScreenPosition braPos = braMarker.getScreenPosition(map);
  ScreenPosition rusPos = rusMarker.getScreenPosition(map);
  ScreenPosition itaPos = itaMarker.getScreenPosition(map);
  ScreenPosition indPos = indMarker.getScreenPosition(map);
  fill(#333366);
  ellipse(usaPos.x, usaPos.y, 10, 10);
  ellipse(chnPos.x, chnPos.y, 10, 10);
  ellipse(japPos.x, japPos.y, 10, 10);
  ellipse(ukPos.x, ukPos.y, 10, 10);
  ellipse(gerPos.x, gerPos.y, 10, 10);
  ellipse(fraPos.x, fraPos.y, 10, 10);
  ellipse(braPos.x, braPos.y, 10, 10);
  ellipse(rusPos.x, rusPos.y, 10, 10);
  ellipse(itaPos.x, itaPos.y, 10, 10);
  ellipse(indPos.x, indPos.y, 10, 10);
  
}





void draw()
{
  background(bg);
  
  
  switch(mode)
  {
      case 0:
      {
        
              DataInfo.clear();  
              loadData();
               
                      
          
          break;
      }// case 0
      
      case 1:
      {
        
           DataInfo.clear(); 
          loadData();
        
        
        
            
            
        
        
        break;
      }
      
      case 2:
      {
        
         WorldMap();
         
         break;
      }
      
      
  }// end switch
   drawrect();
    
}


void keyPressed()
{
  if (key >= '0' && key <='4')
  {
    mode = key - '0';
  }
  println(mode);
}
