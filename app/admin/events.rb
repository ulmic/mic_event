ActiveAdmin.register Event do
  index do
    selectable_column
    column :title
    column :description
    column :event_time
    column :member
    column :place
  end
  form do |f|
    f.inputs "Details" do
      f.input :title
      f.input :description
      f.input :event_time
      f.input :member
      f.input :place
    end
    f.actions
  end
end
