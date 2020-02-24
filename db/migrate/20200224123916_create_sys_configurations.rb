class CreateSysConfigurations < ActiveRecord::Migration[5.2]
  def change
    create_table :sys_configurations do |t|
      t.string :name
      t.string :initials

      t.timestamps
    end
  end
end
