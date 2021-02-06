def call_me(some_code)
  some_code.call
end

name = 3
chunk_of_code = Proc.new {puts "hi #{name}"}
name = 4

call_me(chunk_of_code)
