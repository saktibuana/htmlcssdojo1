class AddIncidentDateToHistories < ActiveRecord::Migration[7.0]
  def change
  	add_column :histories, :incident_date, :date 
  	add_column :histories, :image, :string
  end
end
