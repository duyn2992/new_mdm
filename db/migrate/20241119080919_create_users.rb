# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :last_name
      t.string :first_name
      t.string :address
      t.string :phone
      t.datetime :birth_date
      t.string :email

      t.timestamps
    end
  end
end
