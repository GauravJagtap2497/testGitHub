public class dateclass {
    
    public static void datemethod(){
        date nowdays=date.newInstance(1920,2,12);  //date variable
        system.debug(nowdays);
        date newdate=nowdays.addDays(5);           //to add days
        system.debug('newdate'+newdate);
        date newdatewithmonth=newdate.addMonths(4);          //to add months
        system.debug('newdatewithmonth'+newdatewithmonth);
        date newdatewithyear=newdatewithmonth.addYears(5);       // to add years
        system.debug('newdatewithyear'+newdatewithyear);
        integer days=newdatewithyear.day();                  // to know day
        system.debug('days'+days);
        integer dayofyears=newdatewithyear.dayOfYear();           // to know day of year
        system.debug('dayofyears'+dayofyears);               
        integer daysbetween=newdatewithyear.daysBetween(newdate);   // to know days in between 
        system.debug('daysbetween'+daysbetween);             
        string foramted=newdatewithyear.format();              // to change format
        system.debug('formated'+foramted);
        string datestring='2022-2-2';
        date stringtodate=date.valueOf(datestring);                                 // to change string to date
        system.debug('datestring'+stringtodate);
      
        
        
    }

}