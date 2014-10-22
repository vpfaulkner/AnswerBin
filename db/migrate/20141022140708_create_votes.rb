class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user
      t.integer :value
      t.references :answer

      t.timestamps
    end
  end
end
