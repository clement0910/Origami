class BorisBot
  def initialize(users, message = nil)
    @message = message
    @users = users
    if message.nil?
      @initialize = false
    else
      @initialize = true
    end
  end

  def call
    initialize_chat unless @initialize
  end

end