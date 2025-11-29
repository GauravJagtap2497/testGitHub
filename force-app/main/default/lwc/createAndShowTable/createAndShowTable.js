import { LightningElement,track } from 'lwc';
import contactCreate from '@salesforce/apex/createCont.contactCreate';
import contactList from '@salesforce/apex/listContact.contactList';
export default class CreateAndShowTable extends LightningElement {
@track firstName;
@track lastName;
@track contacts;
@track error;

columns=[
{label:'First Name' , fieldName:'FirstName'},
{label:'Last Name', fieldName:'LastName'},
{label:'Email', fieldName:'Email', type:'email'}
];

connectedCallback(){
this.fetchContacts;
}

firstChange(event){
this.firstName=event.target.value;
}
lastChange(event){
this.lastName=event.target.value;
}

onSave(){
contactCreate({firstName:this.firstName,lastName:this.lastName})
.then(()=>{
this.firstName='';
this.lastName='';
this.fetchContacts();
})
.catch(error=>{

})

}

fetchContacts(){
contactList()
.then(result=>{
this.contacts=result;
this.error=undefined;
})
.catch(error=>{
this.error=error;
this.contacts=undefined;
})




}














}