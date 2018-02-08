class AddInfluencerToLists < ActiveRecord::Migration[5.1]
  def change
    add_reference :lists, :influencer, foreign_key: true
  end
end
