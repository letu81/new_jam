ActiveAdmin.register Partner do
  permit_params :title, :web_url, :visible

  menu priority: 3, label: "合作伙伴"

  filter :title
  filter :visible

  scope("全部A") { |partner| partner.all }
  scope("显示合作伙伴Y") { |partner| partner.visible }
  scope("不显示合作伙伴N") { |partner| partner.invisible }

  index do
    selectable_column
    id_column
    column(:title, sortable: false) { |partner| link_to partner.title, admin_partner_path(partner) }
    column :web_url, sortable: false
    column :visible
    actions
  end

  show do 
    attributes_table do
      row :id
      row :title
      row :web_url
      row :visible
    end
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :web_url
      f.input :visible
    end
    f.actions
  end

end