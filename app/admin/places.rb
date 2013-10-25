ActiveAdmin.register Place do
  index do
    column :description
    column :title
  end
  form do |f|
    f.inputs "Details" do
      f.input :title
      f.input :description
    end
    f.actions
  end
end
