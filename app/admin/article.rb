ActiveAdmin.register Article do

  index do
    selectable_column
    id_column
    column :title
    column :description
    column :created_at
    actions
  end

  filter :title
  filter :description
  filter :created_at

  controller do
    def create
      article = Article.new(article_params)
      cloudinary_avatar_upload(article) if params[:article][:avatar].present?
      article.save
      redirect_to admin_articles_path
    end

    private

    def cloudinary_avatar_upload(article)
      cloudinary_hash = Cloudinary::Uploader.upload(params[:article][:avatar])
      article.avatar << cloudinary_hash['public_id']
    end

    def article_params
      params.require(:article).permit(:title, :description)
    end
  end


  form do |f|
    f.inputs "article" do
      f.input :title
      f.input :description
      f.input :avatar, as: :file
    end
    f.actions
  end
end
