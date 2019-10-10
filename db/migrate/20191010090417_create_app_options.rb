class CreateAppOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :app_options do |t|
      t.string :option_name
      t.string :option_value

      t.timestamps
    end
  end
end
