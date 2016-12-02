class AddDecadeToPin < ActiveRecord::Migration[5.0]
  def change
    add_column :pins, :decade, :string
  end
end
