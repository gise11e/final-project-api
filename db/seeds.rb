["users","skills","mubees","skills_users","contracts"].each do |table_name|
  ActiveRecord::Base.connection.execute("TRUNCATE #{table_name} RESTART IDENTITY CASCADE")
end

Skill.create!([{
  name:"cinematography"
},{
  name:"videography"
},{
 name:"directing"
},{
 name:"producing"
},{
  name:"acting"
},{
  name:"DOP"
},{
  name:"assisting"
},{
  name:"make up artist"
},{
  name:"best boy"
},{
  name:"video assist"
},{
  name:"editing"
},{
  name:"fx"
},{
  name:"retouching"
},{
  name:"illustration"
},{
  name:"graphic design"
},{
  name:"animation"
},{
  name:"scenography"
},{
  name:"costume design"
},{
  name:"sound design"
},{
  name:"scouting"
},{
  name:"score composition"
},{
  name:"lighting"
},{
  name:"casting"
},{
  name:"art direction"
}])

users = User.create!([{
  full_name: "Francis Forcope",
  username: "francisforcope",
  email: "franco@films.com",
  password: "password",
  password_confirmation: "password",
  crew: true,
  image: "",
  instagram: "@franfilms",
  location: "NYC",
  website: "francofilms.com",
  skill_ids: [1,2,3]
},{
  full_name: "lilly",
  username: "lillyrose",
  email: "lilly@rose.com",
  password: "password",
  password_confirmation: "password",
  crew: true,
  image: "",
 instagram: "@lillyrose",
  location: "nyc",
  website: "lillyrose.com",
  skill_ids: [2,3,4]
},{
  full_name: "Molly Mae",
  username: "mollymae",
  email: "molly@maefilms.com",
  password: "password",
  password_confirmation: "password",
  crew: true,
  image: "",
 instagram: "@mollymae",
  location: "nyc",
  website: "mollymae.com",
  skill_ids: [10,12,18]
},
{
  full_name: "Quentin Von Trier",
  username: "quentino",
  email: "quentino@films.com",
  password: "password",
  password_confirmation: "password",
  crew: true,
  image: "",
 instagram: "@quentino",
  location: "nyc",
  website: "quentino.com",
  skill_ids: [1,6,8]
},
{
  full_name: "Lars Bay",
  username: "laray",
  email: "laray@films.com",
  password: "password",
  password_confirmation: "password",
  crew: true,
  image: "",
 instagram: "@laray",
  location: "nyc",
  website: "larayfilms.com",
  skill_ids: [15,1,17]
},
{
  full_name: "Layla Corrs",
  username: "layla",
  email: "layla@films.com",
  password: "password",
  password_confirmation: "password",
  crew: true,
  image: "",
 instagram: "@layla",
  location: "nyc",
  website: "laylafilms.com",
  skill_ids: [4,1,7]
},
{
  full_name: "Pedro Allen",
  username: "pedrallen",
  email: "pedrallen@films.com",
  password: "password",
  password_confirmation: "password",
  crew: true,
  image: "",
 instagram: "@pedrallen",
  location: "nyc",
  website: "pedrallenfilms.com",
  skill_ids: [9,3,4]
},
{
  full_name: "Mary Lee Hacke",
  username: "marylee",
  email: "marylee@films.com",
  password: "password",
  password_confirmation: "password",
  crew: true,
  image: "",
 instagram: "@marylee",
  location: "nyc",
  website: "maryleefilms.com",
  skill_ids: [9,3,4]
},
{
  full_name: "Woody Alien",
  username: "woodyalien",
  email: "woodyalien@films.com",
  password: "password",
  password_confirmation: "password",
  crew: false,
  image: "",
 instagram: "@woodyalien",
  location: "NYC",
  website: "alienfilms.com",
  skill_ids: [3,4,5]
}])


contracts = Contract.create!([{

title: "Actors Release Form",
content: "
Terms and Conditions

1.	I irrevocably and with full title guaranty assign to the Producer all rights now or hereafter existing in the products of my services in relation to the Mubee and agree that the Producer shall have the sole right to deal with the Mubee containing such contribution or any part of it in any way that he/she thinks fit. I agree that the Mubee incorporating my contribution or any part of it may be exhibited or otherwise however exploited in all media and formats now and hereafter created throughout the universe for the full period of copyright and in perpetuity.

2.	I waive any so-called 'moral rights of authors' in the Mubee and such rights under section 77 and section 80 of the Copyright Designs and Patents Act 1988 (“Act”)  as I now have or hereafter acquire in relation to the Mubee. I irrevocably grant the Producer all consents under Part 11 of the Act in perpetuity.

3.	The Producer may without my further consent use my name, likeness, biography photographs and recordings of interviews with me in exploiting, advertising and publicising the Mubee in all media and formats throughout the world now or hereafter created.

4.	The Producer and its assignees and/or licencees shall not be liable to me or my legal representatives for any loss or damage or injury to me or my property caused or suffered in connection with the Producer's making of the Mubee unless caused by the negligence of the Producer and recoverable on that ground and in the event of any breach by the Producer I agree that I will not be entitled to injunct the Mubee.

5.	I agree that the contribution shall not contain anything which is an infringement of copyright or which is calculated to bring (name of Producer) into disrepute or which is defamatory provided however that the Producer shall not be entitled to bring any claim against me in respect of any defamatory material that was included in my contribution without negligence or malice on my part.

6.	I confirm that the terms of this agreement have been explained to me and that I understand them.

7.	This agreement is the entire agreement between me and the Producer relating to the Mubee and is governed by the laws of England and Wales.
 "

},
{
  title: "Standard Release Form",
  content: "
I hereby authorize Producer to record and edit into the Mubee and related materials my name, likeness, image, voice and participation in and performance on film, tape or otherwise for use in the above Mubee or parts thereof (the “Recordings”).  I agree that the Mubee may be edited and otherwise altered at the sole discretion of the Producer and used in whole or in part for any and all broadcasting, non-broadcasting, audio/visual, and/or exhibition purposes in any manner or media, in perpetuity, throughout the world.

Producer may use and authorize others to use all or parts of the Recordings.  Producer, its successors and assigns shall own all right, title and interest, including copyright, in and to the Mubee, including the Recordings, to be used and disposed of without limitation as Producer shall in its sole discretion determine."}
])

Mubee.create!([{
  title: "Christmas tree animated illustration",
  deadline: "2016-01-08",
  crew: users[1],
  producer: users[3],
  accepted: true,
  location: "Berlin",
  brief: "Christmas tree illustration and animation - .gif ",
  budget: 500,
  contract: contracts[1]
  # lat: ,
  # long:
},{
  title: "London from Tower Bridge panoramic",
  deadline: "2017-01-08",
  crew: users[0],
  producer: users[1],
  accepted: true,
  location: "London",
  brief: "HD panoramic shot of London from Tower Bridge, duration 00:00:50",
  budget: 200,
  contract: contracts[1]
  # lat: ,
  # long:
},{
  title: "Heli Shot",
  deadline: "2017-05-11",
  crew: users[1],
  producer: users[0],
  accepted: true,
  location: "Iceland",
  brief: "heli/drone shot of Reykjavik, duration 00:02:00",
  budget: 500,
  contract: contracts[0]
  # lat: ,
  # long:
}])
