class Button
  attr_reader :label

  def initialize(label)
      @label = label
  end
end

class JukeboxButton < Button
  attr_reader :name, :artist, :duration

  def initialize(label, &callback)
      super(label)
      @callback = callback
  end

  def press()
    @callback.call()
  end
end

