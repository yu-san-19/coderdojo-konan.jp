require 'rails_helper'

describe ApplicationHelper do
  describe "full_title" do
    context "when plovided title is nil or empty" do
      it "plovided title is nil" do
        plovided_title = nil
        expect(full_title(plovided_title)).to eq "CoderDojo Konan Okayama Official Site"
      end
      it "plovided title is empty" do
        plovided_title = ""
        expect(full_title(plovided_title)).to eq "CoderDojo Konan Okayama Official Site"
      end
    end
    context "when it is plovided then" do
      it "has plovided title" do
        plovided_title = "Test Page"
        expect(full_title(plovided_title)).to eq "#{plovided_title} | CoderDojo Konan Okayama Official Site"
      end
    end
  end
  describe "Next event url helper" do
    it "is return true url when next event is always planned" do
    end
  end
end