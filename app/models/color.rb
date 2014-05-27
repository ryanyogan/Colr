class Color
  PROPERTIES = [:timestamp, :hex, :id, :tags]
  PROPERTIES.each { |prop|
    attr_accessor prop
  }

  def self.find(hex, &block)
    BW::HTTP.get("http://www.colr.org/json/color/#{hex}") do |response|
      p response.body.to_str
      block.call(nil)
    end
  end

  def initialize(hash = {})
    hash.each { |key, value|
      if PROPERTIES.member? key.to_sym
        self.send((key.to_s + "=").to_s, value)
      end
    }
  end

  def tags
    @tags ||= []
  end

  def tags=(tags)
    if tags.first.is_a? Hash
      tags = tags.map { |tag| Tag.new(tag) }
    end

    tags.each { |tag|
      if not tag.is_a? Tag
        raise "Wrong type for tag, #{tag.inspect}"
      end
    }

    @tags = tags
  end
end
