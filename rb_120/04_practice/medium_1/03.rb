class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    quantity = updated_count if updated_count >= 0
  end
end

# Fixing the problem on `line 10` by using `attr_accessor` creates the
# unintended side effect that `quantity` will be able to be updated from outside
# the class. This could be handled by instead creating a private `attr_writer`
# method.
