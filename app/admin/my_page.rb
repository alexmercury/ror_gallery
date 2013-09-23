require 'nokogiri'
require 'open-uri'

ActiveAdmin.register_page 'My page' do

  page_action :ex, :method => :post do
    # do stuff here

    parse_url = 'http://devsbs.com'

    doc = Nokogiri::HTML(open(parse_url))

    @img_src = Array.new

    doc.css('img').each do |image|

      unless image['src'].nil? && image['src'].include?('://')

        unless image['src'].include? parse_url.split('/')[2]
          image['src'] =  parse_url.split('/')[2] + image['src']
        end

        image['src'] = parse_url.split('/')[0]+ '//' + image['src']

      end

      @img_src <<  image['src']

    end

    puts @img_src

    #render layout: 'active_admin'
    render 'admin/ex'
    #redirect_to admin_my_page_path#, :notice => "You did stuff!#{title}"
  end


  content do

    panel 'Parse site' do
      div {link_to "Do Stuff", admin_my_page_ex_path(), :method => :post}

      div{ button_tag 'TTT', id: 'parse_win' }
    end



  end

end