({
    
 fetchAccount : function(component, event) {
  
        var action = component.get("c.fetchAccts");
        
        action.setCallback(this, function(response) {
            
            var state = response.getState();
            
            if (state === "SUCCESS") {
                
                var records = response.getReturnValue();
                records.forEach(function(record) {
                    
                    record.linkName = '/' + record.Id;
                    record.CheckBool = false;
                    
                });   
                
                component.set("v.acctList", records);
                
            }            
            
        });
        
        $A.enqueueAction(action);
        
 }
    
})