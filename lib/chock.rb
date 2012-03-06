require 'chock/version'
require 'chock/generator'
Dir[File.dirname(__FILE__) + '/chock/output/*.rb'].each { |file| require file }

class Chock
  class << self
    def modes
      Generator.modes.keys
    end

    Generator.modes.keys.each do |mode|
      define_method mode do
        Generator.modes[mode].new
      end
    end
  end
end
