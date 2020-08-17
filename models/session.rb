require_relative('../db/sql_runner')

class Session

  attr_reader :id
  attr_accessor :name, :type, :duration, :day, :start_time

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @type = options['type']
    @duration = options['duration']
    @day = options['day']
    @start_time = options['start_time']
  end

  def save()
    sql = "INSERT INTO sessions
    (name, type, duration, day, start_time)
    VALUES
    ($1, $2, $3, $4, $5)
    RETURNING id"
    values = [@name, @type, @duration, @day, @start_time]
    result = SqlRunner.run( sql, values )
    id = result.first()['id']
    @id = id.to_i
  end

  def self.delete_all()
    sql = "DELETE FROM sessions"
    SqlRunner.run( sql )
  end

  def self.all()
    sql = "SELECT * FROM sessions"
    session_data = SqlRunner.run( sql )
    sessions = map_items( session_data )
    return sessions
  end

  def update()
    sql = "UPDATE sessions SET
    (name, type, duration, day, start_time)
    =
    ($1, $2, $3, $4, $5)
    WHERE id = $6"
    values = [@name, @type, @duration, @day, @start_time, @id]
    SqlRunner.run( sql, values )
  end

  def delete()
    sql = "DELETE from sessions
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def self.find( id )
    sql = "SELECT * FROM sessions
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Session.new( results.first )
  end

  def list_of_members_booked_into_a_session()
    sql = "SELECT members.* FROM members
    INNER JOIN bookings ON bookings.member_id = members.id
    WHERE session_id = $1"
    values = [@id]
    member_results = SqlRunner.run( sql,values )
    return member_results.map{ |member| Member.new( member )}
  end

  #Helper method for mapping
  def self.map_items( session_data )
    return session_data.map { |session| Session.new( session )}
  end

end
