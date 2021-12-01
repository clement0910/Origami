class FakeJob < ApplicationJob
  queue_as :default

  def perform(group)
    InitializeChatroom.new(group[0]).call
  end
end
