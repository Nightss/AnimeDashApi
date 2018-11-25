class InitialSchema < ActiveRecord::Migration[5.2]
  def change
    create_table :anime do |t|
      t.text :en_title
      t.text :jp_title
      t.text :description
      t.string :type
      t.date :start_date
      t.date :end_date
      t.integer :episode_count
      t.binary  :picture
      #will change to string and host images elsewhere
    end

    create_table :tags do |t|
      t.string :name
      t.string :description
      t.integer :count
    end

    create_join_table :anime, :tags do |t|
      t.index [:anime_id, :tag_id]
    end
  end
end
