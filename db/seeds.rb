# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Ailment.destroy_all
Ailment.create(name: 'ADHD/ADD')
Ailment.create(name: 'Alcoholism')
Ailment.create(name: 'ALS (Lou Gehrig\'s)')
Ailment.create(name: 'Alzheimer’s Disease')
Ailment.create(name: 'Anorexia (eating disorders)')
Ailment.create(name: 'Anxiety Disorders')
Ailment.create(name: 'Arthritis')
Ailment.create(name: 'Asthma')
Ailment.create(name: 'Autism')
Ailment.create(name: 'Bipolar Disorder')
Ailment.create(name: 'Bladder Cancer/Dysfunction')
Ailment.create(name: 'Brain Cancer')
Ailment.create(name: 'Breast Cancer')
puts "There are #{Ailment.count} ailments in the database"


