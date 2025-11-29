import { LightningElement ,track,wire} from 'lwc';
import letestCont from '@salesforce/apex/createCont.letestCont'
import deleteContact from '@salesforce/apex/createCont.deleteContact'
import {ShowToastEvent} from'lightning/platformShowToastEvent';
export default class Dltonecontact extends LightningElement {

@track contacts;
@track error;
@track massage;
@track errormassgae;

    

@wire(letestCont)
letCon({data,error}){
if(data){
    this.contacts=data;
    console.log(data);
    console.log(this.contacts);
    this.error=undefined;

}
else if(error){
this.error=error;
this.contact=undefined;
}
}

deletecontact(){
    deleteContact({contactId:this.contacts.Id})
.then(()=>{
    this.ShowToast('successfully deleted','contact deleted','succcess');
this.massage='contact have been deleted successfully';
this.contacts='';
})
.catch(error=>{
    this.ShowToast('cant delete contact',this.error,'error');
this.errormassgae='there is error while deleting contct';
})



}
ShowToast(title,massage,variant){
this.dispatchEvent(
new ShowToastEvent({
title,
massage,
variant

})

);
}









}