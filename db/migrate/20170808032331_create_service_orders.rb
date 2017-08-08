class CreateServiceOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :service_orders do |t|

      t.timestamps
    end
  end
end
