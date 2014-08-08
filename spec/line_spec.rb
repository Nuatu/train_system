require 'spec_helper'

describe "Line" do

  it "initializes with a name" do
    new_line = Line.new({"name" => "fun line"})
    expect(new_line).to be_an_instance_of Line
  end

  describe '.all' do
    it 'pulls all lines from the DB and returns them as objects' do
      expect(Line.all).to eq []
    end
  end

  describe 'save' do
    it 'saves new lines ' do
      new_line = Line.new({"name" => "fun line"})
      new_line.save
      expect(Line.all.length).to eq 1
    end
  end
end
