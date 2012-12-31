class Visit < ActiveRecord::Base
  attr_accessible :arrived_at, :left_at, :visitor_name

  scope :for_visitor_name, lambda { |visitor_name| where(visitor_name: visitor_name.downcase) }

  def still_at_hard_times?
    !self.arrived_at.nil? && self.left_at.nil?
  end

  def leave
    self.left_at = Time.now
  end
end
