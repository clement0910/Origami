class FakeJob < ApplicationJob
  queue_as :default

  def perform(group)
    sleep 5
    InitializeChatroom.new(group[0]).call
  end
end
