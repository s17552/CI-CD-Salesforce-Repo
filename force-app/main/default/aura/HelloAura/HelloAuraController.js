({
    calculate: function (component, event, helper) {
        component.set('v.age', new Date().getFullYear() - component.get('v.birthdate').split('-')[0]);
    }
});