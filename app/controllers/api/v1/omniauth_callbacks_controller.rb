class Api::V1::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    self.resource = Session.find_or_create_by( github_params )

    sign_in( resource_name, resource )
    redirect_to( after_omniauth_sign_in_path_for( resource ) )
  end

  private
    def github_params
      {
        email: request.env['omniauth.auth'].info.email,
        name:  request.env['omniauth.auth'].info.name,
        nick:  request.env['omniauth.auth'].info.nickname
      }
    end

    def after_omniauth_sign_in_path_for( resource )
      root_path
    end
end
