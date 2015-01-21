module MockOmniauth
  def mock_github_oauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(
    {
      :provider => "github",
      :uid => "1234567",
      :info => {
        :name => "John Doe",
        :image => "https://avatars.githubusercontent.com/u/photo.jpg"
      },
      :credentials => {
        :token => "token", :expires => false}
      })
    end
  end

  RSpec.configure do |config|
    config.include MockOmniauth
  end

  # "provider"=>"github",
  # "uid"=>"**uid**",
  # "info"=>
  # {"nickname"=>"somenickname",
  #   "email"=>"",
  #   "name"=>"Some Name",
  #   "image"=>"https://avatars.githubusercontent.com/u/**uid**?v=3",
  #   "urls"=>{"GitHub"=>"https://github.com/somenickname", "Blog"=>""}},
  #   "credentials"=>{"token"=>"****************************************", "expires"=>false},
  #   "extra"=>
  #   {"raw_info"=>
  #     {"login"=>"somenickname",
  #       "id"=>**uid**,
  #       "avatar_url"=>"https://avatars.githubusercontent.com/u/1514862?v=3",
  #       "gravatar_id"=>"",
  #       "url"=>"https://api.github.com/users/somenickname",
  #       "html_url"=>"https://github.com/somenickname",
  #       "followers_url"=>"https://api.github.com/users/somenickname/followers",
  #       "following_url"=>"https://api.github.com/users/somenickname/following{/other_user}",
  #       "gists_url"=>"https://api.github.com/users/somenickname/gists{/gist_id}",
  #       "starred_url"=>"https://api.github.com/users/somenickname/starred{/owner}{/repo}",
  #       "subscriptions_url"=>"https://api.github.com/users/somenickname/subscriptions",
  #       "organizations_url"=>"https://api.github.com/users/somenickname/orgs",
  #       "repos_url"=>"https://api.github.com/users/somenickname/repos",
  #       "events_url"=>"https://api.github.com/users/somenickname/events{/privacy}",
  #       "received_events_url"=>"https://api.github.com/users/somenickname/received_events",
  #       "type"=>"User",
  #       "site_admin"=>false,
  #       "name"=>"Some Name",
  #       "company"=>"",
  #       "blog"=>"",
  #       "location"=>"",
  #       "email"=>"",
  #       "hireable"=>false,
  #       "bio"=>nil,
  #       "public_repos"=>24,
  #       "public_gists"=>10,
  #       "followers"=>3,
  #       "following"=>18,
  #       "created_at"=>"2012-03-08T04:17:12Z",
  #       "updated_at"=>"2015-01-20T21:29:37Z"}}}
