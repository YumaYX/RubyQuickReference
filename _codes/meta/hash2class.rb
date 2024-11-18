data = { name: "Alice", age: 25, city: "Tokyo" }

obj = Class.new do
  def initialize(hash)
    hash.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end
end.new(data)

obj
obj.name
obj.age
obj.city
