class Color
  PROPATIES = [:timestamp, :hex, :id, :tags]
  PROPATIES.each { |prop|
    attr_accessor prop
  }

  def initialize(hash = {})
    hash.each { |key, value|
      if PROPATIES.member? key.to_sym
        self.send((key.to_s + "=").to_s, value)
      end
    }
  end

  def tags
    @tags ||= []
  end

  def tags=(tags)
    if tags.first.is_a? Hash
      tags = tags.collect { |tag| Tags.new(tag) }
    end

    tags.each { |tag|
      if not tag.is_a? Tag
        raise "Wrong class for attempted tag #{tag.inspect}"
      end
     }
    
    @tags = tags
  end
end
