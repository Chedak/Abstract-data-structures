require "./linked_list_stack"

class StackMin #A stack that tracks it's minimum value
attr_accessor :stack, :stack_minimums

  def initialize
    @stack = Stack.new
    @stack_minimums = Stack.new
  end

  def push value
      @stack.push(value)
      @stack_minimums.push(value) if self.check_minimum?
  end

  def pop
  	@stack_minimums.pop if self.check_equal?
    @stack.pop
  end

  def read_minimum
    @stack_minimums.top unless @stack_minimums.nil?
  end

  def check_equal?
    if @stack.top == @stack_minimums.top
      true
    else
      false
    end
  end

  def check_minimum?
    if @stack_minimums.top.nil?
      true
    elsif @stack.top <= @stack_minimums.top
      true
    else
      false
    end
  end

end
