class Owner
  include Databaseable::InstanceMethods
  extend Databaseable::ClassMethods
  ATTRIBUTES = {
    id: "INTEGER PRIMARY KEY",
    name: "TEXT",
  }

  attr_accessor(*self.public_attributes)
  attr_reader :id

  def restaurants
    sql = <<-SQL
    SELECT *
    FROM restaurants
    JOIN owners ON restaurants.owner_id = owners.id
    GROUP BY owner.name
    SQL
  end
end
