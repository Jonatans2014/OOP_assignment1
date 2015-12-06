class Data
{
    // fields
     String ranking;
     String country;
     float  economy;
     String year;
     
     // constructor
     Data(String line)
     {
        String[] part = line.split(",");
        ranking = part[0];
        country = part[1];
        economy = Float.parseFloat(part[2]);
        year = part[3];
     }
    
    
  
}
