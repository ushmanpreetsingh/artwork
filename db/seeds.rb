require 'faker'
require 'json'
require 'net/http'

# Define method to fetch data from Art Institute of Chicago API
def fetch_artworks_from_api
  url = URI.parse('https://api.artic.edu/api/v1/artworks')
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(url.request_uri)
  response = http.request(request)
  JSON.parse(response.body)['data']
end

# Fetch data from Art Institute of Chicago API and insert into Artwork table
artworks = fetch_artworks_from_api
artworks.each do |artwork_data|
  artist_name = artwork_data['artist_display']
  artist = Artist.find_or_create_by(name: artist_name)

  collection_name = artwork_data['collection_name']
  collection = Collection.find_or_create_by(name: collection_name)

  Artwork.create!(
    title: artwork_data['title'],
    artist_id: artist.id,
    year: artwork_data['date'],
    medium: artwork_data['medium_display'],
    description: artwork_data['description'],
    collection_id: collection.id
  )
end

# Use Faker gem to generate fake artwork data and insert into FakeArtwork table
iterations = 200 - Artwork.count - FakeArtwork.count
iterations.times do
  fake_artist_name = Faker::Artist.name
  fake_artist = Artist.find_or_create_by(name: fake_artist_name)

  fake_collection_name = Faker::Lorem.word
  fake_collection = Collection.find_or_create_by(name: fake_collection_name)

  FakeArtwork.create!(
    title: Faker::Lorem.sentence,
    artist_id: fake_artist.id,
    year: Faker::Number.between(from: 1900, to: 2022),
    medium: Faker::Lorem.word,
    description: Faker::Lorem.paragraph,
    collection_id: fake_collection.id
  )
end
