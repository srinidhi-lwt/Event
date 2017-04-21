ActiveAdmin.register Occasion do
	permit_params :name, :guest_size, :avatar

  index do
    selectable_column
    id_column
    column :name
    column :guest_size
    column :created_at
    actions
  end

  filter :name
  filter :guest_size
  filter :created_at

  form do |f|
    f.inputs "Occasion" do
      f.input :name
      f.input :guest_size
      f.input :avatar, as: :file
    end
    f.actions
  end
end
