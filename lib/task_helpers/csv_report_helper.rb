require "csv"

class CsvReportHelper
  def csv_string
    string = CSV.generate do |csv|
      Architect.all.each do |architect|
        architect.buildings.all.each do |building|
          csv << [
            architect.name,
            building.apn,
            building.year,
            building.address1,
            building.city,
            building.zip,
            building.family,
            building.building_type,
            building.status,
            building.source,
            building.notes,
            building.gsv
          ]
        end
      end
    end
    string.encode("UTF-8")
  end
end
