class CreateDestinos < ActiveRecord::Migration[6.0]
  def change
    create_table :destinos do |t|
      t.string :nome, null: false, index: { unique: true }
      t.string :descricao, null: false

      t.timestamps
    end
  end
end
