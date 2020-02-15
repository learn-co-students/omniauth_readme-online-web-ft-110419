class SessionsController < ApplicationController
    def create
        @user = user.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.image = auth['info']['image']
        end
          session[:user_id] = @user_id

         render 'welcome/home'
        end
    end

    private

        def auth
          request.env['omniauth.auth']
        end
    end
end