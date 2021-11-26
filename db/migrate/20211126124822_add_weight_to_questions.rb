class AddWeightToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :weight, :float
  end
end
