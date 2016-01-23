require 'busted.runner'()
require 'medium'
describe("ends_in", function()
  it("return true if the last digit of the number is 3", function()
      local called = 0
      local call = function() called = called + 1 end
      for_loop(1,5,call)
      assert.is_equal(5, called)
  end)
end)
