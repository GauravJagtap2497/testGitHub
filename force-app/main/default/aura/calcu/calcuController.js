({
    
    Init : function(component, event,helper) { 
        var selectedId='';          
        selectedId = event.target.getAttribute('id');
        alert(selectedId);
        component.set('v.searchKeyword', selectedId);
             var action = component.get('c.fetchCons');
         action.setParams({ Accid : component.get("v.searchKeyword"),
                         });
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                var allValues = response.getReturnValue();
                console.log("allValues--->>> " + JSON.stringify(allValues));
                //component.set('v.activeSections', allValues.Name);
                component.set('v.conList', allValues);
            }
            else if(state === "ERROR") {
                var errors = response.getError();
                if(errors){
                    if(errors[0] && errors[0].message){
                        console.log("Error Message: " + errors[0].message);
                    }
                }
                else{
                    console.log("Unknown Error");
                }
            }
        });
        $A.enqueueAction(action);
    }

})