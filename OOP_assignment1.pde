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
//  Simplepoit marker class with diferent objects for each country
SimplePointMarker japMarker;
SimplePointMarker gerMarker;
SimplePointMarker ukMarker;
SimplePointMarker fraMarker;
SimplePointMarker braMarker;
SimplePointMarker rusMarker;
SimplePointMarker itaMarker;
SimplePointMarker indMarker;
SimplePointMarker canMarker;
SimplePointMarker AoceanMarker;
SimplePointMarker SouchnMarker;


// calling objetc movie
Movie myMovie;
// global array list
int mode = 5;
PFont text;

PShape  rect;
ArrayList<Data> DataInfo =  new ArrayList<Data>();

color rectHighlight;


PImage bg;

//declaring variable to load img

PImage[] flags = new PImage[10];

String[] flagNames = {
  "usa.png", "chi.png", "jap.jpg", "ger.png", "uk.jpg", "fra.png", "bra.png", "rus.jpg", "ita.png", "ind.png"
};

void setup()
{

  size(500, 500, P3D);
  smooth();
  myMovie = new Movie(this, "World.mp4");
  // load image
  bg = loadImage("bg_night.png");



  //call map metho
  Map();



  text = createFont("Arial-BoldItalicMT-20.vlw", 20);

  textFont(text);

  // INITIALIZING MAP OBJECTS
}

