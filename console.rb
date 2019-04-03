require('pry-byebug')
require_relative('models/albums.rb')
require_relative('models/artist.rb')

Artist.delete_all()
Albums.delete_all()

artist1 = Artist.new({
  'name' => 'Avril Lavigne'
  })

artist1.save()

album1 = Albums.new({
  'name' => 'Let go',
  'genre' => 'punk rock',
  'artist_id' => "#{artist1.id}"
  })

album1.save()

artist2 = Artist.new({'name' => 'Beyonce'})

artist2.save()

album2 = Albums.new({'name' => 'Lemonade',
                    'genre' => 'RnB',
                    'artist_id' => "#{artist2.id}"
                  })

album2.save()
