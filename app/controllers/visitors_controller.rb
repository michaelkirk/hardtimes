class VisitorsController < ApplicationController
  def search
    redirect_to root_url(:subdomain => params[:visitor_name])
  end

  def index
    @current_visits = Visit.current
  end

  def show
    @visitor_name = params[:visitor_name] || request.subdomain
    @visit = Visit.for_visitor_name(@visitor_name).last

    if(@visit.nil? or !@visit.still_at_hard_times?)
      render :not_at_hard_times
    else
      render :at_hard_times
    end
  end

  def arrive
    @visitor_name = params[:visitor_name] || request.subdomain
    @visit = Visit.for_visitor_name(@visitor_name).create!(arrived_at: Time.now)
    redirect_to root_url(:subdomain => @visitor_name)
  end

  def leave
    @visitor_name = params[:visitor_name] || request.subdomain
    @visit = Visit.for_visitor_name(@visitor_name).last
    raise Error.new("A person not at hardtimes can't leave hardtimes.") if @visit.nil?

    @visit.leave
    @visit.save!
    redirect_to root_url(:subdomain => @visitor_name)
  end
end
