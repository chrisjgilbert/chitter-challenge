require 'pg'
require 'bcrypt'

class User

  def self.create(name:, username:, email:, password:)
    enctypted_password = BCrypt::Password.create(password)

    result = DatabaseConnection.query("INSERT INTO users (name, username, email, password) VALUES('#{name}', '#{username}', '#{email}', '#{enctypted_password}') RETURNING id, username, email;")

    User.new(
      id: result[0]['id'],
      username: result[0]['username'],
      email: result[0]['email']
    )
  end

  def self.find(id:)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id};")
    User.new(
      id: result[0]['id'],
      username: result[0]['username'],
      email: result[0]['email']
    )
  end

  attr_reader :id, :username, :email

  def initialize(id:, username:, email:)
    @id = id
    @email = email
    @username = username
  end


end
