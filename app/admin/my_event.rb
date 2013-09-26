ActiveAdmin.register_page 'User Events' do

  page_action :index, :method => :get do
    @users = User.order('created_at desc').page(params[:page])
  end

  sidebar 'User' do
  end

  content title:'User Events' do
    render partial: 'admin/user_events'
  end

end