module Test
  @queue = :test_queue
  def self.perform()
    puts "Test resque ..."
  end
end