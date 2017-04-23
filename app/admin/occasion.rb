ActiveAdmin.register Occasion do
	permit_params :name, :guest_size
  before_action :cloudinary_upload, only: :create

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

  controller do
    def cloudinary_upload
      cloudinary_hash = Cloudinary::Uploader.upload(params[:occasion][:avatar]) if params[:occasion][:avatar].present?
      byebug
      avatar << cloudinary_hash['public_id']
    end
  end


  form do |f|
    f.inputs "Occasion" do
      f.input :name
      f.input :guest_size
      f.input :avatar, as: :file
    end
    f.actions
  end
end
