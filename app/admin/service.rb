ActiveAdmin.register Service do
	permit_params :name, :description, :avatar

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :created_at
    actions
  end

  filter :name
  filter :description
  filter :created_at

  form do |f|
    f.inputs "Service" do
      f.input :name
      f.input :description
      f.input :avatar, as: :file
    end
    f.actions
  end
end
