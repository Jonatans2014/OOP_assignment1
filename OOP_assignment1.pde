


/*
    This program will enable uses to visualize the top 10 largest economies in the world and top 10 best countries to live in 
 program features:
 1 Barchart with top 10 2015 largest economies in the world data set
 1 Barchart time lapse showing economies from 2015 to 2017
 1 Map of the world which, will enable user to visualizes the countries from  different maps which are googleMap, oceanMap, sateliteMap,
 NatGeoWorldMap,TopologicalGeoMapProvider.
 1 Map animation which, will be switching from top 10 LE countries
 1 video that will enable users to visualise top 10 best countries to live ine
 
  Jonatans A de Souza 07/12/2015

 */
 
/* 
 Important notes:
 To run this program you will need to donwload a library from processing called 
 "unfoldingMap". unfoldingMap just gonna work with processing 2.0 and Map will only load with internet
 Check instructions in the Readme file
 */
 
// importing video library
import processing.video.*;

//importing unfolding map library
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

// creating a unfoldingmap object
UnfoldingMap map;

// creating abscract map provide objects to load different providers
AbstractMapProvider googleMap;
AbstractMapProvider oceanMap;
AbstractMapProvider sateliteMap;
AbstractMapProvider NatGeoWorldMap;
AbstractMapProvider TopologicalGeoMapProvider;

//  Simplepoint marker class objects  for each country
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
  
// calling class object movie
Movie myMovie;

int mode = 5;
PFont text;
PShape  rect;

// global array list
ArrayList<Data> DataInfo =  new ArrayList<Data>();

//declaring variable to load img
PImage[] flags = new PImage[10];
String[] flagNames = {
  "usa.png", "chi.png", "jap.jpg", "ger.png", "uk.jpg", "fra.png", "bra.png", "rus.jpg", "ita.png", "ind.png"
};
PImage mapImg, videoImg, barchatAni, barchartImg, mapAni;

// used on the menu sphere to control the rotateX
int[] chanRad = {
  50, 90, 130, 230, 300
};
// used on the  menu sphere 
int rotA = 0;
int rotB = 1;
int rotC = 2;
int rotD = 3;
int rotE = 4;
PShape mapShape;
boolean switchB = false;

void setup()
{
  size(1500, 800, P3D);
  smooth();

  // Different map providers that users can choose
  googleMap =  new Google.GoogleMapProvider(); 
  oceanMap =   new EsriProvider.OceanBasemap(); 
  sateliteMap = new Microsoft.AerialProvider(); 
  NatGeoWorldMap =  new EsriProvider.NatGeoWorldMap(); 
  TopologicalGeoMapProvider  =  new GeoMapApp.TopologicalGeoMapProvider(); 
  map = new UnfoldingMap(this, googleMap);
  MapUtils.createDefaultEventDispatcher(this, map);
  map.zoomToLevel(3);
  map.setZoomRange(3, 20);
  
  //loading image which will be used on the spheres
  mapImg = loadImage("earthpic.jpg"); 
  barchatAni= loadImage("barchatAni.jpg");
  videoImg = loadImage("bestCountries.jpg");
  mapAni = loadImage("mapAni.jpg");
  barchartImg = loadImage("barchartImg.jpg");

  //call map method
  Map();
  
  // creating and adding a textfont "Arial-BoldItalicMT-20.vlw
  text = createFont("Arial-BoldItalicMT-20.vlw", 20);
  textFont(text);
}

