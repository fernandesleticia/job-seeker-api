class CreateVacancies < ActiveRecord::Migration[6.0]
  def change
    create_table :vacancies do |t|
      t.integer :partnerId
      t.string :title
      t.integer :categoryId
      t.date :expiresAt
      t.string :status

      t.timestamps
    end
  end
end
