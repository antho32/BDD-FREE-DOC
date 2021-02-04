require 'faker'

Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all

10.times do
  city = City.create!(name: Faker::Address.city)
end

10.times do
doctor = Doctor.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  zip_code: Faker::Address.zip_code,
  )
end

Specialty.create!(specialty: "Généraliste")
Specialty.create!(specialty: "Dentiste")
Specialty.create!(specialty: "chirurgien")
Specialty.create!(specialty: "kinesitherapeute")
Specialty.create!(specialty: "occuliste")

10.times do
patient = Patient.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  )
end

10.times do
appointment = Appointment.create!(
  doctor: Doctor.all.sample,
  patient: Patient.all.sample,
  doctor_id: Doctor.all.sample.id,
  patient_id: Patient.all.sample.id,
  date: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today),
  city_id: City.all.sample.id,
  )
end

10.times do
    join = Doctorspecialty.create!(doctor: Doctor.all.select(:id).sample, specialty: Specialty.all.select(:id).sample)
end