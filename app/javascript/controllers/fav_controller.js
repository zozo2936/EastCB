// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus";
import ax from "helpers/ax";

export default class extends Controller {
  static targets = ["icon"];

  connect() {}

  toggle(evt) {
    evt.preventDefault();

    let id = this.data.get("id");
    let icon = this.iconTarget;
    let button = evt.currentTarget;

    button.classList.add("is-loading");

    ax.post(`/api/books/${id}/favorite`)
      .then(function(response) {
        let favorited = response.data.favorited;

        if (favorited) {
          icon.classList.remove("far");
          icon.classList.add("fas");
        } else {
          icon.classList.remove("fas");
          icon.classList.add("far");
        }
      })
      .catch(function(error) {
        console.log(error);
        if (error.response.status === 401) {
          alert("請先登入會員");
        } else {
          alert("發生錯誤，請稍後再試");
        }
      })
      .finally(function() {
        button.classList.remove("is-loading");
      });
  }
}
