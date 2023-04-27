class ApplicationController < ActionController::API
        include Authorization

        before_action :authenticate_with_token

        include DeviseTokenAuth::Concerns::SetUserByToken
end
