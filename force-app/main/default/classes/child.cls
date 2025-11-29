public  virtual  class child {
     public integer x=100;
    public  void abc(){
      system.debug('i am in the abc method');
    }
    // method overriding
     public virtual void display(){// use virtual keyword
        system.debug('i am from child');
    }
    

}