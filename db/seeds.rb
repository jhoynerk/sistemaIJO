# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


u = User.create(username: 'prizni', email: 'prizni@gmail.com', password: 'password', password_confirmation: 'password');
p u.username 
institute = Institute.create(code: '001', name: 'Instituto Técnico Jesús Obrero');
p institute.name
area1 = Area.create(code: '001', reservable: true, name: 'Departamento de Informática I', institute: institute);
area2 = Area.create(code: '002', reservable: true, name: 'Departamento de Informática II', institute: institute);
area3 = Area.create(code: '003', reservable: true, name: 'Departamento de Física I', institute: institute);
area4 = Area.create(code: '004', reservable: true, name: 'Departamento de Física II', institute: institute);
area5 = Area.create(code: '005', reservable: true, name: 'Departamento de Quimica I', institute: institute);
area6 = Area.create(code: '006', reservable: true, name: 'Departamento de Biologia I', institute: institute);
area7 = Area.create(code: '007', reservable: true, name: 'Sala de Profesores', institute: institute);
area8 = Area.create(code: '008', reservable: true, name: 'Salón de recursos POP', institute: institute);
area9 = Area.create(code: '009', reservable: true, name: 'Cafetería', institute: institute);

recurso1 = Resource.create(code: '00002', name: 'Computadora', description: 'Fecha del equipo 2014', area: area1)
recurso2 = Resource.create(code: '00003', name: 'Mouse', description: '', resource: recurso1, area: area1)
recurso3 = Resource.create(code: '00004', name: 'Teclado', description: '', resource: recurso1, area: area1)
recurso4 = Resource.create(code: '00005', name: 'Monitor', description: '', resource: recurso1, area: area1)
recurso5 = Resource.create(code: '00006', name: 'CPU', description: '', resource: recurso1, area: area1)
recurso6 = Resource.create(code: '00007', name: 'Impresora', description: '', area: area1)

(1..21).each do |e|
  Resource.create(code: "EQP#{e}", name: 'Computadora', description: 'Fecha del equipo 2014', area: area1)
end

p 'Fin seed'
