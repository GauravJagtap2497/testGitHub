public class QueryContact {
  public static Id getContactID(String lastName, String title) {
    try {
      Contact myContact = Database.query(
        'SELECT ID FROM Contact WHERE lastName = :lastName AND title = :title LIMIT 1'
      );
      return myContact.Id;
    } catch (Exception ex) {
      return null;
    }
  }
  public static Id getContactIDWithBinds(Map<String, Object> bindVars) {
    //do not modify any code above this line
    //implement the logic that will use bindVars to retrieve the contact's ID
      string query = 'SELECT ID FROM Contact WHERE lastName = :lastName AND title = :title LIMIT 1';
      list <Contact> con = Database.querywithBinds(query,bindVars,Accesslevel.USER_MODE);
      if(con !=null && !con.isempty()){
          return con[0].Id;
      }
      else{
          return null;
      }
    
  } 
}