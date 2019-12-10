// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"
import ax from "helpers/ax";

export default class extends Controller {
  static targets = [ "icon" ]

  connect(){
  }

  toggle(evt){
    evt.preventDefault();

    ax.post('/api/books/2/favorite',{})
         .then(function(response) {
           console.log(response.data);
         })
         .catch(function(error) {
           console.log(error);
         })
  }
}

