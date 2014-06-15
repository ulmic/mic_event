class AddAttrToMembers < ActiveRecord::Migration
  def change
    add_column :members, :birthdate, :datetime
    add_column :members, :departament_id, :integer
    add_column :members, :home_adress, :text
    add_column :members, :phone, :text
    add_column :members, :mail_index, :text
  end
end
