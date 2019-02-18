require "./linked_list_stack"

def balanced_brackets?(string)
  input = string.scan /\(|\)|\{|\}|\[|\]/
  @brackets = Stack.new
  input.each do |bracket|
    @brackets.push(bracket)
     if @brackets.size > 1
       2.times {@brackets.pop} if @brackets.top == '}' && @brackets.stacked_previous == '{'
       2.times {@brackets.pop} if @brackets.top == ']' && @brackets.stacked_previous == '['
       2.times {@brackets.pop} if @brackets.top == ')' && @brackets.stacked_previous == '('
     end
  end
  if @char_stack.size == 0
    return true
  else
    return false
  end
end
