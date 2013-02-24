# == Schema Information
#
# Table name: visits
#
#  id           :integer          not null, primary key
#  visitor_name :string(255)
#  arrived_at   :datetime
#  left_at      :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'spec_helper'

describe Visit do
  describe "#still_at_hardtimes?" do
    context "with a new visit" do
      subject { Visit.new }
      it { should be_true }
    end
  end

end
