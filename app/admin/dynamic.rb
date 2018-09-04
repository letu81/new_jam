ActiveAdmin.register Dynamic do
  permit_params :title, :web_url, :description, :visible

  menu priority: 4, label: "行业动态"

  filter :title
  filter :visible

  scope("全部A") { |dynamic| dynamic.all }
  scope("显示动态Y") { |dynamic| dynamic.visible }
  scope("不显示动态N") { |dynamic| dynamic.invisible }

  index do
    selectable_column
    id_column
    column(:title, sortable: false) { |dynamic| link_to dynamic.title, admin_dynamic_path(dynamic) }
    column :web_url, sortable: false
    column :description, sortable: false
    column :visible
    actions
  end

  show do 
    attributes_table do
      row :id
      row :title
      row :web_url
      row :description do |dynamic|
        raw(dynamic.description)
      end
      row :visible
    end
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :web_url
      f.input :description, input_html: {class: "redactor"}
      f.input :visible
    end
    f.actions
  end

  #form partial: 'form'

end