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
area1 = Area.create(code: '001', name: 'Departamento de Informática I', institute: institute);
area2 = Area.create(code: '002', name: 'Departamento de Informática II', institute: institute);
area3 = Area.create(code: '003', name: 'Departamento de Física I', institute: institute);
area4 = Area.create(code: '004', name: 'Departamento de Física II', institute: institute);
area5 = Area.create(code: '005', name: 'Departamento de Quimica I', institute: institute);
area6 = Area.create(code: '006', name: 'Departamento de Biologia I', institute: institute);
area7 = Area.create(code: '007', name: 'Sala de Profesores', institute: institute);
area8 = Area.create(code: '008', name: 'Salón de recursos POP', institute: institute);
area9 = Area.create(code: '009', name: 'Cafetería', institute: institute);

recurso7 = Resource.create(code: '00001', name: 'Salon 01', description: 'zona de estudio', capacity: 1)
recurso1 = Resource.create(code: '00002', name: 'Computadora', description: 'Fecha del equipo 2014', capacity: 1, resource: recurso7)
recurso2 = Resource.create(code: '00003', name: 'Mouse', description: '', capacity: 1, resource: recurso1)
recurso3 = Resource.create(code: '00004', name: 'Teclado', description: '', capacity: 1, resource: recurso1)
recurso4 = Resource.create(code: '00005', name: 'Monitor', description: '', capacity: 1, resource: recurso1)
recurso5 = Resource.create(code: '00006', name: 'CPU', description: '', capacity: 1, resource: recurso1)
recurso6 = Resource.create(code: '00007', name: 'Impresora', description: '', capacity: 1, resource: recurso7)

p 'Fin seed'
