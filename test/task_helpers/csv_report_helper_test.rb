require 'test_helper'
require "task_helpers/csv_report_helper"

class CsvReportHelperTest < ActiveSupport::TestCase
  setup do
    @helper = CsvReportHelper.new
  end

  test "generates the csv string" do
    expected_string =<<-STRING
Architect 2,apn two,2017,2345 6th street,city 2,22222,family 2,type 2,status 2,source 2,notes 2,
Architect 1,apn one,2016,1234 5th street,city 1,11111,family 1,type 1,status 1,source 1,notes 1,https://goo.gl/maps/GsCn9EsoTK22
Architect 1,apn three,2016,1234 6th street,city 1,11111,family 1,type 1,status 1,source 1,notes 1,gsv 1
  STRING
    assert_equal expected_string, @helper.csv_string
  end
end
