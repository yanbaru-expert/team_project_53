ActiveAdmin.register Text do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :genre, :title, :content

  index do
    selectable_column
    id_column
    column :genre, :text, &:genre_i18n
    column :title
    column :content do |text|
      text.content.to_s.truncate(100)
    end
    column :created_at
    column :updated_at
    actions
  end

  filter :genre, as: :select, collection: Text.genres_i18n.invert.transform_values { |v| Text.genres[v] }
  filter :title
  filter :content
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :genre, as: :select, collection: Text.genres_i18n.invert
      f.input :title
      f.input :content
    end
    f.actions
  end

  show do
    attributes_table do
      row :genre, :text, &:genre_i18n
      row :title
      row :content do
        div(class: "content") do
          span "content goes here"
        end
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:genre, :title, :content]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
