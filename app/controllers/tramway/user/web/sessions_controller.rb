module Tramway::User
  module Web
    class SessionsController < ::Tramway::User::Web::ApplicationController
      before_action :redirect_if_signed_in, except: :destroy

      def new
        @session_form = ::Tramway::User::Web::SessionForm.new User.new
      end

      def create
        @session_form = SessionForm.new User.find_or_initialize_by email: params[:tramway_user_user][:email]
        if @session_form.validate params[:tramway_user_user]
          sign_in @session_form.model
          redirect_to ::Tramway::User.root_path
        else
          render :new
        end
      end

      def destroy
        sign_out
        redirect_to root_path
      end

      private

      def redirect_if_signed_in
        redirect_to ::Tramway::User.root_path if signed_in?
      end
    end
  end
end
