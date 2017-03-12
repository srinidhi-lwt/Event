ActiveAdmin.register Package do
	permit_params :name, :service_id, :occasion_id

  index do
    selectable_column
    id_column
    column :name
    column :service_id
    column :occasion_id
    column :user_id
    column :created_at
    actions
  end

  filter :name
  filter :service_id
  filter :occasion_id
  filter :created_at

  form do |f|
    f.inputs "Package" do
      f.input :name
      f.input :service_id, as: :select, collection: Service.all, prompt: 'Please choose the Service'
      f.input :occasion_id, as: :select, collection: Occasion.all, prompt: 'Please choose the Occasion'
    end
    f.actions
  end
end