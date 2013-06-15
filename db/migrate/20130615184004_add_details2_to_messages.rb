class AddDetails2ToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :tweet_id, :decimal, :precision => 18, :scale => 0
  end
end
