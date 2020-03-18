class AddWorkflowStateToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :workflow_state, :string
  end
end
