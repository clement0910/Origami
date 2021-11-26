class DeleteWeightFromAnswers < ActiveRecord::Migration[6.0]
  def change
    remove_column :answers, :weight
  end
end
