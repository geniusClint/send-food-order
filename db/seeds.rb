# frozen_string_literal: true

def setup_countries!
  if Country.count == 0
    [
      { name: "United States of America", code: "USA" },
    ].each { |country| Country.create(country) }
  end
end


def setup_states!
  usa = Country.find_by(code: "USA")

  if State.count == 0
    [
      { code: "AA", name: "Armed Forces Americas (except Canada)", country: usa },
        { code: "AE", name: "Armed Forces Africa, Canada, Europe, Middle East", country: usa },
        { code: "AK", name: "Alaska", country: usa },
        { code: "AL", name: "Alabama", country: usa },
        { code: "AP", name: "Armed Forces Pacific", country: usa },
        { code: "AR", name: "Arkansas", country: usa },
        { code: "AS", name: "American Samoa", country: usa },
        { code: "AZ", name: "Arizona", country: usa },
        { code: "CA", name: "California", country: usa },
        { code: "CO", name: "Colorado", country: usa },
        { code: "CT", name: "Connecticut", country: usa },
        { code: "DC", name: "District Of Columbia", country: usa },
        { code: "DE", name: "Delaware", country: usa },
        { code: "FL", name: "Florida", country: usa },
        { code: "FM", name: "Federated States Of Micronesia", country: usa },
        { code: "GA", name: "Georgia", country: usa },
        { code: "GU", name: "Guam", country: usa },
        { code: "HI", name: "Hawaii", country: usa },
        { code: "IA", name: "Iowa", country: usa },
        { code: "ID", name: "Idaho", country: usa },
        { code: "IL", name: "Illinois", country: usa },
        { code: "IN", name: "Indiana", country: usa },
        { code: "KS", name: "Kansas", country: usa },
        { code: "KY", name: "Kentucky", country: usa },
        { code: "LA", name: "Louisiana", country: usa },
        { code: "MA", name: "Massachusetts", country: usa },
        { code: "MD", name: "Maryland", country: usa },
        { code: "ME", name: "Maine", country: usa },
        { code: "MH", name: "Marshall Islands", country: usa },
        { code: "MI", name: "Michigan", country: usa },
        { code: "MN", name: "Minnesota", country: usa },
        { code: "MO", name: "Missouri", country: usa },
        { code: "MP", name: "Northern Mariana Islands", country: usa },
        { code: "MS", name: "Mississippi", country: usa },
        { code: "MT", name: "Montana", country: usa },
        { code: "NC", name: "North Carolina", country: usa },
        { code: "ND", name: "North Dakota", country: usa },
        { code: "NE", name: "Nebraska", country: usa },
        { code: "NH", name: "New Hampshire", country: usa },
        { code: "NJ", name: "New Jersey", country: usa },
        { code: "NM", name: "New Mexico", country: usa },
        { code: "NV", name: "Nevada", country: usa },
        { code: "NY", name: "New York", country: usa },
        { code: "OH", name: "Ohio", country: usa },
        { code: "OK", name: "Oklahoma", country: usa },
        { code: "OR", name: "Oregon", country: usa },
        { code: "PA", name: "Pennsylvania", country: usa },
        { code: "PR", name: "Puerto Rico", country: usa },
        { code: "PW", name: "Palau", country: usa },
        { code: "RI", name: "Rhode Island", country: usa },
        { code: "SC", name: "South Carolina", country: usa },
        { code: "SD", name: "South Dakota", country: usa },
        { code: "TN", name: "Tennessee", country: usa },
        { code: "TX", name: "Texas", country: usa },
        { code: "UT", name: "Utah", country: usa },
        { code: "VA", name: "Virginia", country: usa },
        { code: "VI", name: "Virgin Islands", country: usa },
        { code: "VT", name: "Vermont", country: usa },
        { code: "WA", name: "Washington", country: usa },
        { code: "WI", name: "Wisconsin", country: usa },
        { code: "WV", name: "West Virginia", country: usa },
        { code: "WY", name: "Wyoming", country: usa }
    ].each { |state| State.create(state) }
  end
end

puts ">> Creating countries."
setup_countries!

puts ">> Creating states."
setup_states!
