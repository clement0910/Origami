class FakeJob < ApplicationJob
  queue_as :default

  def perform(group)
    sleep 7
    InitializeChatroom.new(group[0]).call
  end
end
