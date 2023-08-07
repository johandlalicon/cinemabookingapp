import { Controller } from "@hotwired/stimulus";
import { get, put } from "@rails/request.js";

export default class extends Controller {
  static targets = ["selectTimeslot"];
  change(event) {
    let cinema = event.target.selectedOptions[0].value;
    let target = this.selectTimeslotTarget.id;
    console.log(cinema);
    get(`/admin/screenings/timeslots?target=${target}&cinema=${cinema}`, {
      responseKind: "turbo-stream",
    });
  }
}
