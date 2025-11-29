import { LightningElement } from 'lwc';

export default class HelloUser extends LightningElement {

 name='';




    handleonchange(event){
this.name=event.target.value;
    }

/*Because LWC is reactive, updating this.name automatically refreshes the DOM.
| Concept                   | Description                                                                                     |
| ------------------------- | ----------------------------------------------------------------------------------------------- |
| `value={}` binding        | Binds input to a JS variable.                                                                   |
| `onchange` handler        | Calls a function when user input changes.                                                       |
| Reactive UI               | When `this.name` changes, the UI updates automatically.                                         |
| Lightning Base Components | Such as `lightning-card` and `lightning-input`, which make things look good without custom CSS. |
*/

}