# Chock

Chock is a small library used for outputting example text and markup structures.

## Installation

`gem install chock`

## Usage

```ruby
require 'chock'

Chock.modes

ipsum = Chock.new
ipsum.sentence

shining = Chock.new(:mode => :shining)
shining.paragraphs(2)
```
