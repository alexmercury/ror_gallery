require 'nokogiri'
require 'open-uri'

ActiveAdmin.register_page 'My page' do

  page_action :ex, :method => :post do
    # do stuff here

    parse_url = 'http://im-lab.ru'

    doc = Nokogiri::HTML(open(parse_url))

    @img_src = Array.new

    doc.css('img').each do |image|

      unless image['src'].include?('://')

        unless image['src'].include? parse_url.split('/')[2]
          image['src'] =  parse_url.split('/')[2] + image['src']
        end

        image['src'] = parse_url.split('/')[0]+ '//' + image['src']

      end

      @img_src <<  image['src']

    end

    @categories = Category.all


    render 'admin/ex'
  end

  page_action :save, :method => :post do

    picture = Picture.new(params[:picture])

    picture.image = open(params[:image_url])

    picture.save


    render nothing: true
  end


  content do

    panel 'Parse site' do

      div do

        form_tag(admin_my_page_ex_path(), :method => :post) do
          url_field_tag :parse_url
          submit_tag 'Save'
        end

      end

      div {link_to "Do Stuff", admin_my_page_ex_path(), :method => :post}

      div{ button_tag 'TTT', id: 'parse_win' }
    end

  end

end