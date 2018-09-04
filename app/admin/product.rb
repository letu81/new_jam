ActiveAdmin.register Product do
  permit_params :title, :intro, :keywords, :description, {images:[]}, :visible

  menu priority: 1, label: "产品中心"

  filter :title
  filter :intro
  filter :keywords
  filter :visible

  scope("全部A") { |product| product.all }
  scope("显示在产品页Y") { |product| product.visible }
  scope("不显示在产品页N") { |product| product.invisible }

  index do
    selectable_column
    id_column
    column(:title, sortable: false) { |product| link_to product.title, admin_product_path(product) }
    column :intro, sortable: false
    column :keywords, sortable: false
    column :images, sortable: false do |product|
      ul do
        product.images.each do |img|
          span do
            image_tag(img.url(:small), size: '60x60')
          end
        end
      end
    end
    column :visible
    actions
  end

  show do 
    attributes_table do
      row :id
      row :title
      row :intro
      row :keywords
      row :description do |product|
        raw product.description
      end
      row :images do |product|
        ul do
          product.images.each do |img|
            span do
              image_tag(img.url(:small), size: '60x60')
            end
          end
        end
      end
      row :visible
    end
  end

  form html: { multipart: true } do |f|
    f.semantic_errors

    f.inputs do
      f.input :title
      f.input :intro
      f.input :keywords
      f.input :description, input_html: {class: "redactor"}
      f.input :images, as: :file, input_html: { multiple: true }, hint: '所有产品缩略图正方形大小一样，尺寸不小于400x400'
      f.input :images, as: :file, input_html: { multiple: true }
      f.input :images, as: :file, input_html: { multiple: true }
      f.input :visible
    end
    f.actions
  end

end