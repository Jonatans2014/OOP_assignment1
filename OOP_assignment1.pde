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
import java.util.List;





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

// array with locations
Location[] Top10Locations =  new Location[] {
  new Location(37, -95.71), new Location(35.86, 104.19), 
  new Location(36.20, 138.2), new Location(51.16, 10.45), new Location(52.3, -1.17), new Location(52.3, -1.17), 
  new Location(46.2, 2.21), new Location(-14.2, -51.9), new Location(41.8, 12.5)
  };

  int changeLocation = 0;

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


PImage mapImg, videoImg, barchatAni, barchartImg, mapAni;
int[] chanRad = {
  50, 90, 130, 230, 300
};
int rotA = 0;
int rotB = 1;
int rotC = 2;
int rotD = 3;
int rotE = 4;

PShape mapShape;
void setup()
{



  size(500, 500, P3D);
  smooth();
  myMovie = new Movie(this, "World.mp4");
  // load image
  bg = loadImage("bg_night.png");


  mapImg = loadImage("earthpic.jpg"); 
  barchatAni= loadImage("barchatAni.jpg");
  videoImg = loadImage("bestCountries.jpg");
  mapAni = loadImage("mapAni.jpg");
  barchartImg = loadImage("barchartImg.jpg");


  //call map metho
  Map();



  text = createFont("Arial-BoldItalicMT-15.vlw", 15);

  textFont(text);

  // INITIALIZING MAP OBJCTS
}




