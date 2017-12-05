module Tramway
  module User
    class ApplicationController < ActionController::Base
      layout ::Tramway::User.layout_path
      protect_from_forgery with: :exception
    end
  end
end
