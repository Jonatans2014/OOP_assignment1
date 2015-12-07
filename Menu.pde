class Menu 
{

  // fields
  int sphereSize;
  float x, y;
  float textx, texty, stextx;
  float titlex;
  float titley;
  
  // using two constructors one with default values and another parametirised 
  Menu()
  {
    sphereSize= 40;
    x = -300;
    y = 0;
    textx = -90;
    texty = 100;
    stextx = -50;

    titlex = width  * 0.2;
    titley  = height * 0.1;
  }
  
  Menu(int sphereSize, int x, int y)
  {
    this.sphereSize = sphereSize;
    this.x = x;
    this.y = y;
  }


  void display()
  {

    lights();
    //noStroke();
    int changeRot;

   //arial-BoldItalicMT-15.vlw
    textFont(text);
    
    translate(width/2, height/2);
    
    //sphere 1
    pushMatrix();
    rotateY(radians(chanRad[rotA]));
    mapShape = createShape(SPHERE, sphereSize);
    mapShape.setTexture(mapImg);
    shape(mapShape, x, y);
    noStroke();
    rotateX((radians(frameCount/2)));
    sphereDetail(50);
    popMatrix();

    // sphere 2
    pushMatrix();
    rotateY(radians(chanRad[rotB]));
    mapShape = createShape(SPHERE, sphereSize);
    mapShape.setTexture(mapAni);
    shape(mapShape, x, y);
    noStroke();
    rotateX((radians(frameCount/2)));
    sphereDetail(50);
    popMatrix();


    // sphere 3

    pushMatrix();
    rotateY(radians(chanRad[rotC]));
    mapShape = createShape(SPHERE, sphereSize);
    mapShape.setTexture(videoImg);
    shape(mapShape, x, y);
    noStroke();
    rotateX((radians(frameCount/2)));
    sphereDetail(50);
    popMatrix();

    // sphere 4

    pushMatrix();
    rotateY(radians(chanRad[rotD]));
    mapShape = createShape(SPHERE, sphereSize);
    mapShape.setTexture(barchartImg);
    shape(mapShape, x, y);
    noStroke();
    rotateX((radians(frameCount /2)));
    sphereDetail(50);
    popMatrix();


    // SPHERE 5
    pushMatrix();
    rotateY(radians(chanRad[rotE]));
    mapShape = createShape(SPHERE, sphereSize);
    mapShape.setTexture(barchatAni);
    shape(mapShape, x, y);
    noStroke();
    rotateX((radians(frameCount/2)));
    sphereDetail(50);
    popMatrix();



    // add text to menu
    fill(255);
    textSize(15);
    if (chanRad[rotA] == chanRad[1])
    {

      text("WORLD MAP VISUALIZATION", textx, texty);
    }

    if (chanRad[rotB] == chanRad[1])
    {

      text("  WORLD ANIMATON", textx, texty);
    }
    if (chanRad[rotC] == chanRad[1])
    {

      text("BEST COUNTRIES TO LIVE IN", textx, texty);
    }
    if (chanRad[rotD] == chanRad[1])
    {


      text("BARCHART 2015", stextx, 100);
    }

    if (chanRad[rotE] == chanRad[1])
    {


      text("BARCHART ANIMATION", stextx-20, 100);
    }
  }
}

