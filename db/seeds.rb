require_relative( '../models/member' )
require_relative( '../models/session' )
require_relative( '../models/booking')

Booking.delete_all()
Member.delete_all()
Session.delete_all()

member1 = Member.new({
  'first_name' => 'Richard',
  'last_name' => 'Jones',
  'date_of_birth' => '12/03/1990',
  'address' => '15 Letham Place, Edinburgh',
  'post_code' => 'EH118BD'})
member1.save

member2 = Member.new({
  'first_name' => 'Thomas',
  'last_name' => 'Reid',
  'date_of_birth' => '09/07/1985',
  'address' => '19 Gorgie Crescent, Musselburgh',
  'post_code' => 'EH275EX'})
member2.save

member3 = Member.new({
    'first_name' => 'Sheila',
    'last_name' => 'Jones',
    'date_of_birth' => '22/02/1980',
    'address' => '1 Moray Avenue, Edinburgh',
    'post_code' => 'EH35NP'})
member3.save

member4 = Member.new({
    'first_name' => 'Stuart',
    'last_name' => 'Ferguson',
    'date_of_birth' => '14/07/1999',
    'address' => '105 Embo Drive, Tranent',
    'post_code' => 'EH319PQ'})
member4.save

member5 = Member.new({
  'first_name' => 'Pamela',
  'last_name' => 'Peters',
  'date_of_birth' => '30/06/1975',
  'address' => '5 Brodie Road, Edinburgh',
  'post_code' => 'EH18LP'})
member5.save

member6 = Member.new({
  'first_name' => 'Colin',
  'last_name' => 'Palmer',
  'date_of_birth' => '01/12/1984',
  'address' => '76 Muirston Place, Kirkliston',
  'post_code' => 'EH317UM'})
member6.save

session1 = Session.new({
  'name' => 'Zumba',
  'type' => 'Cardio',
  'duration' => 40,
  'day' => 'Monday',
  'start_time' => '13:30'
  })
session1.save

session2 = Session.new({
  'name' => 'Kettlebells',
  'type' => 'Toning',
  'duration' => 30,
  'day' => 'Tuesday',
  'start_time' => '17:30'
  })
session2.save

session3 = Session.new({
  'name' => 'Box Fit',
  'type' => 'Cardio',
  'duration' => 35,
  'day' => 'Wednesday',
  'start_time' => '20:30'
  })
session3.save

session4 = Session.new({
  'name' => 'Pilates',
  'type' => 'Core',
  'duration' => 60,
  'day' => 'Thursday',
  'start_time' => '07:30'
  })
session4.save

booking1 = Booking.new({
  "member_id" => member1.id,
  "session_id" => session1.id
})
booking1.save()

booking2 = Booking.new({
  "member_id" => member2.id,
  "session_id" => session2.id
})
booking2.save()

booking3 = Booking.new({
  "member_id" => member3.id,
  "session_id" => session3.id
})
booking3.save()

booking4 = Booking.new({
  "member_id" => member4.id,
  "session_id" => session4.id
})
booking4.save()

booking5 = Booking.new({
  "member_id" => member1.id,
  "session_id" => session3.id
})
booking5.save()

booking6 = Booking.new({
  "member_id" => member2.id,
  "session_id" => session4.id
})
booking6.save()

booking7 = Booking.new({
  "member_id" => member6.id,
  "session_id" => session1.id
})
booking7.save()
