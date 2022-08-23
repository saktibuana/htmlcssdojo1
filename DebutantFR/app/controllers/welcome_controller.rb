class WelcomeController < ApplicationController
before_action :forbid_login_user, {only: [:welcome]}

	layout "welcomepage"

end
