require "rails_helper"
require "rspec-rails"

describe Image do
  fixtures :images
  fixtures :buildings
  let(:image) { images(:one) }
  let(:building) { buildings(:one) }

  describe "#path_for_size" do

    it "returns the matching size" do
      allow(File).to receive(:exist?).and_return(true)
      expected_path = "/uploads/images/buildings/#{building.id}/x500_screenshot_27.png"
      expect(image.path_for_size(500)).to eq expected_path
    end

    it "returns the original filename if the size doesn't exist" do
      allow(File).to receive(:exist?).and_return(false)
      expected_path = "/uploads/images/buildings/#{building.id}/screenshot_27.png"
      expect(image.path_for_size(500)).to eq expected_path
    end
  end

  describe "#image_dir" do
    it "returns the image dir seen by the browser" do
      expect(image.image_dir).to eq "/uploads/images/buildings/#{image.building_id}"
    end
  end

  describe "#uploaded_image_path" do
    it "returns the image dir seen by the browser" do
      expect(image.uploaded_image_path).to eq "#{Rails.root}/public/uploads/images/buildings/#{image.building_id}"
    end
  end
end
