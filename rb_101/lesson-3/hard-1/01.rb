#study - uninitialized values
# I guessed that this would be an error, however, it is not.
# Apparently, local variables within an 'if' block are initialized to 'nil'
# even if that branch is never run.

if false
  greeting = “hello world”
end

greeting
