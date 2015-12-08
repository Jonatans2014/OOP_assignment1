class Drawrect
{
  // fields
  float barWidth ;
  float border ;
  float windowsRange;
  float heightRange;
  float max;

  // default constructor
  Drawrect(float max)
  {
    barWidth = (width * 0.7f) / (float)DataInfo.size();
    border = width *0.1f;
    windowsRange = width - (width* 0.12);
    heightRange = height - (height * 0.12);
    this.max = max;
  }

  // parametirised constructor that enables developers to enter data
  Drawrect(float barWidth, float border, float windowsRange, float heightRange, float max)
  {
    this.barWidth = barWidth;
    this.border = border;
    this.windowsRange = windowsRange;
    this.heightRange = heightRange;
    this.max = max;
  }

  // method to implement the barchart
  void display()
  { 

    for (int i =0; i < DataInfo.size (); i++)
    {
      fill(#0C027C);
      /*"i" is the value "0" is the lowest value, "dataInfo" max value then 
       then when i is the min value its gonna find a position on the screen for that value 
       which will be border border = 50  and when i is datainfo it will find a position on 
       on the screen which will be windowsRange. WindowsRange is > 400 ps this is X axe*/

      float x = map(i, 0, DataInfo.size()-1, width*0.12f, width *0.8f);
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
      text("GDP in trillions of U.S. dollars.", width*0.45, height*0.2f);
      text(DataInfo.get(i).ranking, textx, rankingy);
      text(DataInfo.get(i).country, textx, recty);
      text(nf(DataInfo.get(i).economy, 1, 1), textx, textmap);
    }
  }
}

