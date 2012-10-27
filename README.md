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
# [:lorem, :shining]

puts Chock.lorem.sentences(3)
# Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip...
# Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt...
# Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea...

puts Chock.lorem.paragraph
# Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat...

shining = Chock.shining

puts shining.sentence
# All work nd no play makes Jack a dull boy.

puts shining.paragraphs(2)
# All work and no play makes Jack a dull boy. All work and no play makEs Jack a dull boy...
# Al work and no play makes Jack a dull boy. All work and no play makes Jack a dull boy...
```

## Modes

### Lorem

The text sample we all know and love. See [lipsum.com](http://www.lipsum.com/) to learn more about it than you probably care to.

### Shining

Inspired by [this scene](http://www.youtube.com/watch?v=NgMdz2fe0CY) from Kubrick's classic. A smattering of random typographical errors are thrown in to more closely fit the movie versions. Various page formattings are in the works.

## WIP

- more complex formattings
- more generators
- binary for CLI output
