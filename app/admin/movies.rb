ActiveAdmin.register Movie do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :genre, :title, :url

  index do
    selectable_column
    id_column
    column :genre, :text, &:genre_i18n
    column :title
    column :url
    column :created_at
    column :updated_at
    actions
  end

  filter :genre, as: :select, collection: Text.genres_i18n.invert.transform_values { |v| Text.genres[v] }
  filter :title
  filter :url
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :genre, as: :select, collection: Text.genres_i18n.invert
      f.input :title
      f.input :url
    end
    f.actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:genre, :title, :url]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
