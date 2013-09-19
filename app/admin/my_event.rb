ActiveAdmin.register_page 'User Events' do

  content title:'User Events' do

    columns do
      column do
        panel 'User event' do
          table_for User.order('created_at desc').limit(10) do
            column('Email') {|user| user.email}
            column('Navigation') {|user| link_to 'navigation', admin_navigation_events_path(user_id: user.id)}
            column('user sign out') {|user| link_to 'user sign out',  admin_events_path(user_id: user.id, event_type: 'sign_out')}
            column('user sign in') {|user| link_to 'user sign in', admin_events_path(user_id: user.id, event_type: 'sign_in')}
            column('Likes') {|user| link_to 'like/dislike', admin_events_path(user_id: user.id, event_type: ['like','dislike'])}
            column('Subscribe') {|user| link_to 'subscribe/unsubscribe', admin_events_path(user_id: user.id, event_type: ['subscribe','unsubscribe'])}

            column('Comments') { |user| link_to 'comments', admin_events_path(user_id: user.id, event_type: 'comment')}
          end
        end
      end
    end

  end

end