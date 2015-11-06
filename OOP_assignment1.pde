void setup()
{
    size(500,500);
    background(0);
    smooth();
    stroke(255);
    
    border = width *0.1f;
    windowRange = width - border;
    y1 = height-border;
    MidScreen = height/2;
    HigherScreen = border*2;
    LowerScreen = width - (border *2);
    mapx = windowRange/Countries.length;
    
    line(border,height-border,width-border,height-border);
    
    
      // calling loadstring function
     loadString();
     
     
}

  float x1,x2,y1,y2;
  float border;
  float windowRange;
  float MidScreen ;
  float LowerScreen;
  String[] Countries = {"Can","Ita","Br","Indi","Fran","Uk","Ger","Jap","Chi","Usa"};
  String[] CountriesV = {"1.6","1.8","1.9","2.3","2.5","2.9","3.4","4.2","11.2","18.1"};
  float mapx;
  float HigherScreen ;
// This method is to load the string
void loadString()
{
  
   float maxValue;
   float MinValue;
   // this will load the csv file
  String[]EconomyRanking = loadStrings("Economies.csv");  
   
  // this create an array list
  ArrayList<Float> ecoRanking = new ArrayList<Float>();
  
  //pass data to an array list and convert from string to float
  
  for(String s:EconomyRanking)
  {
    float f = Float.parseFloat(s);
    ecoRanking.add(f);
    
  } 
  
  for(int i = 0 ; i < 10; i ++)
  {
    println("this is ECORRANKING " + ecoRanking.get(i));
  }
  
      // calling maxV function
      maxValue = maxV(ecoRanking);
      println("this is maXv " +maxValue);
     
      // Calling min value function
      
      MinValue = MinV(ecoRanking);
      println("this is minV" +MinValue);
     
      //calling drawgraph functions
      drawgraph(ecoRanking,maxValue,MinValue);
      
      
      
      
}



void drawgraph(ArrayList<Float>eRank,float minV, float maxV)
{
  
    for(int i = 0; i <eRank.size(); i++)
    {
        x1 = map( i,0,eRank.size()-1,windowRange,border);
        y2 = map(eRank.get(i),minV,maxV,HigherScreen,LowerScreen );      
        
        stroke(#FF0000);
        line(x1,y1,x1,y2);
        text(Countries[i],x1,470);
        text(CountriesV[i],x1,border);
        
       println("this is eRANK" + eRank.get(i));
    }
    
    
      
      
   
}


// this is a function to find the max value of the data set.
float maxV(ArrayList<Float>Max)
{  
    float Mv = Max.get(0);
    
    
    for(int i = 0; i < Max.size(); i++)
    {
        if(Max.get(i) > Mv)
        {
            Mv = Max.get(i);
        }
      
    }
        
        
       return Mv;

}// end MaxV



// this is a function to find the mmin value of the data set.
float MinV(ArrayList<Float>Min)
{  
    float Minv = Min.get(0);
    
    
    for(int i = 0; i < Min.size(); i++)
    {
        if(Min.get(i) < Minv)
        {
            Minv = Min.get(i);
        }
      
    }
        
        
       return Minv;

}// end MaxV


void draw()
{
    println(mouseX);   
}




