ActiveAdmin.register Post do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :content, :url, :description, :image, :active, :seo_key, :seo_title, :seo_desc, :seo_alt, :img_file_name, :img_content_type, :img_file_size, :img_updated_at


  show do
    attributes_table do
      row :title
      row :description
      row :content
      row :active
      row :text do |i|
        image_tag i.image.url
      end
    end
  end


  form do |f|
    f.inputs do
      f.input :title
      f.input :content
      f.input :url
      f.input :description
      f.check_box :active
      f.inputs "Upload" do
        f.input :image, required: true, as: :file
      end
    end
    f.actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :url, :description, :image, :active, :seo_key, :seo_title, :seo_desc, :seo_alt, :img_file_name, :img_content_type, :img_file_size, :img_updated_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
