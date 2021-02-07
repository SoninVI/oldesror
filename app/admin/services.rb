ActiveAdmin.register Service do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :text, :img, :img_file_name, :img_content_type, :img_file_size, :img_updated_at, :position, :ancestry, 
                :slug
  #
  # or
  #
  # permit_params do
  #   permitted = [:text, :img, :img_file_name, :img_content_type, :img_file_size, :img_updated_at, :position, :ancestry]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  sortable tree: true,
           sorting_attribute: :position


  index as: :sortable do
    label :img do |ad|
      image_tag(ad.img.url(:thumb))
    end
    actions
  end

  form do |f|
    f.inputs "Project Details" do
      f.input :text
      f.input :slug
      f.input :img, required: false, as: :file
      # Will preview the image when the object is edited
    end
    f.actions
  end

  show do |ad|
    attributes_table do
      row :text
      row :img do
        image_tag(ad.img.url(:thumb))
      end
      # Will display the image on show object page
    end
  end
end
