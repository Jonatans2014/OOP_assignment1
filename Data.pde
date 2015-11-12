class Data
{
    // fields
     int ranking;
     String country;
     float  economy;
     String year;
     color colour;
     
     // constructor
     Data(String line)
     {
        String[] part = line.split(",");
        ranking = parseInt(part[0]);
        country = part[1];
        economy = Float.parseFloat(part[2]);
        year = part[3];
        colour = color(random(0, 255), random(0, 255), random(0, 255));
     }
    
    
  
}
