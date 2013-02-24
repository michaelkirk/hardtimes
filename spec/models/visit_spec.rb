require 'spec_helper'

describe Visit do
  describe "#still_at_hardtimes?" do
    context "with a new visit" do
      subject { Visit.new }
      it { should be_true }
    end
  end

end
