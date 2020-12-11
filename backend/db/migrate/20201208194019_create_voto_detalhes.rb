class CreateVotoDetalhes < ActiveRecord::Migration[6.0]
  def change
    create_table :voto_detalhes do |t|
      t.references :voto, null: false, foreign_key: true
      t.references :destino, null: false, foreign_key: true
      t.index [:voto_id, :destino_id], unique: true

      t.timestamps
    end
  end
end
