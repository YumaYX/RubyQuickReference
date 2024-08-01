serialized_person = File.read('person.dat')
person = Marshal.load(serialized_person)