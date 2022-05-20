puts 'Seeding spells...'

#arr of spells we want to add to the db
spells = ['acid-arrow', 'animal-messenger', 'calm-emotions', 'charm-person']

#iterate over each spell
spells.each do |spell|
  
  #make a request to the endpoint for the individual spell:
  res = RestClient.get "https://www.dnd5eapi.co/api/spells/#{spell}"

  #the res will come back as a JSON-formatted string.
  #JSON.parse converts this string to a ruby hash:
  spell_hash = JSON.parse(res)

  #create a spell in the db using the data from the spell_hash

  Spell.create(
    name: spell_hash['name'],
    level: spell_hash['level'],
    description: spell_hash['desc'][0]
  )

end

puts 'Done seeding!'
