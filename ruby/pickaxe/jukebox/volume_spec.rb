describe Volume do
  it "can be created with a volume" do
    volume = Volume.new(5)
    expect(volume.volume).to eq(5)
  end
  it "can has a maximum volume of 9" do
    volume = Volume.new(9)
    volume.succ()
    # catch IndexError
  end
  it "displays volume as a sequence of # signs" do
    volume = Volume.new(9)
    expect(volume.inspect()).to eq('#' * 9)
  end
  it "can be used as a range" do
    medium_volume = Volume.new(4)..Volume.new(7)
    expect(medium_volume.to_a).to eq(['####', '####', '####', '####'])
  end
end
