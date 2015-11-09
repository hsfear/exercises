require_relative 'diamond'

describe Diamond do
  it "allocates the correct number of lines" do
    [['a', 1], ['A', 1], ['z', 51]].each do | char, lines |
      expect(Diamond.new(char).lines.size).to eq(lines)
    end
  end

  it "allocates the correct number of columns in each line" do
    [['A', 1], ['Z', 51]].each do | char, cols |
      Diamond.new(char).lines.each do | line |
        expect(line.size).to eq(cols)
      end
    end
  end

  it "should have the diamond shaped lines" do
    expect(Diamond.new('A').lines).to eq([['A']])
    expect(Diamond.new('B').lines).to eq([[' ', 'A', ' '], ['B', ' ', 'B'], [' ', 'A', ' ']])
    expect(Diamond.new('C').lines).to eq([[' ', ' ', 'A', ' ', ' '],
                                          [' ', 'B', ' ', 'B', ' '],
                                          ['C', ' ', ' ', ' ', 'C'],
                                          [' ', 'B', ' ', 'B', ' '],
                                          [' ', ' ', 'A', ' ', ' ']])
  end
end

