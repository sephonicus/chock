require 'chock/version'

class Chock
  CONFIG = {
    :lorem => [
      'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
      'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
    ],
    :shining => [
      'All work and no play makes Jack a dull boy.'
    ],
  }
  MODES                  = CONFIG.keys
  DEFAULT_MODE           = MODES.first
  DEFAULT_QUANTITY       = 1
  DEFAULT_PARAGRAPH_SIZE = 5

  attr_reader :mode

  def self.modes
    MODES
  end

  def initialize(options={})
    @mode = options[:mode] || DEFAULT_MODE
    @paragraph_size = options[:paragraph_size] || DEFAULT_PARAGRAPH_SIZE
  end

  def sentences(quantity=nil)
    quantity ||= DEFAULT_QUANTITY
    paragraph_size = 1
    paragraphs(quantity, paragraph_size)
  end
  alias :sentence :sentences

  def paragraphs(quantity=nil, paragraph_size=nil)
    quantity ||= DEFAULT_QUANTITY
    paragraph_size ||= DEFAULT_PARAGRAPH_SIZE
    Array.new(quantity) do
      Array.new(paragraph_size) { CONFIG[mode].sample }.join(' ')
    end.join("\n")
  end
  alias :paragraph :paragraphs
end
