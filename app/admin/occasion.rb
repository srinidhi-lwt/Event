ActiveAdmin.register Occasion do

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
    def create
      occasion = Occasion.new(occasion_params)
      cloudinary_avatar_upload(occasion) if params[:occasion][:avatar].present?
      occasion.save
      redirect_to admin_occasions_path
    end

    private

    def cloudinary_avatar_upload(occasion)
      cloudinary_hash = Cloudinary::Uploader.upload(params[:occasion][:avatar])
      occasion.avatar << cloudinary_hash['public_id']
    end

    def occasion_params
      params.require(:occasion).permit(:name, :guest_size)
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
