ActiveAdmin.register Film do
  permit_params :title, :logo, :description, :year, :author, :small_description

  index do
    id_column
    column :title
    column :year
    column :author
    column :logo, :sortable => false do |e|
      image_tag(e.logo.url, style: "max-height:50px;")
    end
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :title
      row :year
      row :author
      row :description
      row :small_description
      row :logo do |film|
        image_tag film.logo.url, style: 'width: 80px;'
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :year
      f.input :author
      f.input :description
      f.input :small_description
      f.input :logo, :as => :file, :hint => f.object.logo.present? \
                               ? image_tag(f.object.logo.url, style: "max-width:300px;") : content_tag(:span, "no logo image yet")

    end
    f.actions
  end
end
