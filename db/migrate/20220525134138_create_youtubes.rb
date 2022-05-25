class CreateYoutubes < ActiveRecord::Migration[7.0]
  def change
    create_table :youtubes do |t|
      t.string :link
      t.string :description

      t.timestamps
    end
  end
end
