class ServiceOrderLookupController < ApplicationController
  def index
    @service_order = ServiceOrder.new(params[:service_order]) if params[:service_order].present?
  end
end
