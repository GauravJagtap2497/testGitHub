import { LightningElement,track } from 'lwc';
import contactCreate from '@salesforce/apex/createCont.contactCreate';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class CreateContact extends LightningElement {

@track firstName='';
@track lastName='';

firstChange(event){
this.firstName=event.target.value;
}
lastchange(event){
this.lastName=event.target.value;
}



    onsavemethod(){
        contactCreate({firstName:this.firstName,lastName:this.lastName})
        .then(()=>{

        })
        .catch(error=>{

        })


 




    }





}