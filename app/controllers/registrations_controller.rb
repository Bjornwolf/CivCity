class RegistrationsController < Devise::RegistrationsController
  def new
    build_resource({})
    resource.build_user
    respond_with self.resource
  end

  private
  def sign_up_params
    params.require(resource_name).permit!
  end
end