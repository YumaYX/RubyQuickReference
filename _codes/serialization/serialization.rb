person = { name: "Alice", age: 30 }
serialized_person = Marshal.dump(person)

File.open('person.dat', 'wb') do |file|
  file.write(serialized_person)
end
