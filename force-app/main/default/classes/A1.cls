public class A1 {
    public A1(){// default constructor
        system.debug('i am in constructor A1');
             }
    public A1(string A){//parameterised constructor
        system.debug('i am in constructor A1 WITH parameter');
    }
    public A1 ( string word, boolean flag){// two diffrent parameters
        system.debug('2 parameter constructors');
    }
    // this keyword
    Integer X=100;
    public void abcstring(Integer X){// local veriable
        X=(new A1().X)+X;
        system.debug(X);
        }
// access specifier
     
    
    public void a(){
        
    }
}