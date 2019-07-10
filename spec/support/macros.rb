# def login_user
#   before(:each) do
#     @request.env["devise.mapping"] = Devise.mappings[:user]
#     binding.pry
#     user = FactoryBot.create(:user)
#     # user.confirm! #only if account is confirmable
#     sign_in user
#   end
# end
#
# def user_token(user)
#   binding.pry
#   post user_session_url, params: {user: {login: user.email, password: user.password}}
#   response.header['Authorization']
# end
#
# def header_params(args = {})
#   binding.pry
#   {'Authorization': args[:token], 'Accept': 'Application/json', 'HTTP_ACCEPT_LANGUAGE': args[:locale] || 'en'}
# end
