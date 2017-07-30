require "csv"

namespace :starting_data do
  desc "TODO"
  task import: :environment do
    CSV.foreach("buildings.csv", headers: true) do |row|
      architect = row[0]
      apn = row[1]
      year = row[2]
      address1 = row[3]
      city = row[4]
      zip  = row[5]
      family = row[6]
      type = row[7]
      status = row[8]
      source = row[9]
      notes  = row[10]
      gsv    = row[11]
      key    = row[12]

      building = Building.create(
        architect: Architect.find_or_create_by(name: architect),
        apn: apn,
        year: year,
        address1: address1,
        city: city,
        zip: zip,
        family: family,
        building_type: type,
        status: status,
        source: source,
        notes: notes,
        gsv: gsv,
        key: key
      )
      p building
    end
  end
end
