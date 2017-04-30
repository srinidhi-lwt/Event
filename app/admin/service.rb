ActiveAdmin.register Service do
  
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

  controller do
    def create
      service = Service.new(service_params)
      cloudinary_avatar_upload(service) if params[:service][:avatar].present?
      service.save
      redirect_to admin_services_path
    end

    private

    def cloudinary_avatar_upload(service)
      cloudinary_hash = Cloudinary::Uploader.upload(params[:service][:avatar])
      service.avatar << cloudinary_hash['public_id']
    end

    def service_params
      params.require(:service).permit(:name, :description)
    end
  end

  form do |f|
    f.inputs "Service" do
      f.input :name
      f.input :description
      f.input :avatar, as: :file
    end
    f.actions
  end
end