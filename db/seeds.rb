# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: 'admin', email: 'admin@gmail.com', cpf: '07644271481', password: '123123', password_confirmation: '123123', type: 'Admin')
User.create(name: 'Funcionario1', email: 'func1@gmail.com', cpf: '07644271481', cellphone: '83888888888', password: '123123', password_confirmation: '123123', type: 'Employee')
User.first.update!(email: 'a@mail.com', password: '123123', password_confirmation: '123123', type: 'Customer', cellphone: '83996447337')

1.upto 10 do |n|
  Activity.create(name: "Atividade #{n}", description: "Descrição da atividade #{n}", user_id: 224790)
end