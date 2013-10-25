ActiveAdmin.register NavigationEvent do

  index title: proc{params[:user_id].blank? ? 'Navigation' : "#{(User.find(params[:user_id])).email.to_s} -> navigation"} do
    selectable_column
    column :url
    column :created_at
    default_actions
  end

  controller do

    def scoped_collection
      unless params[:user_id].blank?
        NavigationEvent.where('user_id = :id', id: params[:user_id]).page(params[:page]).per(30)
      else
        NavigationEvent.includes(:user).page(params[:page]).per(30)
      end
    end

  end

end