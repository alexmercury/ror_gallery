# I18n config
# # Load localization files
I18n.load_path += Dir[Rails.root.join('config', 'locales','views', '*.yml')]
I18n.load_path += Dir[Rails.root.join('config', 'locales','base', '*.yml')]
# Set default locale
I18n.default_locale = :en