class ServiceOrder < ApplicationRecord
  attr_reader :service_no, :item_no, :serial_no, :service_type,
  :so_status, :cust_no, :name, :charge_cust, :primary_con,
  :primary_phon, :fax_modem, :cust_po, :cust_release, :cust_ref,
  :address1, :address2, :city, :st, :country, :zip, :description1,
  :description2, :location1, :location2, :location3, :location4,
  :terr_code, :entity_code, :via_desc, :department, :whs_code,
  :contract_no, :contract_lin, :priority, :entry_date, :entry_time


  def initialize(service_order)
    client = Savon.client(wsdl: "http://172.28.62.144:22808/wsa/rspwsa/wsdl?targetURI=urn:advanceservice")

    response = client.call(:aai_service, message: { plcIContext: '
      <dsContext xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
      <ttContext>
      <ContextName>AUserID</ContextName>
      <ContextValue>'+ENV["AAIS_USER"]+'</ContextValue>
      </ttContext>
      <ttContext>
      <ContextName>AEntity</ContextName>
    	<ContextValue>'+ENV["AENTITY"]+'</ContextValue>
      </ttContext>
      <ttContext>
      <ContextName>ServiceName</ContextName>
      <ContextValue>'+ENV["SERVICENAME"]+'</ContextValue>
      </ttContext>
      <ttContext>
    	<ContextName>ParameterList</ContextName>
    	<ContextValue>'+service_order+'</ContextValue>
      </ttContext>
      </dsContext>' })

    if response.success?
      data = response.to_hash[:aai_service_response][:plc_ob_entity]
      search_data = Nokogiri::XML(data)
      if data
        @service_no = search_data.xpath("//Service-no").first.children.first.to_s
        @item_no = search_data.xpath("//Item-no").first.children.first.to_s
        @serial_no = search_data.xpath("//Serial-no").first.children.first.to_s
        @service_type = search_data.xpath("//Service-type").first.children.first.to_s
        @so_status = search_data.xpath("//SO-status").first.children.first.to_s
        @cust_no = search_data.xpath("//Cust-no").first.children.first.to_s
        @name = search_data.xpath("//Name").first.children.first.to_s
        @charge_cust = search_data.xpath("//Charge-cust").first.children.first.to_s
        @primary_con = search_data.xpath("//Primary-con").first.children.first.to_s
        @primary_phon = search_data.xpath("//Primary-phon").first.children.first.to_s
        @fax_modem = search_data.xpath("//Fax-modem").first.children.first.to_s
        @cust_po = search_data.xpath("//Cust-po").first.children.first.to_s
        @cust_release = search_data.xpath("//Cust-release").first.children.first.to_s
        @cust_ref = search_data.xpath("//Cust-ref").first.children.first.to_s
        @address1 = search_data.xpath("//Address1").first.children.first.to_s
        @address2 = search_data.xpath("//Address2").first.children.first.to_s
        @city = search_data.xpath("//City").first.children.first.to_s
        @st = search_data.xpath("//St").first.children.first.to_s
        @country = search_data.xpath("//Country").first.children.first.to_s
        @zip = search_data.xpath("//Zip").first.children.first.to_s
        @description1 =  search_data.xpath("//Description1").first.children.first.to_s
        @description2 = search_data.xpath("//Description2").first.children.first.to_s
        @location1 = search_data.xpath("//Location1").first.children.first.to_s
        @location2 = search_data.xpath("//Location2").first.children.first.to_s
        @location3 = search_data.xpath("//Location3").first.children.first.to_s
        @location4 = search_data.xpath("//Location4").first.children.first.to_s
        @terr_code = search_data.xpath("//Terr-code").first.children.first.to_s
        @entity_code = search_data.xpath("//Entity-code").first.children.first.to_s
        @via_desc = search_data.xpath("//Via-desc").first.children.first.to_s
        @department = search_data.xpath("//Department").first.children.first.to_s
        @whs_code = search_data.xpath("//Whs-code").first.children.first.to_s
        @contract_no = search_data.xpath("//Contract-no").first.children.first.to_s
        @contract_lin = search_data.xpath("//Contract-lin").first.children.first.to_s
        @priority = search_data.xpath("//Priority").first.children.first.to_s
        @entry_date = search_data.xpath("//Entry-date").first.children.first.to_s
        @entry_time = search_data.xpath("//Entry-time").first.children.first.to_s
      end
    end
  end


end
