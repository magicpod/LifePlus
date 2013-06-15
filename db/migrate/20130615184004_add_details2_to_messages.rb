class AddDetails2ToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :tweet_id, :integer
  end
end
