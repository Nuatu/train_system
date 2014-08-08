require 'spec_helper'

describe "Line" do
    it "initializes with a name" do
      new_line = Line.new({"name" => "fun line"})
      expect(new_line).to be_an_instance_of Line
  end
end
