module Example
  struct Value
    property value

    def initialize(@value)
    end

    def render
      "'#{value.to_s}'"
    end

    def lift
      TYPE_DISPATCH.fetch(value.class, Value).new(value)
    end
  end

  struct Integer < Value
    def render
      "#{value.to_s}_i"
    end
  end

  struct Float < Value
    def render
      "#{value.to_s}_f"
    end
  end

  TYPE_DISPATCH = {
    Int => Integer,
    ::Float => Float,
  }
end

puts Example::Value.new("hello world").lift.render
puts Example::Value.new(35).lift.render
puts Example::Value.new(1.5).lift.render
