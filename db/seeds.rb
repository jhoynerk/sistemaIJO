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
area1 = Area.create(code: 'DPI1', reservable: true, name: 'Departamento de Informática I', institute: institute);
area2 = Area.create(code: 'DPI2', reservable: true, name: 'Departamento de Informática II', institute: institute);
area3 = Area.create(code: 'DPF1', reservable: true, name: 'Departamento de Física I', institute: institute);
area4 = Area.create(code: 'DPF2', reservable: true, name: 'Departamento de Física II', institute: institute);
area5 = Area.create(code: 'DPQ1', reservable: true, name: 'Departamento de Quimica I', institute: institute);
area6 = Area.create(code: 'DPB1', reservable: true, name: 'Departamento de Biologia I', institute: institute);
area7 = Area.create(code: 'SDP', reservable: true, name: 'Sala de Profesores', institute: institute);
area8 = Area.create(code: 'POP', reservable: true, name: 'Salón de recursos POP', institute: institute);
area9 = Area.create(code: 'CAF', reservable: true, name: 'Cafetería', institute: institute);

recurso1 = Resource.create(code: '00002', name: 'Computadora', description: 'Fecha del equipo 2014', area: area1)
recurso2 = Resource.create(code: '00003', name: 'Mouse', description: '', resource: recurso1, area: area1)
recurso3 = Resource.create(code: '00004', name: 'Teclado', description: '', resource: recurso1, area: area1)
recurso4 = Resource.create(code: '00005', name: 'Monitor', description: '', resource: recurso1, area: area1)
recurso5 = Resource.create(code: '00006', name: 'CPU', description: '', resource: recurso1, area: area1)
recurso6 = Resource.create(code: '00007', name: 'Impresora', description: '', area: area1)

(1..21).each do |e|
  Resource.create(code: "EQP#{e}", name: 'Computadora', description: 'Fecha del equipo 2014', area: area1)
end

Beneficiary.create(first_name: 'Prizni',last_name: 'Marquez',email: 'prizni@gmail.com',position: 'Profesora',phone: '555-55-55')
Beneficiary.create(first_name: 'José',last_name: 'Vargas',email: 'jose@gmail.com',position: 'Coordinador',phone: '555-55-55')
Beneficiary.create(first_name: 'Pedro',last_name: 'Salazar',email: 'pedro@gmail.com',position: 'Profesor',phone: '555-55-55')
Beneficiary.create(first_name: 'Daniel',last_name: 'Hernández',email: 'daniel@gmail.com',position: 'Capacitador',phone: '555-55-55')
p 'Fin seed'
