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

## Modes

# Lorem

The text sample we all know and love. See [lipsum.com](http://www.lipsum.com/) to learn more about it than you probably care to.

# Shining

Inspired by [this scene](http://www.youtube.com/watch?v=NgMdz2fe0CY) from Kubrick's classic. A smattering of random typographical errors are thrown in to more closely fit the movie versions. Various page formattings are in the works.

## WIP

More complicated formattings, markup structures, generators for famous authors, other interesting text samples.
