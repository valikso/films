ActiveAdmin.register FilmComment do
  permit_params :user_name, :film_id, :message
end
