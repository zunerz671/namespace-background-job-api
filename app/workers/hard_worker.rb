class HardWorker
  include Sidekiq::Worker

  def perform(name, count)
    sleep(count)
    puts "Hello #{name}"
  end
end
