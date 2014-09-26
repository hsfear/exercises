require_relative 'button'

describe Button do
  it "has a label" do
    button = Button.new("button")
    expect(button.label).to eq("button")
  end
end

describe JukeboxButton do
  it "extends button" do
    button = JukeboxButton.new("button") { }
    expect(button.label).to eq("button")
  end

  it "runs the provided action when the button is pressed" do
    pressed = false
    button = JukeboxButton.new("button") { pressed = true }
    button.press()
    expect(pressed).to eq(true)
  end

end
