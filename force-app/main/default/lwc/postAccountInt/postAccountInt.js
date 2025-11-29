import { LightningElement,track } from 'lwc';
import postAccount from'@salesforce/apex/postAccountClass.postAccount';
export default class PostAccountInt extends LightningElement {

@track Name='';
@track phone='';
@track error;


onFirstNameChange(event){
this.Name=event.target.value;
}
onPhoneChange(event){
this.phone=event.target.value;
}

buttonclick(){
    postAccount({accName:this.Name,accPhone:this.phone})
.then(()=>{

} )
.catch(error =>{

})

    

}




}