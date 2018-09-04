ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation

  filter :email
  filter :current_sign_in_ip
  filter :sign_in_count

  index do
    selectable_column
    id_column
    column(:email, sortable: false) { |user| link_to user.email, admin_admin_user_path(user) }
    column :current_sign_in_at
    column :current_sign_in_ip, sortable: false
    column :last_sign_in_at
    column :last_sign_in_ip, sortable: false
    column :sign_in_count
    column :created_at
    actions
  end

  show do 
    attributes_table do
      row :id
      row :email
      row :sign_in_count
      row :current_sign_in_at
      row :current_sign_in_ip
      row :last_sign_in_at
      row :last_sign_in_ip
      row :created_at
    end
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end