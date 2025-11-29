public class parents extends child {
      
    public  void xyz(integer x){
    abc();
        integer y=super.x+x;
        system.debug(y);
}
    // method overriding
    public override void display(){// use override keyword
        system.debug('i am from parents');
        super.display();// to call child display method
    }
   
}