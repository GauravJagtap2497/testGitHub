public class car {
 public static void partsmethod(){
     List<Integer> ls1 = new List<Integer>();
ls1.add(1);
ls1.add(2);
// Create a list based on an existing one
List<Integer> ls2 = new List<Integer>(ls1);
// ls2 elements are copied from ls1
System.debug(ls2);// DEBUG|(1, 2)
    boolean b= ls1.equals(ls2);
     system.debug(b);
    integer a= ls2.size();
     system.debug(a);
     for(integer i=0;i<a;i++){
         ls2.add(i);
     }
     system.debug(ls2);
         }
  
        
        
        }