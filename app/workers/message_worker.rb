class MessageWorker
  include Sidekiq::Worker

  def perform(name, count)
    sleep(count)
    puts "Hi #{name}, message has been sent."
  end
end
