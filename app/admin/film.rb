ActiveAdmin.register Film do
  permit_params :title, :logo, :description, :year, :author, :small_description, :films_category_id

  index do
    id_column
    column :title
    column :year
    column :author
    column :films_category
      column :logo, :sortable => false do |e|
        if e.logo.present?
          image_tag(e.logo.url, style: "max-height:50px;")
        end
      end
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :title
      row :year
      row :author
      row :films_category
      row :description
      row :small_description
      row :logo do |film|
        if film.logo.present?
          image_tag film.logo.url, style: 'width: 80px;'
        end
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :year
      f.input :author
      f.input :films_category
      f.input :description
      f.input :small_description
      f.input :logo, :as => :file, :hint => f.object.logo.present? \
                               ? image_tag(f.object.logo.url, style: "max-width:300px;") : content_tag(:span, "no logo image yet")

    end
    f.actions
  end
end
