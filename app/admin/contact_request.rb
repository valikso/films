ActiveAdmin.register ContactRequest do
  permit_params :user_name, :subject, :email, :message

end
