class AddWeightToQuestions < ActiveRecord::Migration[6.0]
  def change
    def change
      add_column :questions, :weight, :decimal, precision: 3, scale: 3
    end
  end
end
