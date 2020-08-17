require_relative('../db/sql_runner')

class Booking

  attr_reader( :id, :member_id, :session_id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @member_id = options['member_id'].to_i
    @session_id = options['session_id'].to_i
  end

  def save()
    sql = "INSERT INTO bookings
    (member_id, session_id)
    VALUES
    ($1, $2)
    RETURNING id"
    values = [@member_id, @session_id]
    result = SqlRunner.run( sql, values )
    id = result.first()['id']
    @id = id.to_i
  end

  def self.delete_all()
    sql = "DELETE FROM bookings"
    SqlRunner.run( sql )
  end

  def self.all()
    sql = "SELECT * FROM bookings"
    booking_data = SqlRunner.run( sql )
    bookings = map_items( booking_data )
    return bookings
  end

  def delete()
    sql = "DELETE from bookings
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def gym_member()
    sql = "SELECT * FROM members
    WHERE id = $1"
    values = [@member_id]
    results = SqlRunner.run( sql, values )
    return Member.new( results.first )
  end

  def gym_session()
    sql = "SELECT * FROM sessions
    WHERE id = $1"
    values = [@session_id]
    results = SqlRunner.run( sql, values )
    return Session.new( results.first )
  end

  def self.map_items( booking_data )
    return booking_data.map { |booking| Booking.new( booking )}
  end

end
