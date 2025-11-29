import { LightningElement ,track,wire} from 'lwc';
import contactList from '@salesforce/apex/listContact.contactList'
import dltbulk from '@salesforce/apex/listContact.dltbulk'
import { refreshApex} from '@salesforce/apex'
export default class BulkConDlt extends LightningElement {
@track contact;
error;
@track wireResult;
@track bulkcontactId=[];


@wire(contactList)
wireResult(result){
this.wireResult=result;
const{data,error} = result;
if(data){
    console.log('thise data'+data);
this.contact=data;
this.error=undefined;
}
else if(error){
this.error=error;
this.contact=undefined;
}
}

handleCheckboxChange(event){
const contactId=event.target.dataset.id;
if(event.target.checked){
this.bulkcontactId.push(contactId);
console.log('bulkcontactuD'+this.bulkcontactId);
}
else{

}
}
handleDeleteSelected(){
if(this.bulkcontactId.length===0){
return;
}
dltbulk({conIds:this.bulkcontactId})
.then(()=>{
refreshApex(this.wireResult);
this.bulkcontactId=[];

})
.catch(error=>{

})


}




















}