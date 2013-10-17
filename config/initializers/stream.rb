module RailsStream

  extend self

  def do_in_stream

    Thread.new do
      yield
    end

  end

end