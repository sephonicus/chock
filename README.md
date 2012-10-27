# Chock

Chock is a small library used for outputting example text and markup structures.

## Installation

### Standalone

`gem install chock`

### Rails

Add the chock gem to your project's gem manifest and bundle:

```bash
gem chock
bundle
```

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

### Lorem

The text sample we all know and love. See [lipsum.com](http://www.lipsum.com/) to learn more about it than you probably care to.

### Shining

Inspired by [this scene](http://www.youtube.com/watch?v=NgMdz2fe0CY) from Kubrick's classic. A smattering of random typographical errors are thrown in to more closely fit the movie versions. Various page formattings are in the works.

## WIP

- markup structures
- more complex formattings
- more generators
- binary for CLI output
