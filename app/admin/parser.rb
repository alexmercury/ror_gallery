require 'nokogiri'
require 'open-uri'

ActiveAdmin.register_page 'Parser' do

  page_action :perform, :method => :post do

    unless params[:parse_url].blank?

      begin

        parse_url = params[:parse_url]

        doc = Nokogiri::HTML(open(URI.parse(parse_url)))

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

        render 'admin/perform'

      rescue
        redirect_to :back, alert: "Can't connect to the server or invalid url"
      end

    else
      redirect_to :back, alert: "Url can't be blank"
    end

  end

  page_action :save, :method => :post do

    picture = Picture.new(params[:picture])

    picture.image = open(params[:image_url])

    if picture.save
      render nothing: true
    else
      render js: "alert(\"#{picture.errors.full_messages.join(", ")}\");", status: :internal_server_error
    end
  end

  sidebar 'How to parse ?' do
  end


  content do

    panel 'Parse site' do
      div do
         render partial: 'admin/image_parse_form'
      end
    end

  end

end