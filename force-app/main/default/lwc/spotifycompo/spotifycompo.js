import { LightningElement } from 'lwc';
import spotifysearch from '@salesforce/apex/SpotifyClass.spotifysearch';
export default class Spotifycompo extends LightningElement {
trackName;

error;


handleInputChange(event) {
    this.trackName = event.target.value;
}
async searchMethod(){
    try{
        let result = await spotifysearch({

        });
        let response=JASON.parse(result);
        console.log(response);
    }
    catch(error){
        this.error = error;
    }
}
   

}