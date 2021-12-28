({
	handleSubmit : function(component, event, helper) {
		event.preventDefault();
        window.alert("Submitting");
	},

    doInit : function (component, event, helper){
    	let action = component.get("c.getAllLeads");
    
	    action.setCallback(this, function(response){
    		var state = response.getState();

            if(state === 'SUCCESS'){
             	console.log(response.getReturnValue());
            }else {
                console.log(response.getReturnValue());
            }
		});
		$A.enqueueAction(action);		
	}
})