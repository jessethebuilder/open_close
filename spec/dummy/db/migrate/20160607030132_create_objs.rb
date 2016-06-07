class CreateObjs < ActiveRecord::Migration
  def change
    create_table :objs do |t|

      t.timestamps null: false
    end
  end
end
