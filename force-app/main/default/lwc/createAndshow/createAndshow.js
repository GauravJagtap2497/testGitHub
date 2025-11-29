import { LightningElement,track } from 'lwc';
import contactCreate from '@salesforce/apex/createCont.contactCreate';
import contactList from '@salesforce/apex/listContact.contactList';
export default class CreateAndshow extends LightningElement {
@track firstName;
@track lastName;
@track contacts;
@track error;

connectedCallback(){
    this.fetchcontact();
}
firstchange(event){
this.firstName=event.target.value;
}
lastchange(event){
this.lastName=event.target.value;
}
onSave(){
contactCreate({firstName:this.firstName,lastName:this.lastName})
.then(() =>{
    this.firstName='';
    this.lastName='';
    this.fetchcontact();
    console.log('im in contact ');
})
.catch(error =>{
})
}
fetchcontact(){
    contactList()
    .then(result=>{
        console.log('Fetched contacts:', result);
this.contacts=result;
this.error=undefined;
    })
    .catch(error=>{
this.error=error;
this.contacts=undefined;
    })

}















}