// implement marker method
void Map()
{
  smooth();

  map = new UnfoldingMap(this, new Google.GoogleMapProvider());
  map.zoomToLevel(2);
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

  Location canLocation = new Location(52.90,-108.7);
  canMarker = new SimplePointMarker(canLocation);
  

  Location AoceanLocation = new Location(32.3, -80);
  AoceanMarker = new SimplePointMarker(AoceanLocation);

  Location SouchnLocation = new Location(30.39, 124.7);
  SouchnMarker = new SimplePointMarker(SouchnLocation);


  map.addMarkers(usaMarker, chnMarker, japMarker, gerMarker, ukMarker, fraMarker, braMarker, canMarker, itaMarker, indMarker);

  //Adapt style fo each markers

  usaMarker.setColor(color(#3A00FF));
  usaMarker.setStrokeColor(color(255, 255, 255));

  chnMarker.setColor(color(#FF0026));
  chnMarker.setStrokeColor(color(255, 255, 255));


  japMarker.setColor(color(255, 255, 255));
  japMarker.setStrokeColor(color(#FF0026));

  gerMarker.setColor(color(#FAFF00));
  gerMarker.setStrokeColor(color(0,0,0));

  ukMarker.setColor(color(#0700FF));
  ukMarker.setStrokeColor(color(#FF002F));
  
  fraMarker.setColor(color(#3A00FF));
  fraMarker.setStrokeColor(color(255, 255, 255));
  
  braMarker.setColor(color(#FFF700));
  braMarker.setStrokeColor(color(#238E00));
  
  
  

  itaMarker.setColor(color(#018609));
  itaMarker.setStrokeColor(color(255, 255, 255));
  
  
  indMarker.setColor(color(#FF5E00));
  indMarker.setStrokeColor(color(255, 255, 255));
  
  canMarker.setColor(color(#FF0000));
  canMarker.setStrokeColor(color(255, 255, 255));
}


// load data
void loadData()
{
  int changeYear= 0;
  String[] lines = {
    "Economies.csv"
  };

  if (mode == 0)
  {
    lines = loadStrings("Economies.csv");
  }
  if (mode == 1)
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

  // assign the a value of the data to a variable called max
  float max = Float.MIN_VALUE;


  // compare all the other values from the data and find the max value
  for (Data Data1 : DataInfo)
  {
    if (Data1.economy > max)
    {
      max = Data1.economy;
    }
  }


  // assign the a value of the data to a variable finds the min value

  float min = Float.MAX_VALUE;

  // compare and find the min value 
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
    /*//"i" is the value "0" is the lowest value, "dataInfo" max value then 
     then when i is the min value its gonna find a position on the screen for that value 
     which will be border border = 50  and when i is datainfo it will find a position on 
     on the screen which will be windowsRange. WindowsRange is > 400 ps this is X axe*/
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

    // change color of text
    if (mode == 2)
    {
      fill(0);
      stroke(0);
    }


    text(DataInfo.get(i).country, x, windowsRange + recty);


    text(nf(DataInfo.get(i).economy, 1, 1), x, textmap);

    flags[i] = loadImage(flagNames[i]);



    // code to do the roll over and load flag
    /*
    if (mouseX > x && mouseX < x +barWidth && mouseY > height/1.5 && mouseY < windowsRange)
     {
     imageMode(CENTER);
     image(flags[i], width/2, height/2, width*0.2, height*0.2);
     
     }*/


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
  ScreenPosition AoceanPos = AoceanMarker.getScreenPosition(map);
  ScreenPosition SouchnPos = SouchnMarker.getScreenPosition(map);


  String[]markNames = {
    "main.png", "chna.png", "jap1.png", 
    "germ.png", "fran.png", "uk1.png", "bras.png", "rus1.png", "ita1.png", "indi.png"
  };
  PImage[] markerIcon = new PImage[10];
  for (int i = 0; i < markNames.length; i ++)
  {
    markerIcon[i] =loadImage(markNames[i]);
  }
  fill(#FC0303);
  stroke(255);
  /// draw circles


  for (int i = 0; i < flags.length; i ++)
  {

    flags[i] = loadImage(flagNames[i]);
  }
  // if mouse over than load the flags and informatiom about the country 
  /* if (mouseX > 105  && mouseX < 121 && mouseY > 170 && mouseY< 201)
   {
   image(flags[0],AoceanPos.x,AoceanPos.y,50,50);
   text("USA",AoceanPos.x+60,AoceanPos.y+10);
   }
   */

  String Money = "Trillion";
  float xP  = width * 0.12;
  float xY = width * 0.02;
  float imageSize = width *0.1;



  //code to select and load an image 
  if (mouseX > usaPos.x-40 && mouseX < usaPos.x+40 && mouseY > usaPos.y-40 && mouseY < usaPos.y +30 )
  {



    textSize(15);
    image(flags[0], AoceanPos.x, AoceanPos.y, imageSize, imageSize);
    text("1st\n18.1Trillion", AoceanPos.x+xP, AoceanPos.y+xY);
  }


  // select for china
  if (mouseX > chnPos.x-40 && mouseX < chnPos.x+40 && mouseY > chnPos.y-40 && mouseY < chnPos.y +30 )
  {

    textSize(15);
    image(flags[1], SouchnPos.x, SouchnPos.y, imageSize, imageSize);
    text("2nd\n18.1Trillion", SouchnPos.x+xP, SouchnPos.y+xY);
  }


  // select for japan 
  if (mouseX > japPos.x-40 && mouseX < japPos.x+40 && mouseY > japPos.y-40 && mouseY < japPos.y +30 )
  {


    textSize(15);
    image(flags[2], SouchnPos.x+xP, SouchnPos.y+xY, imageSize, imageSize);
    text("3rd", SouchnPos.x+xP, SouchnPos.y+xY);
  }


  // select for germany
  if (mouseX > gerPos.x-40 && mouseX < gerPos.x+40 && mouseY > gerPos.y-40 && mouseY < gerPos.y +30 )
  {


    textSize(15);
    image(flags[3], AoceanPos.x+xP, AoceanPos.y+xY, imageSize, imageSize );
    text("4th", AoceanPos.x+xP, AoceanPos.y+xY);
  }

  // select uk
  if (mouseX > ukPos.x-40 && mouseX < ukPos.x+40 && mouseY > ukPos.y-40 && mouseY < ukPos.y +30 )
  {


    textSize(15);
    image(flags[4], AoceanPos.x+xP, AoceanPos.y+xY, imageSize, imageSize) ;
    text("5th", AoceanPos.x+xP, AoceanPos.y+xY);
  }


  // select france 
  if (mouseX > fraPos.x-40 && mouseX < fraPos.x+40 && mouseY > fraPos.y-40 && mouseY < fraPos.y +30 )
  {


    textSize(15);
    image(flags[5], AoceanPos.x+xP, AoceanPos.y+xY, imageSize, imageSize) ;
    text("5th", AoceanPos.x+xP, AoceanPos.y+xY);
  }

  //select brasil
  if (mouseX > braPos.x-40 && mouseX < braPos.x+40 && mouseY > braPos.y-40 && mouseY < braPos.y +30 )
  {


    textSize(15);
    image(flags[6], AoceanPos.x+xP, AoceanPos.y+xY, imageSize, imageSize) ;
    text("5th", AoceanPos.x+xP, AoceanPos.y+xY);
  }
  // select rus

  if (mouseX > rusPos.x-40 && mouseX < rusPos.x+40 && mouseY > rusPos.y-40 && mouseY < rusPos.y +30 )
  {


    textSize(15);
    image(flags[7], SouchnPos.x+xP, SouchnPos.y+xY, imageSize, imageSize) ;
    text("5th", SouchnPos.x+xP, SouchnPos.y+xY);
  }

  // select ita

  if (mouseX > itaPos.x-40 && mouseX < itaPos.x+40 && mouseY > itaPos.y-40 && mouseY < itaPos.y +30 )
  {


    textSize(15);
    image(flags[8], SouchnPos.x+xP, SouchnPos.y+xY, imageSize, imageSize) ;
    text("5th", SouchnPos.x+xP, SouchnPos.y+xY);
  }

  //select india
  if (mouseX > indPos.x-40 && mouseX < indPos.x+40 && mouseY > indPos.y-40 && mouseY < indPos.y +30 )
  {


    textSize(15);
    image(flags[9], SouchnPos.x+xP, SouchnPos.y+xY, imageSize, imageSize) ;
    text("5th", SouchnPos.x+xP, SouchnPos.y+xY);
  }

  //draw text
}


void loadVideo()
{
  myMovie.play();
  image(myMovie, 0, 0, 500, 500);
  myMovie.read();
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
      myMovie.stop();
      loadData();
      break;
    }

  case 2:
    {

      myMovie.stop();
      WorldMap();

      break;
    }

  case 3:
    {
      // movie
      DataInfo.clear(); 
      loadVideo();
      break;
    }
  }// end switch

  drawrect();
}



void mouseMoved() {
  // Deselect all marker
  for (Marker marker : map.getMarkers ()) {
    marker.setSelected(false);
  }

  // Select hit marker

  Marker marker = map.getFirstHitMarker(mouseX, mouseY);
  if (marker != null) {
    marker.setSelected(true);
  }
}
void keyPressed()
{
  if (key >= '0' && key <='4')
  {
    mode = key - '0';
  }
  println(mode);
}

