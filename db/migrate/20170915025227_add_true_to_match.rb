class AddTrueToMatch < ActiveRecord::Migration[5.1]
  def change
    change_column :matches, :request, 'boolean USING CAST(request AS boolean)'
    change_column :matches, :adoption, 'boolean USING CAST(adoption AS boolean)'

  end
end
