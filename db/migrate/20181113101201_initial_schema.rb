class InitialSchema < ActiveRecord::Migration[5.2]
  def change
    create_table :anime do |t|
      t.text :en_title
      t.text :jp_title
      t.string :type
      t.string :status
      t.integer :score
      t.integer :rating
      t.integer :episode_count
      t.float :episodelength
      t.text :description
      t.string  :picture
      t.date :start_date
      t.date :end_date
      t.integer :kitsu_id
      t.timestamps
    end

    create_table :tags do |t|
      t.string :name
      t.text :description
      t.integer :kitsu_id
      t.integer :count
      t.timestamps
    end

    create_join_table :anime, :tags do |t|
      t.index [:anime_id, :tag_id]
    end
  end
end
