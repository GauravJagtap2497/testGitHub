import { LightningElement,track } from 'lwc';
import fetchAccount from '@salesforce/apex/intigrationTest.fetchAccount'
export default class SearchAccInt extends LightningElement {

@track Accounts=[];
error;
@track NameSearch='';
columns=[
    {label:'Account Name', fieldName:'Name'},
    {label:'Id', fieldName:'Id'}
];


onNameChange(event){
    this.NameSearch=event.target.value;
    if(this.NameSearch.length>2){
        this.fetchAcc();
    }
    else{
        this.Accounts=[];
    }
    
}
fetchAcc(){
    fetchAccount({searchKey:this.NameSearch})
.then(result=>{
this.Accounts=result;
this.error=undefined;
})
.catch(error=>{
this.error=error;
this.Accounts=undefined;
})


}










}