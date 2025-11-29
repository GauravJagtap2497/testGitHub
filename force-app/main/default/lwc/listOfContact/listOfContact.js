import { LightningElement,wire } from 'lwc';
import contactList from'@salesforce/apex/listContact.contactList';
export default class ListOfContact extends LightningElement {
contacts;
error;

@wire(contactList)
wireContactList({error,data}){
if(data){
this.contacts=data;
this.error=undefined;
}
else if(error){
this.error=error;
this.contacts=undefined;
}
}












}