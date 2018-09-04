ActiveAdmin.register Post do
  permit_params :title, :description, :visible

  menu priority: 5, label: "新闻中心"

  filter :title
  filter :visible

  scope("全部A") { |post| post.all }
  scope("显示新闻") { |post| post.visible }
  scope("不显示新闻N") { |post| post.invisible }

  index do
    selectable_column
    id_column
    column(:title, sortable: false) { |post| link_to post.title, admin_post_path(post) }
    column :description, sortable: false
    column :visible
    actions
  end

  show do 
    attributes_table do
      row :id
      row :title
      row :description do |dynamic|
        raw(dynamic.description)
      end
      row :visible
    end
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :description, input_html: {class: "redactor"}
      f.input :visible
    end
    f.actions
  end

end