Rails.application.reload_routes!
::Tramway::User.layout_path = "#{Rails.root}/app/views/layouts/application"
::Tramway::User.root_path = Rails.application.routes.url_helpers.root_path
