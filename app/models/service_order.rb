class ServiceOrder < ApplicationRecord
  attr_reader :service_no, :item_no, :serial_no, :service_type,
  :so_status, :cust_no, :name, :charge_cust, :primary_con,
  :primary_phon, :fax_modem, :cust_po, :cust_release, :cust_ref,
  :address1, :address2, :city, :st, :country, :zip, :description1,
  :description2, :location1, :location2, :location3, :location4,
  :terr_code, :entity_code, :via_desc, :department, :whs_code,
  :contract_no, :contract_lin, :priority, :entry_date, :entry_time,
  :request_date, :request_time,:parts, :consumables, :labour,
  :travel, :expense, :sales, :pst_amount, :parts_pcnt, :consum_pcnt,
  :labour_pcnt, :travel_pcnt, :expense_pcnt, :d_parts, :d_consumables,
  :d_labour, :d_travel, :d_expense, :d_tot_bill, :d_tot_price, :parts_cst,
  :consum_cst, :labour_cst, :travel_cst, :expense_cst, :sales_cst, :ship_charge,
  :price_level, :order_disc, :order_no, :term_code, :slsmn_code, :comm_code,
  :comm_rate, :tax_code, :pst_exempt, :pst_license, :invoice_no, :invoice_date,
  :d_inv_total, :user_id, :terminal_no, :dt_last_mode, :tm_last_mode, :usr_last_mode,
  :second_con, :second_phone, :printed, :county, :alt_ref, :currency_code,
  :record_type, :delv_team, :sch_date, :release_date, :release_time, :edeli_date,
  :edeli_time_slot, :sch_time, :fms_status, :printerid, :order_source, :inv_not_mail,
  :c_customer_grading, :c_credit_limit, :c_disable_fms, :tech_code,
  :manager, :problem_code, :problem_code_2, :cause_code, :repair_code,
  :related_so, :parent_so, :c_call_avoid_dt, :c_call_avoid_tm, :tele_date,
  :tele_time, :dispatch_dt, :dispatch_tm, :arrive_date, :arrive_time,
  :complete_dt, :complete_tm, :close_date, :close_time, :escalate_dt,
  :escalate_tm, :escalate_lvl, :est_time, :actual_time, :travel_time,
  :bill_time, :per_call_min, :per_call_max, :time_zone, :billing_cap,
  :notify_date, :notify_time, :tech_notify, :eta_date, :eta_time,
  :call_phoned, :response, :cover_holiday, :start_time, :end_time,
  :cover_days1, :cover_days2, :cover_days3, :cover_days4, :cover_days5,
  :cover_days6, :cover_days7, :prim_phone_ext_no, :fax_ext_no, :pri_phon_area_cd,
  :supply_cst, :supply_pcnt, :memo_source, :memo_code, :line_no,
  :memo_type, :memo_text, :memo_dt_last_mode, :memo_tm_last_mode,
  :memo_user_last_mode


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
        @request_date = search_data.xpath("//Request-date").first.children.first.to_s
        @request_time = search_data.xpath("//Request-time").first.children.first.to_s
        @parts = search_data.xpath("//Parts").first.children.first.to_s
        @consumables = search_data.xpath("//Consumables").first.children.first.to_s
        @labour = search_data.xpath("//Labour").first.children.first.to_s
        @travel = search_data.xpath("//Travel").first.children.first.to_s
        @expense = search_data.xpath("//Expense").first.children.first.to_s
        @sales = search_data.xpath("//Sales").first.children.first.to_s
        @pst_amount = search_data.xpath("//Pst-amount").first.children.first.to_s
        @parts_pcnt = search_data.xpath("//Parts-pcnt").first.children.first.to_s
        @consum_pcnt = search_data.xpath("//Consum-pcnt").first.children.first.to_s
        @labour_pcnt = search_data.xpath("//Labour-pcnt").first.children.first.to_s
        @travel_pcnt = search_data.xpath("//Travel-pcnt").first.children.first.to_s
        @expense_pcnt = search_data.xpath("//Expense-pcnt").first.children.first.to_s
        @d_parts = search_data.xpath("//dParts").first.children.first.to_s
        @d_consumables = search_data.xpath("//dConsumables").first.children.first.to_s
        @d_labour = search_data.xpath("//dLabour").first.children.first.to_s
        @d_travel = search_data.xpath("//dTravel").first.children.first.to_s
        @d_expense = search_data.xpath("//dExpense").first.children.first.to_s
        @d_tot_bill = search_data.xpath("//dTotBill").first.children.first.to_s
        @d_tot_price = search_data.xpath("//dTotPrice").first.children.first.to_s
        @parts_cst = search_data.xpath("//Parts-cst").first.children.first.to_s
        @consum_cst = search_data.xpath("//Consum-cst").first.children.first.to_s
        @labour_cst = search_data.xpath("//Labour-cst").first.children.first.to_s
        @travel_cst = search_data.xpath("//Travel-cst").first.children.first.to_s
        @expense_cst = search_data.xpath("//Expense-cst").first.children.first.to_s
        @sales_cst = search_data.xpath("//Sales-cst").first.children.first.to_s
        @ship_charge = search_data.xpath("//Ship-charge").first.children.first.to_s
        @price_level = search_data.xpath("//Price-level").first.children.first.to_s
        @order_disc = search_data.xpath("//Order-disc").first.children.first.to_s
        @order_no = search_data.xpath("//Order-no").first.children.first.to_s
        @term_code = search_data.xpath("//Term-code").first.children.first.to_s
        @slsmn_code = search_data.xpath("//Slsmn-code").first.children.first.to_s
        @comm_code = search_data.xpath("//Comm-code").first.children.first.to_s
        @comm_rate = search_data.xpath("//Comm-rate").first.children.first.to_s
        @tax_code = search_data.xpath("//Tax-code").first.children.first.to_s
        @pst_exempt = search_data.xpath("//Pst-exempt").first.children.first.to_s
        @pst_license = search_data.xpath("//Pst-license").first.children.first.to_s
        @invoice_no = search_data.xpath("//Invoice-no").first.children.first.to_s
        @invoice_date = search_data.xpath("//Invoice-date").first.children.first.to_s
        @d_inv_total = search_data.xpath("//dInvTotal").first.children.first.to_s
        @user_id = search_data.xpath("//User-id").first.children.first.to_s
        @terminal_no = search_data.xpath("//Terminal-no").first.children.first.to_s
        @dt_last_mode = search_data.xpath("//Dt-last-mod").first.children.first.to_s
        @tm_last_mode = search_data.xpath("//Tm-last-mod").first.children.first.to_s
        @usr_last_mode = search_data.xpath("//Usr-last-mod").first.children.first.to_s
        @second_con = search_data.xpath("//Second-con").first.children.first.to_s
        @second_phone = search_data.xpath("//Second-phone").first.children.first.to_s
        @printed = search_data.xpath("//Printed").first.children.first.to_s
        @county = search_data.xpath("//County").first.children.first.to_s
        @alt_ref = search_data.xpath("//Alt-ref").first.children.first.to_s
        @currency_code = search_data.xpath("//Currency-cod").first.children.first.to_s
        @record_type = search_data.xpath("//Record-type").first.children.first.to_s
        @delv_team = search_data.xpath("//Delv-team").first.children.first.to_s
        @sch_date = search_data.xpath("//Sch-date").first.children.first.to_s
        @release_date = search_data.xpath("//release-date").first.children.first.to_s
        @release_time = search_data.xpath("//release-time").first.children.first.to_s
        @edeli_date = search_data.xpath("//edeli_date").first.children.first.to_s
        @edeli_time_slot = search_data.xpath("//edeli_time_slot").first.children.first.to_s
        @sch_time = search_data.xpath("//sch_time").first.children.first.to_s
        @fms_status = search_data.xpath("//fms_status").first.children.first.to_s
        @printerid = search_data.xpath("//printerid").first.children.first.to_s
        @order_source = search_data.xpath("//Order_Source").first.children.first.to_s
        @inv_not_mail = search_data.xpath("//Inv_not_mail").first.children.first.to_s
        @c_customer_grading = search_data.xpath("//cCustomerGrading").first.children.first.to_s
        @c_credit_limit = search_data.xpath("//cCreditLimit").first.children.first.to_s
        @c_disable_fms = search_data.xpath("//cDisableFMS").first.children.first.to_s
        @tech_code = search_data.xpath("//Tech-code").first.children.first.to_s
        @manager = search_data.xpath("//Manager").first.children.first.to_s
        @problem_code = search_data.xpath("//Problem-code").first.children.first.to_s
        @problem_code_2 = search_data.xpath("//Problem-cod2").first.children.first.to_s
        @cause_code = search_data.xpath("//Cause-code").first.children.first.to_s
        @repair_code = search_data.xpath("//Repair-code").first.children.first.to_s
        @related_so = search_data.xpath("//Related-SO").first.children.first.to_s
        @parent_so = search_data.xpath("//Parent-SO").first.children.first.to_s
        @c_call_avoid_dt = search_data.xpath("//cCall-Avoid-dt").first.children.first.to_s
        @c_call_avoid_tm = search_data.xpath("//cCall-Avoid-tm").first.children.first.to_s
        @tele_date = search_data.xpath("//Tele-date").first.children.first.to_s
        @tele_time = search_data.xpath("//Tele-time").first.children.first.to_s
        @dispatch_dt = search_data.xpath("//Dispatch-dt").first.children.first.to_s
        @dispatch_tm = search_data.xpath("//Dispatch-tm").first.children.first.to_s
        @arrive_date = search_data.xpath("//Arrive-date").first.children.first.to_s
        @arrive_time = search_data.xpath("//Arrive-time").first.children.first.to_s
        @complete_dt = search_data.xpath("//Complete-dt").first.children.first.to_s
        @complete_tm = search_data.xpath("//Complete-tm").first.children.first.to_s
        @close_date = search_data.xpath("//Close-date").first.children.first.to_s
        @close_time = search_data.xpath("//Close-time").first.children.first.to_s
        @escalate_dt = search_data.xpath("//Escalate-dt").first.children.first.to_s
        @escalate_tm = search_data.xpath("//Escalate-tm").first.children.first.to_s
        @escalate_lvl = search_data.xpath("//Escalate-lvl").first.children.first.to_s
        @est_time = search_data.xpath("//Est-time").first.children.first.to_s
        @actual_time = search_data.xpath("//Actual-time").first.children.first.to_s
        @travel_time = search_data.xpath("//Travel-time").first.children.first.to_s
        @bill_time = search_data.xpath("//Bill-time").first.children.first.to_s
        @per_call_min = search_data.xpath("//Per-call-min").first.children.first.to_s
        @per_call_max = search_data.xpath("//Per-call-max").first.children.first.to_s
        @time_zone = search_data.xpath("//Time-zone").first.children.first.to_s
        @billing_cap = search_data.xpath("//Billing-cap").first.children.first.to_s
        @notify_date = search_data.xpath("//Notify-date").first.children.first.to_s
        @notify_time = search_data.xpath("//Notify-time").first.children.first.to_s
        @tech_notify = search_data.xpath("//Tech-notify").first.children.first.to_s
        @eta_date = search_data.xpath("//ETA-date").first.children.first.to_s
        @eta_time = search_data.xpath("//ETA-time").first.children.first.to_s
        @call_phoned = search_data.xpath("//call-phoned").first.children.first.to_s
        @response = search_data.xpath("//Response").first.children.first.to_s
        @cover_holiday = search_data.xpath("//Cover-holidy").first.children.first.to_s
        @start_time = search_data.xpath("//Start-time").first.children.first.to_s
        @end_time = search_data.xpath("//End-time").first.children.first.to_s
        @cover_days1 = search_data.xpath("//Cover-days1").first.children.first.to_s
        @cover_days2 = search_data.xpath("//Cover-days2").first.children.first.to_s
        @cover_days3 = search_data.xpath("//Cover-days3").first.children.first.to_s
        @cover_days4 = search_data.xpath("//Cover-days4").first.children.first.to_s
        @cover_days5 = search_data.xpath("//Cover-days5").first.children.first.to_s
        @cover_days6 = search_data.xpath("//Cover-days6").first.children.first.to_s
        @cover_days7 = search_data.xpath("//Cover-days7").first.children.first.to_s
        @prim_phone_ext_no = search_data.xpath("//pri_phon_ext_no").first.children.first.to_s
        @fax_ext_no = search_data.xpath("//fax_ext_no").first.children.first.to_s
        @pri_phon_area_cd = search_data.xpath("//pri_phon_area_cd").first.children.first.to_s
        @supply_cst = search_data.xpath("//supply_cst").first.children.first.to_s
        @supply_pcnt = search_data.xpath("//supply_pcnt").first.children.first.to_s

        @memo_source = search_data.xpath("//Memo-source").children.to_s
        @memo_code = search_data.xpath("//Memo-code").children.to_s

        @line_no = search_data.xpath("//Line-no").children.to_s

        @memo_type = search_data.xpath("//Memo-type").children.to_s

        @memo_text = search_data.xpath("//Memo-Text").children.to_s

        @memo_dt_last_mode = search_data.xpath("//ServiceMemo//Dt-last-mod").first.children.first.to_s
        @memo_tm_last_mode = search_data.xpath("//ServiceMemo//Tm-last-mod").first.children.first.to_s
        @memo_user_last_mode = search_data.xpath("//ServiceMemo//Usr-last-mod").first.children.first.to_s
      end
    end
  end


end
