class AddColumnStatusTpFitGroupsAsString < ActiveRecord::Migration[5.2]
  def change
    add_column :fit_groups, :status, :string
  end
end
