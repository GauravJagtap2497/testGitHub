import { LightningElement ,wire,track} from 'lwc';
import contactList from '@salesforce/apex/listContact.contactList'
import dltContact from '@salesforce/apex/listContact.dltContact'
import { refreshApex } from '@salesforce/apex';
export default class DltContactRow extends LightningElement {

@track contact;
 error;
@track wireResult;


@wire(contactList)
contactget(result){
    this.wireResult=result;
const {data,error}=result;
if(data){
this.contact=data;
this.error=undefined;
}
if(error){
this.error=this.error;
this.contact=undefined;
}
}

handledelete(event){
 let contactId=event.target.dataset.id;
 console.log('this is con Id'+contactId);

dltContact({contactId:contactId})
.then(()=>{
    console.log('contact deleted successfully');
return refreshApex(this.wireResult);
})
.catch(error=>{

})
}



}