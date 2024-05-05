import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="address"
export default class extends Controller {

  static targets = ['address1', 'address2', 'suite', 'city', 'state', 'zip', 'latitude', 'longitude']


  connect() {
    if (typeof (google) != "undefined") {
      this.initAutocomplete()
    }
  }

  initAutocomplete() {
    this.autocomplete = new google.maps.places.Autocomplete(this.address1Target, {
      componentRestrictions: { country: "us" },
      fields: ['address_components', 'geometry'],
      types: ['address']
    })
    this.address1Target.focus();
    this.autocomplete.addListener('place_changed', this.fillInAddress.bind(this))
  }

  fillInAddress() {
    const place = this.autocomplete.getPlace()
    console.log(place)
    for (const component of place.address_components) {
      const componentType = component.types[0]

      switch (componentType) {
        case "street_number":
          this.address1Target.value = component.long_name + " "
          break
        case "route":
          this.address1Target.value += component.long_name
          break
        case "locality":
          this.cityTarget.value = component.long_name
          break
        case "administrative_area_level_1":
          let sel = this.stateTarget.firstElementChild
          for (var i = 0; i < sel.options.length; i++) {
            if (sel.options[i].text == component.long_name) {
              sel.options[i].selected = true
              break
            }
          }
          break
        case "postal_code":
          this.zipTarget.value = component.long_name
          break
        case "postal_code_suffix":
          this.zipTarget.value += "-" + component.long_name
          break
      }
    }
    this.latitudeTarget.value = place.geometry.location.lat()
    this.longitudeTarget.value = place.geometry.location.lng()
    // After filling the form with address components from the Autocomplete
    // prediction, set cursor focus on the second address line to encourage
    // entry of subpremise information such as apartment, unit, or floor number.
    this.address2Target.focus();
  }

  keydown(event) {
    if (event.key == "Enter") {
      event.preventDefault()
    }
  }
}
