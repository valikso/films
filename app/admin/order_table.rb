ActiveAdmin.register OrderTable do
  permit_params :user_name, :film_name, :film_year, :comment
end