// implement marker method
void Map()
{
  smooth();

  map = new UnfoldingMap(this, new Google.GoogleMapProvider());
  map.setTweening(true);
  map.zoomToLevel(2);

  MapUtils.createDefaultEventDispatcher(this, map);
  // search for the location
  Location usaLocation = new Location(37, -95.71);
  usaMarker = new SimplePointMarker(usaLocation);

  // load geoJSON
  List<Feature> Top10Countries =  GeoJSONReader.loadData(this, "top10Countries.json");
  List<Marker> Top10countryMarkers = MapUtils.createSimpleMarkers(Top10Countries);
  map.addMarkers(Top10countryMarkers);

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

  Location canLocation = new Location(52.90, -108.7);
  canMarker = new SimplePointMarker(canLocation);


  Location AoceanLocation = new Location(53.43, -20.6);
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
  gerMarker.setStrokeColor(color(0, 0, 0));

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





void ZoomAn()
{
  map.draw();
  if (frameCount % 120 == 0) {


    map.zoomAndPanTo(Top10Locations[changeLocation], 4);
    changeLocation++;
    if (changeLocation >= Top10Locations.length) {
      changeLocation = 0;
    }
  }
}

void loadAni()
{
  String[] lines = {
    "Economies.csv", "Economies2016.csv", "Economies2017.csv"
  };

  String[] line= { 
    "Economies.csv"
  };
  String[] years  = {
    "2015", "2016", "2017"
  };


  if (frameCount % 140 == 0) {
    background(bg);

    line = loadStrings(lines[changeLocation]);
    // populate classes

    float rectwidth = width * 0.08f;
    float recty = width * 0.05f;
    float border = width * 0.1f;


    fill(#0C027C);
    stroke(255);

    fill(255);


    for (int i = 0; i < line.length; i ++)
    {
      Data dataobject = new Data(line[i]);

      println("display  and change location" +line[i], "change to "+ changeLocation);
      //populate array list
      
      DataInfo.add(dataobject);
      text(years[changeLocation], width*0.4f, 140);

      changeLocation ++;      
      if (changeLocation >= lines.length) {
        changeLocation = 0;
      }
    }
  }
}




// load data
void loadData()
{
  int changeYear= 0;
  String[] lines = {
    "Economies.csv"
  };



  lines = loadStrings("Economies.csv");
  textFont(text);


  // this line of code gonna load the data called gdp


  float rectwidth = width * 0.08f;
  float recty = width * 0.05f;
  float border = width * 0.1f;


  fill(#0C027C);
  stroke(255);

  fill(255);
  text("2015", width*0.4f, 140);
  for (int i = 0; i < lines.length; i ++)
  {
    // populate classes
    Data dataobject = new Data(lines[i]);
    //populate array list
    DataInfo.add(dataobject);

    println(lines.length);
  }
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




    textFont(text);
    ;
    text("GDP in trillions of U.S. dollars.", width*0.3f, height*0.2f);
  }
}

// method to implement the map 

void CountriesInfo()
{



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
  ScreenPosition canPos  = canMarker.getScreenPosition(map);



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
  float iSize = 10;
  float imageSize = width *0.1f;


  stroke(255);
  //code to select and load an image 
  if (mouseX > usaPos.x-iSize && mouseX < usaPos.x+iSize && mouseY > usaPos.y-iSize && mouseY < usaPos.y+iSize )
  {



    textSize(15);
    
    stroke(255);
    text("1st\nUSA",  usaPos.x+xP, usaPos.y+xY);
  }


  // select for china
  if (mouseX > chnPos.x-iSize && mouseX < chnPos.x+iSize && mouseY > chnPos.y-iSize && mouseY < chnPos.y +iSize )
  {

    textSize(15);

    text("2nd\nCHN",  chnPos.x+xP,  chnPos.y+xY);
  }


  // select for japan 
  if (mouseX > japPos.x-iSize && mouseX < japPos.x+iSize && mouseY > japPos.y-iSize && mouseY < japPos.y +iSize )
  {


    textSize(15);

    text("3rd\n JAP", japPos.x+xP, japPos.x+xY);
  }


  // select for germany
  if (mouseX > gerPos.x-iSize && mouseX < gerPos.x+iSize && mouseY > gerPos.y-iSize && mouseY < gerPos.y +iSize )
  {


    textSize(15);

    text("4th\nDEU",  AoceanPos.x,AoceanPos.y);
  }

  // select uk
  if (mouseX > ukPos.x-iSize && mouseX < ukPos.x+iSize && mouseY > ukPos.y-iSize && mouseY < ukPos.y +iSize )
  {


    textSize(15);

    text("5th\nUK", AoceanPos.x,AoceanPos.y);
  }


  // select france 
  if (mouseX > fraPos.x-iSize && mouseX < fraPos.x+iSize && mouseY > fraPos.y-iSize && mouseY < fraPos.y +iSize )
  {


    textSize(15);

    text("6th\nFRA", AoceanPos.x,AoceanPos.y);
  }

  //select brasil
  if (mouseX > braPos.x-iSize && mouseX < braPos.x+iSize && mouseY > braPos.y-iSize && mouseY < braPos.y +iSize )
  {


    textSize(15);

    text("7th\nBR",braPos.x+xP,braPos.y+xP);
  }
  // select rus

  

  // select ita

  if (mouseX > itaPos.x-iSize && mouseX < itaPos.x+iSize && mouseY > itaPos.y-iSize && mouseY < itaPos.y +iSize )
  {


    textSize(15);

    text("8th\n ITA", AoceanPos.x,AoceanPos.y);
  }

  //select india
  if (mouseX > indPos.x-iSize && mouseX < indPos.x+iSize && mouseY > indPos.y-iSize && mouseY < indPos.y +iSize )
  {


    textSize(15);

    text("9th\nIND", SouchnPos.x+xP, SouchnPos.y+xY);
  }
  if (mouseX > canPos.x-iSize && mouseX < canPos.x+iSize && mouseY > canPos.y-iSize && mouseY < canPos.y +iSize )
  {


    textSize(15);

    text("10th\nCAN", AoceanPos.x+xP, AoceanPos.y+xY);
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





  switch(mode)
  {
  case 0:
    {
      DataInfo.clear();
      myMovie.stop();
     
      map.draw();
       CountriesInfo();
      break;
    }// case 0

  case 1:
    {

      background(bg); 
      DataInfo.clear();
      myMovie.stop(); 
      ZoomAn();
      break;
    }

  case 2:
    {

      DataInfo.clear(); 
      loadVideo();
      break;
    }

  case 3:
    { 

      DataInfo.clear();
      background(bg);  
      myMovie.stop(); 
      loadData();
      break;
    }
    // end switch


  case 4:
    {
      DataInfo.clear();
      myMovie.stop();
      loadAni();


      break;
    }


  case 5:
    {
      DataInfo.clear();
      myMovie.stop();
      Menu menu = new Menu();
      menu.display();
      break;
    }

  default: 
    println("Sorry you can only enter No from 0 - 5");
  }
  drawrect();
}




void mouseMoved() {
  // Deselect all marker
  for (Marker markerSelect : map.getMarkers ()) {
    markerSelect.setSelected(false);
  }

  // Select hit marker

  Marker markerSelect = map.getFirstHitMarker(mouseX, mouseY);
  if (markerSelect != null) {
    markerSelect.setSelected(true);
  }
}


void keyPressed()
{
  if (key >= '0' && key <='7')
  {
    mode = key - '0';
  }

  if (key == ' ') {
    map.getDefaultMarkerManager().toggleDrawing();
  }


  if (key == ENTER && chanRad[rotA] == chanRad[1] )
  {

    mode = 0;
  }
  if (key == ENTER && chanRad[rotB] == chanRad[1])
  {

    mode = 1;
  }
  if (key == ENTER && chanRad[rotC] == chanRad[1])
  {


    mode =2;
  }
  if (key == ENTER && chanRad[rotD] == chanRad[1])
  {


    mode = 3;
  }

  if (key == ENTER && chanRad[rotE] == chanRad[1])
  {


    mode = 4;
  }


  if (key == 'a' || key == 'A')
  {


    rotA ++;
    rotB ++;
    rotC ++;
    rotD ++;
    rotE ++;

    if (rotA == 5)
    {
      rotA = 0;
    }
    if (rotB == 5)
    {
      rotB = 0;
    }
    if (rotC == 5)
    {
      rotC = 0;
    }
    if (rotD == 5)
    {
      rotD = 0;
    }
    if (rotE == 5)
    {
      rotE = 0;
    }
  }




  if (key == 'd' || key =='D')
  {


    rotA --;
    rotB --;
    rotC --;
    rotD --;
    rotE --;

    if (rotA == -1)
    {
      rotA = 4;
    }
    if (rotB == -1)
    {
      rotB = 4;
    }
    if (rotC == -1)
    {
      rotC = 4;
    }
    if (rotD == -1)
    {
      rotD = 4;
    }
    if (rotE == -1)
    {
      rotE = 4;
    }
  }
}

