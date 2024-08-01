serialized_person = File.read('person.dat')
Marshal.load(serialized_person)
