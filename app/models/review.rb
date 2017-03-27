class Review
  include Databaseable::InstanceMethods
  extend Databaseable::ClassMethods

  ATTRIBUTES = {
    id: "INTEGER PRIMARY KEY",
    customer_id: "INTEGER",
    restaurant_id: "INTEGER"
  }

  attr_accessor(*self.public_attributes)
  attr_reader :id



  def customer
    sql = <<-SQL
    SELECT customers.name
    FROM customers
    JOIN reviews ON reviews.customer_id = customers.id
    SQL
  end

  def restaurant
    sql = <<-SQL
    SELECT restaurants.name
    FROM restaurants
    JOIN reviews ON reviews.restaurant_id = restaurants.id
    SQL
  end

end
