class CreateParticipantes < ActiveRecord::Migration[6.0]
  def change
    create_table :participantes do |t|
      t.string :nome, null: false
      t.string :email, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
