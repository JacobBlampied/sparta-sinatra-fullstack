class User

  attr_accessor :id, :name, :job, :phone

  def self.open_connection
    conn = PG.connect( dbname: 'cars')
  end

  def save
    conn = User.open_connection

    if !self.id
      sql = "INSERT INTO users (name, job, phone) VALUES ('#{self.name}', '#{self.job}', '#{self.phone}')"
    else
      sql = "UPDATE users SET name='#{self.name}', job='#{self.job}', phone='#{self.phone}' WHERE id=#{self.id}"
    end

    conn.exec(sql)
  end

  def self.all

    conn = self.open_connection
    sql = "SELECT * FROM users ORDER BY id"
    results = conn.exec(sql)

    users = results.map do |user|
      self.hydrate user
    end

    users

  end

  def self.find id
    conn = self.open_connection
    sql = "SELECT * FROM users WHERE id=#{id}"
    results = conn.exec(sql)

    user = self.hydrate results[0]

    user
  end

  def self.find_with_cars id
    conn = self.open_connection
    sql = "SELECT cars.id, cars.model, cars.make, cars.year, cars.user_id, user.id, users.name

    results = conn.exec(sql)

    user = self.hydrate results[0]

    user
  end

  def self.destroy id
    conn = self.open_connection
    sql = "DELETE FROM users WHERE id=
    conn.exec(sql)
  end

  def self.hydrate user_data
    user = User.new

    user.id = user_data['id']
    user.name = user_data['name']
    user.job = user_data['job']
    user.phone = user_data['phone']

    user
  end

end
