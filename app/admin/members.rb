ActiveAdmin.register Member do
  index do
    selectable_column
    column :first_name
    column :middle_name
    column :number
    column :email
    column :password
  end
  form do |f|
    f.inputs "Details" do
      f.input :first_name
      f.input :middle_name
      f.input :last_name
      f.input :number
      f.input :email
      f.input :password
    end
    f.actions
  end
end
