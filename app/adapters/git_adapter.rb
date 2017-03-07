class GitAdapter
  include HTTParty
  base_uri 'https://api.github.com'

  def initialize(u, p)
    @auth = {username: u, password: p} 
  end

  def user_info
    self.class.get('/users/selenasmall', basic_auth: @auth)
  end

  def user_repo
    self.class.get('/user/repos', basic_auth: @auth)
  end
end
