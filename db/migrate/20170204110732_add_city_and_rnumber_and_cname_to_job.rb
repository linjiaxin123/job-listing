class AddCityAndRnumberAndCnameToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :place, :string
    add_column :jobs, :company_name, :string
    add_column :jobs, :recruitment_number, :integer
  end
end
