class CreateProviders < ActiveRecord::Migration[7.0]
  def change
    create_table :providers do |t|
      t.string  :source_name, :null => false, index: {unique: true}
      t.string :logo_link
      t.string :website_link
      t.string :data_use_agreement_link
      t.integer :dataset_available, default: 0
      t.string :short_site_description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
