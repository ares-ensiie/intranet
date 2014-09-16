module BSON
  class ObjectId
    def as_json(*args)
      to_s.to_json
    end

    alias :to_json :as_json
  end
end
