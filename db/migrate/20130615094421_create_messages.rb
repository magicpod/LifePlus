class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :content
      t.datetime :notice_date
      t.boolean :noticed

      t.timestamps
    end
  end
end
