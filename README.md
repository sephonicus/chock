# Chock

Chock is a small library used for outputting example text and markup structures.

## Installation

`gem install chock`

## Usage

```ruby
require 'chock'

Chock.modes

puts Chock.lorem.sentences(5)
puts Chock.lorem.paragraph

shining = Chock.shining
puts shining.sentence
puts shining.paragraphs(2)
```
