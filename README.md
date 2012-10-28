# Chock

Chock is a small library used for outputting example text and markup structures.

## Installation

### Standalone

`gem install chock`

### Rails

Add the chock gem to your project's gem manifest:

`gem 'chock'`

Run `bundle`

## Usage

```ruby
require 'chock'

Chock.modes
# [:lorem, :shining]

Chock.lorem.sentences(3)
# Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip...
# Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt...
# Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea...

Chock.lorem.paragraph
# Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat...

shining = Chock.shining

shining.sentence
# All work nd no play makes Jack a dull boy.

shining.paragraphs(2)
# All work and no play makes Jack a dull boy. All work and no play makEs Jack a dull boy...
# Al work and no play makes Jack a dull boy. All work and no play makes Jack a dull boy...

shining.p_tiny # or p_small, p_medium, p_large
# <p>All work and no play makes Jack a dull boy.</p>

shining.h1 # or h2-h6
# <h1>All work and no play makes Jack a dull boy.</h1>

shining.ol # or ul
# <ol>
# <li>All work and no play makes Jack a dull boy.</li>
# <li>All work and no play makez Jack a dull boy.</li>
# <li>All work and no play makes Jack a dull boy.</li>
# </ol>
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
