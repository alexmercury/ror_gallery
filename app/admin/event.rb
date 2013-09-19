ActiveAdmin.register Event do

  menu parent: 'User Events'

  index title: proc{params[:user_id].blank? ? 'Events' : "#{(User.find(params[:user_id])).email.to_s} -> #{params[:event_type]}"}  do
    selectable_column
    column :user_id
    column :kind
    column :kind_id
    column :created_at
    default_actions
  end


  controller do

    def scoped_collection
      unless params[:user_id].blank? and params[:event_type].blank?
        Event.where('user_id = :id AND kind IN (:type)', id: params[:user_id], type: params[:event_type]).page(params[:page]).per(30)
      else
        Event.includes(:user).page(params[:page]).per(30)
      end
    end

  end

end