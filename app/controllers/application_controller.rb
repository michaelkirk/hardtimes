class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter do
    @visitor_name ||= request.subdomain
  end
end
