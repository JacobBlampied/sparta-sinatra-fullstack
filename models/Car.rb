class Car

  attr_accessor :id, :make, :model, :year, :user_id, :name

  def self.open_conection
    conn = PG.connect( dbname: 'cars' )
  end

  def save
    conn = Car.open_conection

    if !self.id
      sql = "INSERT INTO cars (make, model, year) VALUES ('#{self.make}', #{self.model}, '#{self.year}')"
    else
      sql = "UPDATE cars SET make='#{self.make}', model=#{self.model},year='#{self.year}' WHERE id='#{self.id}'"
    end

    conn.exec(sql)

  end

  def self.all

    conn = self.open_conection
    sql = "SELECT * FROM cars ORDER BY id"
    results = conn.exec(sql)

    cars = results.map do |cars|
      self.hydrate car
    end
    puts cars
    cars

  end

  def self.all_with_director
    conn = self.open_conection
    sql = "SELECT cars.id, cars.make, cars.model, cars.year, cars.user_id, users.id, users.name, FROM cars JOIN users ON cars.user_id = user.id"
    results = conn.exec(sql)

    cars = results.map do |car|
      self.hydrate car
    end

    cars
  end

  def self.find id

    conn = self.open_conection
    sql = "SELECT * FROM car WHERE id=#{id}"

    results = conn.exec(sql)

    car = self.hydrate results[0]

    car

  end

  def self.find_with_director id

    conn = self.open_conection

    sql = "SELECT cars.id, cars.make, cars.model, cars.year, cars.user_id, user.id, user.name, FROM users JOIN cars ON cars.user_id = users.id WHERE users.id=#{id}"

    results = conn.exec(sql)

    car = self.hydrate results[0]

    car

  end

  def self.destroy id
    conn = self.open_conection
    sql = "DELETE FROM movies WHERE id=#{id}"
    conn.exec(sql)
  end

  def self.hydrate car_data
    car = Car.new

    car.id = car_data['id']
    car.make = car_data['make']
    car.model = car_data['model']
    car.year = car_data['year']
    car.user_id = car_data['user_id']
    car.user = "#{car_data['name']}"

    car

  end

end
