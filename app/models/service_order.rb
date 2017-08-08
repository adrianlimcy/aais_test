class ServiceOrder < ApplicationRecord
  attr_reader :service_no, :item_no, :serial_no, :service_type,
  :so_status, :cust_no, :name, :charge_cust, :primary_con,
  :primary_phon, :fax_modem, :cust_po, :cust_release, :cust_ref,
  :address1, :address2, :city, :country, :zip, :description1,
  :description2, :location1, :location2, :location3, :location4,
  :terr_code, :entity_code, :via_desc, :department, :whs_code,
  :contract_no, :contract_lin, :priority, :entry_date, :entry_time


  def initialize(service_order)
    # Gyoku.convert_symbols_to :camelcase
    client = Savon.client(wsdl: "http://172.28.62.144:22808/wsa/rspwsa/wsdl?targetURI=urn:advanceservice")
    response = client.call(:aai_service, message: { AUserID: ENV["AAIS_USER"], AEntity: ENV["AENTITY"], ServiceName: ENV["SERVICENAME"], ParameterList: service_order})
    if response.success?
      data = response.to_array(:aai_service_response, :aai_service_result, :new_data_set, :table).first
      if data
        @service_no = data[:service_no]
        @item_no = data[:item_no]
        @serial_no = data[:serial_no]
        @service_type = data[:service_type]
        @so_status = data[:so_status]
        @cust_no = data[:cust_no]
        @name = data[:name]
        @charge_cust = data[:charge_cust]
        @primary_con = data[:primary_con]
        @primary_phon = data[:primary_phon]
        @fax_modem = data[:fax_modem]
        @cust_po = data[:cust_po]
        @cust_release = data[:cust_release]
        @cust_ref = data [:cust_ref]
        @address1 =  data [:address1]
        @address2 = data[:address2]
        @city = data[:city]
        @country = data[:country]
        @zip = data[:zip]
        @description1 =  data[:description1]
        @description2 = data[:description2]
        @location1 = data[:location1]
        @location2 = data[:location2]
        @location3 = data[:location3]
        @location4 = data[:location4]
        @terr_code = data[:terr_code]
        @entity_code = data[:entity_code]
        @via_desc = data[:via_desc]
        @department = data[:department]
        @whs_code = data[:whs_code]
        @contract_no = data[:contract_no]
        @contract_lin = data[:contract_lin]
        @priority = data[:priority]
        @entry_date = data[:entry_date]
        @entry_time = data[:entry_time]
      end
    end
  end


end
