def execute(&block)
    block
end

execute { puts "Hello from inside the execute method!" }

# My original answer:
# Prints: "Hello from inside the execute method!"
# Returns: nil
#
# Acutal answer:
# Prints: nothing, because the proc is never called with the .call method
# Returns: Proc object

