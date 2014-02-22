class CreateQuests < ActiveRecord::Migration
  def change
    create_table :quests do |t|
      t.string :question
      t.string :option_a
      t.string :option_b
      t.string :option_c
      t.string :option_d
      t.string :answer

      t.timestamps
    end
  end
end
