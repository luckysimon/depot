class CreatePaymentTypes < ActiveRecord::Migration[5.0]
  def up
    create_table :payment_types do |t|
      t.string :name
      t.timestamps
    end
    # Create sample payment_types
    ["Check","Credit Card","Purchase Order"].each do |name|
      PaymentType.create(name:name)
    end
    # Update old order type
    Order.all.each do |order|
      order.pay_type= order.pay_type +1
      order.save
    end
    rename_column :orders,:pay_type,:payment_type_id
  end

  def down
    rename_column :orders,:payment_type_id,:pay_type
    Order.all.each do |order|
      order.pay_type= order.pay_type -1
      order.save
    end
    drop_table :payment_types
  end
end
