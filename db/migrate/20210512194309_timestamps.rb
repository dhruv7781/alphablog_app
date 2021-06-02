class Timestamps < ActiveRecord::Migration[6.1]
  def change
    add_column :article, :created_at, :datetime
    add_column :article, :updated_at, :datetime
  end
end
