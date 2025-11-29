import { LightningElement } from 'lwc';
import { wire } from "lwc";
import { track } from "lwc";
import searchAcc from '@salesforce/apex/SearchAccountController.searchAcc';
columns = [
    { label: 'Account Name', fieldName: 'Name', type: 'text' },
    { label: 'Industry', fieldName: 'Industry', type: 'text' },
    { label: 'Type', fieldName: 'Type', type: 'text' }
];

export default class SearchAcc extends LightningElement {
   @track accName;
    accounts;
    columns = columns;
    rowOffset = 0;
    draftValues = [];
    

handleInputChange(event) {
    this.accName = event.target.value;
}
@wire(searchAcc, { searchacc: '$accName' })
accounts;

}