module Memoize
  def self.included(klass)
    klass.extend(ClassMethods)
  end

  module ClassMethods
    def memoize(some)
      define_method self.some do |m|
        puts m.class
      end
    end
  end
end


class Example
  include Memoize

  memoize :compute

  def compute
    (0..10000).to_a.each do |a|
      a*10000
    end
  end

  def foo
    puts "#{bar}"
  end

end

start = Time.now

Example.new.compute

step = Time.now

puts step - start

Example.new.compute

puts Time.now - step
