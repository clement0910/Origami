class AddWeightToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :weight, :decimal, precision: 3, scale: 3
  end
end
