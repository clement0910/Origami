class DeleteWeightFromQuestions < ActiveRecord::Migration[6.0]
  def change
    remove_column :questions, :weight
  end
end
