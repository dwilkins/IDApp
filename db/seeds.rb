# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

RoomAttribute.create([
                      {name: 'Hoods', abbreviation: 'hood'},
                      {name: 'Office', abbreviation: 'office'},
                      {name: 'Lab', abbreviation: 'lab'},
                      {name: 'Gym/Think Room', abbreviation: 'gym'}
                     ])

input_data = [
{suite: "M100",office: nil,hoods: nil,type: "Office",footage: "Devon",rate: nil,tenant: "Innovation Depot"},
{suite: "M103",office: nil,hoods: nil,type: "Office",footage: "Kevin",rate: nil,tenant: "Innovation Depot"},
{suite: "M104",office: nil,hoods: nil,type: "Office",footage: "Desiree",rate: nil,tenant: "Innovation Depot"},
{suite: "M105",office: nil,hoods: nil,type: "Office",footage: "Susan",rate: nil,tenant: "Innovation Depot"},
{suite: "R128",office: "D12",hoods: nil,type: "Gym/Think Room",footage: "Gym",rate: nil,tenant: nil},
{suite: "C108",office: "D08",hoods: nil,type: "Office",footage: "Blake",rate: nil,tenant: "Innovation Depot"},
{suite: "L111",office: nil,hoods: nil,type: "Lab",footage: "Shared Lab",rate: nil,tenant: "Innovation Depot"},
{suite: "A101",office: "A05",hoods: nil,type: "Office",footage: 210,rate: nil,tenant: "Winter Industry Piping"},
{suite: "A102",office: "B01",hoods: nil,type: "Office",footage: 565,rate: nil,tenant: "Sanguard Security"},
{suite: "A103",office: "A06",hoods: nil,type: "Office",footage: 210,rate: nil,tenant: "Winter Industry Piping"},
{suite: "A105",office: "A08",hoods: nil,type: "Office",footage: 3265,rate: nil,tenant: "MedSnap"},
{suite: "A106",office: "B02",hoods: nil,type: "Office",footage: 540,rate: nil,tenant: "MedSnap"},
{suite: "A107",office: "A08",hoods: nil,type: "Office",footage: 210,rate: nil,tenant: "MedSnap"},
{suite: "A109",office: "A09",hoods: nil,type: "Office",footage: 210,rate: nil,tenant: "MedSnap"},
{suite: "A110",office: "B03",hoods: nil,type: "Office",footage: 550,rate: nil,tenant: "MedSnap"},
{suite: "A111",office: "A10",hoods: nil,type: "Office",footage: 210,rate: nil,tenant: "MedSnap"},
{suite: "A112",office: "B04",hoods: nil,type: "Office",footage: 480,rate: nil,tenant: "Panorama Public Relations"},
{suite: "A113",office: "A11",hoods: nil,type: "Office",footage: 210,rate: nil,tenant: "MedSnap"},
{suite: "A119",office: "A12",hoods: nil,type: "Office",footage: 3345,rate: nil,tenant: "Southeastern Commercial Finance"},
{suite: "B101",office: "B12",hoods: nil,type: "Office",footage: 235,rate: nil,tenant: "Birmingham Business Resource Center"},
{suite: "B102",office: "C04",hoods: nil,type: "Office",footage: 455,rate: nil,tenant: "Educator Technologies"},
{suite: "B103",office: "B11",hoods: nil,type: "Office",footage: 235,rate: nil,tenant: "Printwise"},
{suite: "B105",office: "B10",hoods: nil,type: "Office",footage: 235,rate: nil,tenant: "Printwise"},
{suite: "B106",office: "C03",hoods: nil,type: "Office",footage: 850,rate: nil,tenant: "Birmingham Business Resource Center"},
{suite: "B107",office: "B09",hoods: nil,type: "Office",footage: 235,rate: nil,tenant: "Stringfellow Technologies"},
{suite: "B108",office: "C16",hoods: nil,type: "Office",footage: 1250,rate: nil,tenant: "Chronicle Studios"},
{suite: "B109",office: "B08",hoods: nil,type: "Office",footage: 235,rate: nil,tenant: nil},
{suite: "B111",office: "B07",hoods: nil,type: "Office",footage: 380,rate: nil,tenant: "Chronicle Studios"},
{suite: "B112",office: "C17",hoods: nil,type: "Office",footage: 410,rate: nil,tenant: "Women's Imaging Solutions"},
{suite: "B117",office: "J06",hoods: nil,type: "Office",footage: 2820,rate: nil,tenant: "Vista Engineering"},
{suite: "B124",office: "J07",hoods: nil,type: "Office",footage: 710,rate: nil,tenant: "Advanced Systems Unlimited"},
{suite: "B125",office: "J09",hoods: nil,type: "Office",footage: 685,rate: nil,tenant: "Instagift"},
{suite: "B126",office: "J10",hoods: nil,type: "Office",footage: 955,rate: nil,tenant: "Instagift"},
{suite: "C109",office: "C26",hoods: nil,type: "Office",footage: 590,rate: nil,tenant: "Adit4Less"},
{suite: "C110",office: "D09",hoods: nil,type: "Office",footage: 210,rate: nil,tenant: "Congruent Solutions"},
{suite: "C112",office: "D10",hoods: nil,type: "Office",footage: 210,rate: nil,tenant: nil},
{suite: "C114",office: "D11",hoods: nil,type: "Office",footage: 210,rate: nil,tenant: "iSeek Solutions"},
{suite: "C118",office: "G06",hoods: nil,type: "Office",footage: 820,rate: nil,tenant: "IPG Photonics"},
{suite: "C123",office: "G14",hoods: nil,type: "Office",footage: 2750,rate: nil,tenant: "BioGX"},
{suite: "C124",office: "G18",hoods: nil,type: "Office",footage: 2125,rate: nil,tenant: "IPG Photonics"},
{suite: "C129 / E125",office: "G09",hoods: nil,type: "Office",footage: 2220,rate: nil,tenant: nil},
{suite: "C130",office: "G20",hoods: nil,type: "Office",footage: 810,rate: nil,tenant: "BioDtech"},
{suite: "C132",office: "G10",hoods: nil,type: "Office",footage: 675,rate: nil,tenant: "FireRock"},
{suite: "D101",office: "D31",hoods: nil,type: "Office",footage: 195,rate: nil,tenant: "ThoughtJet"},
{suite: "D102",office: "D22",hoods: nil,type: "Office",footage: 295,rate: nil,tenant: "No I.D."},
{suite: "D103",office: "D30",hoods: nil,type: "Office",footage: 195,rate: nil,tenant: "Malcovery"},
{suite: "D104",office: "D20",hoods: nil,type: "Office",footage: 295,rate: nil,tenant: nil},
{suite: "D105",office: "D29",hoods: nil,type: "Office",footage: 840,rate: nil,tenant: "Malcovery"},
{suite: "D106",office: "D24",hoods: nil,type: "Office",footage: 305,rate: nil,tenant: "Projects Unlimited"},
{suite: "D107",office: "D28",hoods: nil,type: "Office",footage: 200,rate: nil,tenant: "Essnova"},
{suite: "D108",office: "D25",hoods: nil,type: "Office",footage: 300,rate: nil,tenant: "Projects Unlimited"},
{suite: "E101",office: "F09",hoods: nil,type: "Office",footage: 1810,rate: nil,tenant: nil},
{suite: "E102",office: "F36",hoods: nil,type: "Office",footage: 340,rate: nil,tenant: "Lifestages Publishing"},
{suite: "E103",office: "E17",hoods: nil,type: "Office",footage: 260,rate: nil,tenant: "E-Data Solutions"},
{suite: "E104",office: "F35",hoods: nil,type: "Office",footage: 220,rate: nil,tenant: "Eco Three"},
{suite: "E105",office: "E16",hoods: nil,type: "Office",footage: 260,rate: nil,tenant: "WM Mortgage"},
{suite: "E106/F101",office: "F34",hoods: nil,type: "Office",footage: 365,rate: nil,tenant: "Blue Ocean Technologies"},
{suite: "E107",office: "E15",hoods: nil,type: "Office",footage: 260,rate: nil,tenant: nil},
{suite: "E108",office: "F09",hoods: nil,type: "Office",footage: 315,rate: nil,tenant: "LawFit"},
{suite: "E109",office: "D19",hoods: nil,type: "Office",footage: 1160,rate: nil,tenant: "VEAR"},
{suite: "E110",office: "F10",hoods: nil,type: "Office",footage: 210,rate: nil,tenant: "Select My Space"},
{suite: "E111",office: "D18",hoods: nil,type: "Office",footage: 835,rate: nil,tenant: "Zappend"},
{suite: "E112",office: "F11",hoods: nil,type: "Office",footage: 210,rate: nil,tenant: "Alignment Simple Solutions"},
{suite: "E114",office: "F12",hoods: nil,type: "Office",footage: 210,rate: nil,tenant: "Fleetio"},
{suite: "E115",office: "D17",hoods: nil,type: "Office",footage: 420,rate: nil,tenant: "Class Action Capital"},
{suite: "E116",office: "F13",hoods: nil,type: "Office",footage: 475,rate: nil,tenant: "ComplyMD"},
{suite: "E117",office: "D16",hoods: nil,type: "Office",footage: 420,rate: nil,tenant: nil},
{suite: "E118",office: "F14",hoods: nil,type: "Office",footage: 210,rate: nil,tenant: "ComplyMD"},
{suite: "E120",office: "F15",hoods: nil,type: "Office",footage: 210,rate: nil,tenant: "Kelly Green Marketing"},
{suite: "E121",office: "G10",hoods: nil,type: "Office",footage: 200,rate: nil,tenant: "FireRock"},
{suite: "E123",office: "G10",hoods: nil,type: "Office",footage: 195,rate: nil,tenant: "FireRock"},
{suite: "E122",office: "F16",hoods: nil,type: "Office",footage: 315,rate: nil,tenant: "Knight Eady Sports & Entertainment"},
{suite: "E124",office: "F17",hoods: nil,type: "Office",footage: 1650,rate: nil,tenant: nil},
{suite: "E126",office: "F18",hoods: nil,type: "Office",footage: 1900,rate: nil,tenant: nil},
{suite: "F102",office: "F37",hoods: nil,type: "Office",footage: 640,rate: nil,tenant: "Blue Ocean Technologies"},
{suite: "F103",office: "F33",hoods: nil,type: "Office",footage: 225,rate: nil,tenant: "Blue Ocean Technologies"},
{suite: "F104",office: "F02",hoods: nil,type: "Office",footage: 670,rate: nil,tenant: nil},
{suite: "F105",office: "F32",hoods: nil,type: "Office",footage: 385,rate: nil,tenant: "Blue Ocean Technologies"},
{suite: "G102",office: "F30",hoods: nil,type: "Office",footage: 390,rate: nil,tenant: "Salesity"},
{suite: "G104",office: "F29",hoods: nil,type: "Office",footage: 420,rate: nil,tenant: "Salesity"},
{suite: "G105",office: "F27",hoods: nil,type: "Office",footage: 1170,rate: nil,tenant: "Talent Quest"},
{suite: "G106",office: "F28",hoods: nil,type: "Office",footage: 430,rate: nil,tenant: "Massive Media"},
{suite: "H101",office: "F23",hoods: nil,type: "Office",footage: 200,rate: nil,tenant: "2B Solutions"},
{suite: "H102",office: "F22",hoods: nil,type: "Office",footage: 1130,rate: nil,tenant: "2B Solutions"},
{suite: "H103",office: "F19",hoods: nil,type: "Office",footage: 1495,rate: nil,tenant: "ComplyMD"},
{suite: "L101",office: "M01",hoods: false,type: "Lab",footage: 685,rate: nil,tenant: "BioDtech"},
{suite: "L102",office: "L05",hoods: false,type: "Lab",footage: 885,rate: nil,tenant: nil},
{suite: "L103",office: "M02",hoods: false,type: "Lab",footage: 825,rate: nil,tenant: nil},
{suite: "L105",office: "M03",hoods: true,type: "Lab",footage: 835,rate: nil,tenant: nil},
{suite: "L106",office: "L06",hoods: false,type: "Lab",footage: 545,rate: nil,tenant: "IceBox Coffee"},
{suite: "L107",office: "M04",hoods: true,type: "Lab",footage: 835,rate: nil,tenant: "ADV Bioscience"},
{suite: "L108",office: "L07",hoods: true,type: "Lab",footage: 835,rate: nil,tenant: nil},
{suite: "L109",office: "M05",hoods: false,type: "Lab",footage: 835,rate: nil,tenant: nil},
{suite: "L110",office: "L08",hoods: true,type: "Lab",footage: 835,rate: nil,tenant: nil},
{suite: "L112",office: "L09",hoods: false,type: "Lab",footage: 555,rate: nil,tenant: "Advanced Skin Technology"},
{suite: "L113",office: "M07",hoods: true,type: "Lab",footage: 845,rate: nil,tenant: "Immunocreate"},
{suite: "L114",office: "N03",hoods: true,type: "Lab",footage: 835,rate: nil,tenant: "ADV Bioscience"},
{suite: "L115",office: "M08",hoods: true,type: "Lab",footage: 835,rate: nil,tenant: "Soluble Therapeutics"},
{suite: "L116",office: "N02",hoods: true,type: "Lab",footage: 835,rate: nil,tenant: "Soluble Therapeutics"},
{suite: "L117",office: "M09",hoods: false,type: "Lab",footage: 835,rate: nil,tenant: "Soluble Therapeutics"},
{suite: "L118",office: "N01",hoods: false,type: "Lab",footage: 1000,rate: nil,tenant: "Soluble Therapeutics"},
{suite: "L121",office: "N04",hoods: false,type: "Lab",footage: 970,rate: nil,tenant: "BioGX"},
{suite: "L123",office: "N05",hoods: true,type: "Lab",footage: 970,rate: nil,tenant: "BioGX"},
{suite: "L125",office: "N06",hoods: true,type: "Lab",footage: 660,rate: nil,tenant: "BioGX"},
{suite: "L131",office: "L15",hoods: true,type: "Lab",footage: 625,rate: nil,tenant: "GTI"},
{suite: "L133",office: "L14",hoods: true,type: "Lab",footage: 1050,rate: nil,tenant: "NuCell"},
{suite: "L134",office: "P01",hoods: nil,type: "Office",footage: 1580,rate: nil,tenant: "GTI"},
{suite: "L135",office: "L13",hoods: false,type: "Lab",footage: 695,rate: nil,tenant: "Choice Research"},
{suite: "L136",office: "P03",hoods: nil,type: "Office",footage: 310,rate: nil,tenant: "Endomimetics"},
{suite: "L138",office: "P04",hoods: nil,type: "Office",footage: 310,rate: nil,tenant: "BioGX"},
{suite: "L140",office: "P05",hoods: nil,type: "Office",footage: 1410,rate: nil,tenant: "ThinkData"},
{suite: "L142",office: "P06",hoods: nil,type: "Office",footage: 975,rate: nil,tenant: "ThinkData"},
{suite: "M126",office: "E01",hoods: nil,type: "Cafe",footage: 3750,rate: nil,tenant: "Culinard Cafe"},
{suite: "M128",office: "E04",hoods: nil,type: "Office",footage: 3140,rate: nil,tenant: "Atlas RFID"},
{suite: "M129",office: "D02",hoods: nil,type: "Office",footage: 690,rate: nil,tenant: "Runtime Computing"},
{suite: "M130",office: "E06",hoods: nil,type: "Office",footage: 225,rate: nil,tenant: "Timberline Investments"},
{suite: "M132",office: "E07",hoods: nil,type: "Office",footage: 225,rate: nil,tenant: "Metrocket"},
{suite: "M133",office: "D03",hoods: nil,type: "Office",footage: 880,rate: nil,tenant: "Birmingham International Center"},
{suite: "M134",office: "E08",hoods: nil,type: "Office",footage: 225,rate: nil,tenant: "My Supply Chain Group"},
{suite: "M135",office: "D04",hoods: nil,type: "Office",footage: 360,rate: nil,tenant: "Appsolute Genius"},
{suite: "M136",office: "E09",hoods: nil,type: "Office",footage: 2350,rate: nil,tenant: "Atlas RFID"},
{suite: "M138",office: "E10",hoods: nil,type: "Office",footage: 225,rate: nil,tenant: "Suture Health"},
{suite: "M141",office: "D20",hoods: nil,type: "Office",footage: 550,rate: nil,tenant: "Innovative Home Builders"},
{suite: "M142",office: "E12",hoods: nil,type: "Office",footage: 225,rate: nil,tenant: nil},
{suite: "M144",office: "E13",hoods: nil,type: "Office",footage: 225,rate: nil,tenant: nil},
{suite: "M146",office: "E14",hoods: nil,type: "Office",footage: 320,rate: nil,tenant: nil},
{suite: "R103",office: "K01",hoods: nil,type: "Office",footage: 1400,rate: nil,tenant: "Remtech"},
{suite: "R107",office: "J01",hoods: nil,type: "Office",footage: 265,rate: nil,tenant: "Zertis"},
{suite: "R108",office: "C18",hoods: nil,type: "Office",footage: 420,rate: nil,tenant: "Magnolia River Services"},
{suite: "R109",office: "J02",hoods: nil,type: "Office",footage: 270,rate: nil,tenant: "Internet Broadcasting Corporation"},
{suite: "R112",office: "C19",hoods: nil,type: "Office",footage: 835,rate: nil,tenant: "VIPAAR"},
{suite: "R115",office: "J05",hoods: nil,type: "Office",footage: 350,rate: nil,tenant: "Slade LETP"},
{suite: "R117",office: "H01",hoods: nil,type: "Office",footage: 825,rate: nil,tenant: "FreeTextbooks.com"},
{suite: "R118",office: "C21",hoods: nil,type: "Office",footage: 1970,rate: nil,tenant: "ASBDC"},
{suite: "R123",office: "H02",hoods: nil,type: "Office",footage: 1430,rate: nil,tenant: "Advanced Skin Technology"},
{suite: "R125",office: "G01",hoods: nil,type: "Office",footage: 280,rate: nil,tenant: "IPG Photonics"},
{suite: "R127",office: "G02",hoods: nil,type: "Office",footage: 220,rate: nil,tenant: "IPG Photonics"},
{suite: "R129",office: "G03",hoods: nil,type: "Office",footage: 220,rate: nil,tenant: "IPG Photonics"},
{suite: "R131",office: "G04G",hoods: nil,type: "Office",footage: 190,rate: nil,tenant: "IPG Photonics"},
{suite: "R133",office: "G04E",hoods: nil,type: "Office",footage: 190,rate: nil,tenant: "IPG Photonics"},
{suite: "R134",office: "D13",hoods: nil,type: "Office",footage: 800,rate: nil,tenant: "Strada Professional Services"},
{suite: "R135",office: "G04D",hoods: nil,type: "Office",footage: 190,rate: nil,tenant: "IPG Photonics"},
{suite: "R136",office: "D27",hoods: nil,type: "Office",footage: 330,rate: nil,tenant: "Concert Care"},
{suite: "R137",office: "G04B",hoods: nil,type: "Office",footage: 190,rate: nil,tenant: "IPG Photonics"},
{suite: "R142",office: "D26",hoods: nil,type: "Office",footage: 500,rate: nil,tenant: "IT Rockstars"},
{suite: "R145",office: "G05",hoods: nil,type: "Office",footage: 860,rate: nil,tenant: "Integrated Media Systems"}
]

office_attribute = RoomAttribute.where(abbreviation: 'office').first
lab_attribute = RoomAttribute.where(abbreviation: 'lab').first
hood_attribute = RoomAttribute.where(abbreviation: 'hood').first
gym_attribute = RoomAttribute.where(abbreviation: 'gym').first

input_data.each do |seed|
  tenant = Tenant.find_or_create_by_name(seed[:tenant]) if seed[:tenant]
  room = Room.create(name: seed[:suite],
                     square_footage: seed[:footage],
                     other_names: seed[:office]
                     )
  room.tenants << tenant if tenant
  next unless room
  if seed[:type] == 'Lab'
    room.room_attributes << lab_attribute
  elsif seed[:type] == 'Gym/Think Room'
    room.room_attributes << gym_attribute
  end
  room.room_attributes << hood_attribute if seed[:hoods]
  room.save

  u = User.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
  u.confirm! if u

end
