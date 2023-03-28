import { LightningElement, api, wire } from 'lwc';
import getWetherForComponent from '@salesforce/apex/WerherController2.getWetherForComponent';


export default class WetherComponent extends LightningElement{
     @api recordId;

     @wire(getWetherForComponent,{userId: '$recordId'})wetherForComponent;

}