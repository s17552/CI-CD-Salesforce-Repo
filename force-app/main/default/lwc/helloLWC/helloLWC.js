import {LightningElement, track, api} from 'lwc';

export default class HelloLwc extends LightningElement {
    @track firstName;
    @track birthdate;
    @track age;
    handleChange(event) {
        this.firstName = event.target.value;
    }
    handleDateChange(event) {
        this.birthdate = event.target.value
    }
    calculate() {
        this.age = new Date().getFullYear() - this.birthdate.split('-')[0];
    }
}