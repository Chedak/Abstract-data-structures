require "./linked_list_stack"

def balanced_brackets?(string)
  input = string.scan /\(|\)|\{|\}|\[|\]/
  @char_stack = Stack.new
  input.each do |bracket|
    @char_stack.push(bracket)
     if @char_stack.size > 1
       2.times {@char_stack.pop} if @char_stack.top == '}' && @char_stack.stacked_previous == '{'
       2.times {@char_stack.pop} if @char_stack.top == ']' && @char_stack.stacked_previous == '['
       2.times {@char_stack.pop} if @char_stack.top == ')' && @char_stack.stacked_previous == '('
     end
  end
  if @char_stack.size == 0
    return true
  else
    return false
  end
end