// implement marker method
void Map()
{
  float maxmapDistance = 10000;
  
  // calling movie object
  myMovie = new Movie(this, "World.mp4");
  
  // search for the location
  Location usaLocation = new Location(37, -95.71);
  usaMarker = new SimplePointMarker(usaLocation);
  
  // load geoJSON
  List<Feature> Top10Countries =  GeoJSONReader.loadData(this, "top10Countries.json");
  List<Marker> Top10countryMarkers = MapUtils.createSimpleMarkers(Top10Countries);

  // adding map markers 
  map.addMarkers(Top10countryMarkers);
  
  // geting locations of top 10 countries
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

  //Pan restriction
  map.setPanningRestriction(ukLocation, maxmapDistance);

  //add point markers
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

// implement Map animation
void ZoomAn()
{
  map.draw();
  if (frameCount % 120 == 0) {

    map.zoomAndPanTo(Top10Locations[changeLocation], 5);
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

  if (frameCount % 250 == 0) {

    background(0);
    line = loadStrings(lines[changeLocation]);

    // populate classes
    for (int i = 0; i < line.length; i ++)
    {
      Data dataobject = new Data(line[i]);

      //populate array list
      DataInfo.add(dataobject);
    }

    println(changeLocation);

    text(DataInfo.get(changeLocation).year, width/2, height*0.3);

    changeLocation ++;
    if (changeLocation >= lines.length) {
      changeLocation = 0;
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

  for (int i = 0; i < lines.length; i ++)
  {
    // populate classes
    Data dataobject = new Data(lines[i]);

    //populate array list
    DataInfo.add(dataobject);
  }
}

void drawrect()
{ 

  textFont(text);
  float barWidth = (width * 0.7f) / (float)DataInfo.size();
  float border = width *0.1f;
  float windowsRange = width - (width* 0.12);
  float heightRange = height - (height * 0.12);

  float max = 19.9;

  for (int i =0; i < DataInfo.size (); i++)
  {
    fill(#0C027C);
    /*//"i" is the value "0" is the lowest value, "dataInfo" max value then 
     then when i is the min value its gonna find a position on the screen for that value 
     which will be border border = 50  and when i is datainfo it will find a position on 
     on the screen which will be windowsRange. WindowsRange is > 400 ps this is X axe*/

    float x = map(i, 0, DataInfo.size()-1, width*0.12f, width *0.8f);
    println(mouseX, mouseY);
    float y = map(DataInfo.get(i).economy, 0, max, border, height/2);
    float textx = map(i, 0, DataInfo.size()-1, width*0.14, width*0.82);
    float rectwidth = width * 0.08f;
    float recty = height - height * 0.01f;
    float rankingy = height - height * 0.07f;
    float textmap  = map(DataInfo.get(i).economy, 0, max, height *0.65f, height*0.30f);

    // draw rect
    stroke(255);
    rect( x, heightRange, barWidth, -y);
    textAlign(LEFT, LEFT);

    // change color of text if(switchB == true)

    if (switchB == true)
    {
      fill(#FC0313);
    } else {

      fill(255);
      stroke(255);
    }

    // adding text to the screen country names, country economies
    text(DataInfo.get(i).ranking,textx,rankingy);
    text(DataInfo.get(i).country, textx, recty);
    text(nf(DataInfo.get(i).economy, 1, 1), textx, textmap);
    text("GDP in trillions of U.S. dollars.", width*0.40, height*0.2f);
  }
}
// method to implement the map 

void CountriesInfo()
{

  ScreenPosition usaPos = usaMarker.getScreenPosition(map);
  ScreenPosition chnPos = chnMarker.getScreenPosition(map);
  ScreenPosition japPos = japMarker.getScreenPosition(map);
  ScreenPosition gerPos = gerMarker.getScreenPosition(map);
  ScreenPosition ukPos  =  ukMarker.getScreenPosition(map);
  ScreenPosition fraPos = fraMarker.getScreenPosition(map);
  ScreenPosition braPos = braMarker.getScreenPosition(map);
  ScreenPosition rusPos = rusMarker.getScreenPosition(map);
  ScreenPosition itaPos = itaMarker.getScreenPosition(map);
  ScreenPosition indPos = indMarker.getScreenPosition(map);
  ScreenPosition AoceanPos = AoceanMarker.getScreenPosition(map);
  ScreenPosition SouchnPos = SouchnMarker.getScreenPosition(map);
  ScreenPosition canPos  = canMarker.getScreenPosition(map);

  fill(#FC0303);
  
  String Money = "Trillion";
  float xP  = width * 0.12;
  float xY = width * 0.02;
  float iSize = 10;
  float imageSize = width *0.1f;

  // draw circles
  for (int i = 0; i < flags.length; i ++)
  {
    flags[i] = loadImage(flagNames[i]);
  }

  //code to select and load descriptions
  if (mouseX > usaPos.x-iSize && mouseX < usaPos.x+iSize && mouseY > usaPos.y-iSize && mouseY < usaPos.y+iSize )
  {
    textSize(15);
    text("1st\nUSA", usaPos.x+xP, usaPos.y+xY);
  }
  // select  china
  if (mouseX > chnPos.x-iSize && mouseX < chnPos.x+iSize && mouseY > chnPos.y-iSize && mouseY < chnPos.y +iSize )
  {
    textSize(15);
    text("2nd\nCHN", chnPos.x+xP, chnPos.y+xY+10);
  }

  // select  japan 
  if (mouseX > japPos.x-iSize && mouseX < japPos.x+iSize && mouseY > japPos.y-iSize && mouseY < japPos.y +iSize )
  {
    textSize(15);
    text("3rd\n JAP", japPos.x+10, japPos.y+xY+15);
  }

  // select  germany
  if (mouseX > gerPos.x-iSize && mouseX < gerPos.x+iSize && mouseY > gerPos.y-iSize && mouseY < gerPos.y +iSize )
  {
    textSize(15);
    text("4th\nDEU", gerPos.x-xP-xP, gerPos.y-xY);
  }

  // select uk
  if (mouseX > ukPos.x-iSize && mouseX < ukPos.x+iSize && mouseY > ukPos.y-iSize && mouseY < ukPos.y +iSize )
  {
    textSize(15);
    text("5th\nUK", ukPos.x-xP, AoceanPos.y-xY);
  }

  // select france 
  if (mouseX > fraPos.x-iSize && mouseX < fraPos.x+iSize && mouseY > fraPos.y-iSize && mouseY < fraPos.y +iSize )
  {

    textSize(15);
    text("6th\nFRA", fraPos.x-xP, fraPos.y-xY);
  }

  //select brasil
  if (mouseX > braPos.x-iSize && mouseX < braPos.x+iSize && mouseY > braPos.y-iSize && mouseY < braPos.y +iSize )
  {

    textSize(15);
    text("7th\nBR", braPos.x+xP, braPos.y);
  }

  // select ita

  if (mouseX > itaPos.x-iSize && mouseX < itaPos.x+iSize && mouseY > itaPos.y-iSize && mouseY < itaPos.y +iSize )
  {

    textSize(15);
    text("8th\n ITA", itaPos.x-xP, itaPos.y-xY-10);
  }

  //select india
  if (mouseX > indPos.x-iSize && mouseX < indPos.x+iSize && mouseY > indPos.y-iSize && mouseY < indPos.y +iSize )
  {
    textSize(15);
    text("9th\nIND", indPos.x-xP, indPos.y+xY);
  }
  if (mouseX > canPos.x-iSize && mouseX < canPos.x+iSize && mouseY > canPos.y-iSize && mouseY < canPos.y +iSize )
  {
    textSize(15);
    text("10th\nCAN", canPos.x-xP-10, canPos.y+xY+xY);
  }

  //method to top 10 best countries to live in video
}

void loadVideo()
{
  myMovie.play();
  myMovie.read();
  image(myMovie, 0, 0, width, height);
}


void draw()
{

  switch(mode)
  {
  case 0:
    {
      map.draw();
      DataInfo.clear();
      myMovie.stop();
      if (switchB == true)
      {
        loadData();
        drawrect();
        text(DataInfo.get(0).year, width/2, height*0.3);
      }

      CountriesInfo();
      break;
    }// case 0

  case 1:
    {
      DataInfo.clear();
      myMovie.stop(); 
      ZoomAn();
      break;
    }

  case 2:
    {
      background(0);
      DataInfo.clear(); 
      loadVideo();
      break;
    }

  case 3:
    { 
      background(0);
      DataInfo.clear();
      myMovie.stop(); 
      loadData();
      
      text(DataInfo.get(0).year, width/2, height*0.3);
      drawrect();
      break;
    }
    // end switch

  case 4:
    {
      DataInfo.clear();
      myMovie.stop();
      loadAni();
      drawrect();

      break;
    }

  case 5:
    {
      background(0);
      DataInfo.clear();
      myMovie.stop();
      Menu menu = new Menu();
      menu.display();
      break;
    }
  }
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

// method to implement key interactions
void keyPressed()
{

  if (key =='n' || key =='N')
  {
    switchB = !switchB;
  }
  // if statements to change map providers
  if (key =='z' || key == 'Z')
  {
    map.mapDisplay.setProvider(googleMap);
  }
  if (key =='x' ||key == 'X')
  {

    map.mapDisplay.setProvider(sateliteMap);
  }

  if (key =='c' || key =='C')
  {

    map.mapDisplay.setProvider(oceanMap);
  }

  if (key =='v' ||key == 'V')
  {

    map.mapDisplay.setProvider(NatGeoWorldMap);
  }
  if (key =='b' || key =='B')
  {
    map.mapDisplay.setProvider(TopologicalGeoMapProvider);
  }

  // If statement to select e deselect markers
  if (key >= '0' && key <='7')
  {
    mode = key - '0';
  }

  if (key == ' ') {
    map.getDefaultMarkerManager().toggleDrawing();
  }

  // if statement to open different parts of the program ie( world visualisation or barchart)
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

  // if statement to allow user switch from one option to another(from right to left)
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


  // if statement to allow user switch from one option to another(from left to right)
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

