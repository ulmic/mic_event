ActiveAdmin.register Event do
  index do
    selectable_column
    column :title
    column :description
    column :begin_datetime
    column :end_datetime
    column :member
    column :place
  end
  form do |f|
    f.inputs "Details" do
      f.input :title
      f.input :description
      f.input :begin_datetime
      f.input :end_datetime
      f.input :member
      f.input :place
    end
    f.actions
  end
end
