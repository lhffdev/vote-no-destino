class CreateVotos < ActiveRecord::Migration[6.0]
  def change
    create_table :votos do |t|
      t.references :participante, null: false, foreign_key: true

      t.timestamps
    end
  end
end
