class RemoveStatusFromComments < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :status, :string
  end
end
