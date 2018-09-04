ActiveAdmin.register Carousel do
  permit_params :tag, {images:[]}, :visible

  menu priority: 6, label: "展播中心"

  filter :tag
  filter :visible

  scope("全部A") { |carousel| carousel.all }
  scope("显示展播Y") { |carousel| carousel.visible }
  scope("不显示展播N") { |carousel| carousel.invisible }

  index do
    selectable_column
    id_column
    column(:tag, sortable: false) { |carousel| link_to carousel.tag, admin_carousel_path(carousel) }
    column :images, sortable: false do |carousel|
      ul do
        carousel.images.each do |img|
          span do
            image_tag(img.url(:small))
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
      row :tag
      row :images do |carousel|
        ul do
          carousel.images.each do |img|
            span do
              image_tag(img.url(:small))
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
      f.input :tag, hint: '首页轮播此处设置为home，只能是home、products、customizes、partners其中之一'
      f.input :images, as: :file, input_html: { multiple: true }, hint: '尺寸不小于300x400'
      f.input :images, as: :file, input_html: { multiple: true }
      f.input :images, as: :file, input_html: { multiple: true }
      f.input :visible
    end
    f.actions
  end

end