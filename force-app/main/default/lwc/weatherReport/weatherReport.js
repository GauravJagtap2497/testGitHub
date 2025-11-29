import { LightningElement,track} from 'lwc';
import weatherReportOne from'@salesforce/apex/weatherReport.weatherReportOne';
export default class WeatherReport extends LightningElement {

@track cityName;
@track WeatherResponse;
@track error;


cityNameChange(event){
this.cityName=event.target.value;

}
fetchWeather() {
    this.error = null;
    this.WeatherResponse = null;

    if (!this.cityName) {
        this.error = 'Please enter a city name.';
        return;
    }
}
getWeather(){
    weatherReportOne({cityName:this.cityName})
    .then(result=>{
this.WeatherResponse=result;
this.error=undefined;

    })
    .catch(error=>{
        this.error=error;
        this.WeatherResponse=undefined;

    })  
}











}