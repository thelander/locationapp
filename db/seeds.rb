# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

markets = City.create([
  {
    name: "Myrorna Sundbyberg",
    description: "Myrornas butik i Sundbyberg",
    address: "Sturegatan 36, 172 31 Sundbyberg"
  },
  {
    name: "Myrorna Hötorget",
    description: "Myrornas butik vid Hötorget",
    address: "Adolf Fredriks kyrkogata 5, 111 37 Stockholm"
  },
  {
    name: "Myrorna Ropsten",
    description: "Myrornas butik i Ropsten",
    address: "Kolargatan 2, 115 42 Stockholm"
  },
  {
    name: "Myrorna Hornsgatan",
    description: "Myrornas butik på Hornsgatan på Södermalm",
    address: "Hornsgatan 96, 118 21 Stockholm"
  },
  {
    name: "Myrorna Götgatan",
    description: "Myrornas butik på Götgatan på Södermalm",
    address: "Götgatan 79, 116 62 Stockholm"
  },
  {
    name: "Erikshjälpen Second Hand Spånga",
    description: "Erikshjälpens second hand-butik i Spånga",
    address: "Skogängsvägen 59, 163 41 Spånga"
  },
  {
    name: "Emmaus Stockholm",
    description: "Emmaus butik i Stockholm",
    address: "Peter Myndes backe 8, 118 46 Stockholm"
  },
  {
    name: "Centralantikvariatet",
    description: "Centralantikvariatet",
    address: "Österlånggatan 53, 111 31 Stockholm"
  },
  {
    name: "Stockholms Stadsmissions second hand",
    description: "Myrornas butik i Sundbyberg",
    address: "Hornsgatan 58, 118 21 Stockholm"
  }
])
