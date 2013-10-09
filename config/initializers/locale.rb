I18n.load_path += Dir[Rails.root.join('config', 'locales','views', '*.yml')]
I18n.load_path += Dir[Rails.root.join('config', 'locales','base', '*.yml')]

I18n.default_locale = :en