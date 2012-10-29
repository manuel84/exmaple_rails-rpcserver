class CreateRpcResponses < ActiveRecord::Migration
  def change
    create_table :rpc_responses do |t|
      t.text :request
      t.string :methodName
      t.text :params
      t.text :response

      t.timestamps
    end
  end
end
