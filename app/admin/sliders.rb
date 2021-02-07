ActiveAdmin.register Slider do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :slogan, :img, :img_file_name, :img_content_type, :img_file_size, :img_updated_at
  #
  # or
  #
  # permit_params do
  #   permitted = [:slogan, :img_file_name, :img_content_type, :img_file_size, :img_updated_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    f.inputs "Project Details" do
      f.input :img, required: false, as: :file
      # Will preview the image when the object is edited
    end
    f.actions
  end

  show do |ad|
    attributes_table do
      row :slogan
      row :img do
        image_tag(ad.img.url(:thumb))
      end
      # Will display the image on show object page
    end
  end
end

