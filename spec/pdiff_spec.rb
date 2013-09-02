require File.expand_path("spec_helper.rb", File.dirname(__FILE__))
require "minitest/autorun"


describe Pdiff do

  describe "#run!" do
  end

  describe "#matches?" do

    it "when images are identical, then it returns true" do
      pdiff = Pdiff::Comparator.new(STATIC_EXAMPLE[:baseline], STATIC_EXAMPLE[:consistent_element])
      pdiff.matches?.must_equal true
    end

    it "when images are different, then it returns false" do
      pdiff = Pdiff::Comparator.new(STATIC_EXAMPLE[:baseline], STATIC_EXAMPLE[:changed_element])
      pdiff.matches?.must_equal false
    end

  end

end