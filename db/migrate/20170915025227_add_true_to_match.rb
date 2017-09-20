class AddTrueToMatch < ActiveRecord::Migration[5.1]
  def change
    change_column :matches, :request, :boolean
    change_column :matches, :adoption, :boolean

  end
end
