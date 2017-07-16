class Session
  attr_reader :user, :oauth_payload

  def initialize(oauth_payload)
    @oauth_payload = oauth_payload
    @new_user = false

    find_or_create_user_from_oauth_payload
  end

  def new_user?
    @new_user
  end

  private

  def find_or_create_user_from_oauth_payload
    @user = existing_user_from_oauth || create_user_from_oauth
  end

  def existing_user_from_oauth
    User.find_by(oauth_id: oauth_payload.uid)
  end

  def create_user_from_oauth
    @new_user = true

    User.create!(
      oauth_id: oauth_payload.uid,
      oauth_token: oauth_payload.credentials.token,
      name: oauth_payload.info.name,
      email: oauth_payload.info.email,
    )
  end
end
