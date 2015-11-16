// global array list
int mode = 1;
PFont text;

PShape  rect;
ArrayList<Data> DataInfo =  new ArrayList<Data>();
color [] colarray = { 
  color(#FFFFFF), color(220, 200, 85), 
  color(185, 65, 200), color(0, 145, 35), color(245, 35, 200)
};
//declaring variable to load img
PImage[] flags = new PImage[10];
String[] flagNames = {
  "usa.png",  "chi.png", "jap.jpg", "ger.png","uk.jpg", "fra.png", "bra.png","rus.jpg" , "ita.png","ind.png"
};

void setup()
{

  size(500, 500, P3D);
  background(255);
  smooth();
  // load image
   loadData();
  text = createFont("Arial-BoldItalicMT-20.vlw", 20);

  textFont(text);
}



// load data
void loadData()
{
   int changeYear= 0;
   
  // this line of code gonna load the data called gdp
  String[] lines =  loadStrings("Economies.csv");
 
  String[] lines3 = loadStrings("Economies2017.csv");
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

    fill(0);
    stroke(#4B4B50);
    float textmap  = map(DataInfo.get(i).economy, min, max, 350, 150);
    textAlign(LEFT);
    text(DataInfo.get(i).country, x, windowsRange + recty);

    text(nf(DataInfo.get(i).economy, 1, 1), x, textmap);

    flags[i] = loadImage(flagNames[i]);



    // code to do the roll over and load flag

    if (mouseX > x && mouseX < x +barWidth && mouseY > height/2 && mouseY < windowsRange)
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

      textSize(20);
      text(DataInfo.get(i).year, x, 65);
      
      println("hey tell me somethi right not  " +mouseY);
    }
      
     
    
  }
  
  


}





void draw()
{
  background(255);
  
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
