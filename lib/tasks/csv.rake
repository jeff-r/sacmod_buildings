require "csv"
require "task_helpers/csv_report_helper"

namespace :csv do
  desc "Export data as csv"
  task export: :environment do
    puts CsvReportHelper.new.csv_string
  end
end
