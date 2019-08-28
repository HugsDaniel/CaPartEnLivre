class AddPosterToSeries < ActiveRecord::Migration[5.2]
  def change
    add_column :series, :poster, :string
  end
end
