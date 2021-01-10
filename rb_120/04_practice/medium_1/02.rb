class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    @quantity = updated_count if updated_count >= 0
  end
end

# Line 11 would have failed becuase `quantity =` is defining a new local
# variable and not accessing the instance variable `quantity`. There are two
# solutions to this:
# @quantity
# or define an attr_writer and use self.quantity
