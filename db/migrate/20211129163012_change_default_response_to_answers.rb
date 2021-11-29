class ChangeDefaultResponseToAnswers < ActiveRecord::Migration[6.0]
  def change
    change_column_default :answers, :response, nil
  end
end
