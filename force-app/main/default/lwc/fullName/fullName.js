import { LightningElement } from 'lwc';

export default class FullName extends LightningElement {
    firstName='';
    lastName='';


    firstNameChange(event){
this.firstName=event.target.value;
    }

    lastNameChange(event){
this.lastName=event.target.value;
    }

get fullName(){
    const full=`${this.firstName} ${this.lastName}`.trim();
    return full?full:null;
}
/*| Concept              | What It Does                                                              |
| -------------------- | ------------------------------------------------------------------------- |
| `lightning-input`    | Built-in base component for input fields                                  |
| `onchange` handler   | Captures user input                                                       |
| Reactive properties  | Automatically update the UI when data changes                             |
| `get` function       | Computes derived values (like full name) dynamically                      |
| `<template if:true>` | Conditionally renders part of the template (only when value is non-empty) |

*/




}