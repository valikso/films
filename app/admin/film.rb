ActiveAdmin.register Film do
  permit_params :title, :logo, :descrintion, :year, :author

  index do
    id_column
    column :title
    column :year
    column :author
    column :logo do |e|
      image_tag(e.logo.thumb.url, style: "max-height:250px;")
    end
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :title
      row :year
      row :author
      row :descrintion
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
      f.input :descrintion
      f.input :logo, :as => :file, :hint => f.object.logo.present? \
                               ? image_tag(f.object.logo.url, style: "max-width:300px;") : content_tag(:span, "no logo image yet")

    end
    f.actions
  end
end
