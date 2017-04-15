# RandPalette

Randomly pick distinct color

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rand_palette'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rand_palette

## Usage

```ruby
irb(main):001:0> RandPalette.random 5
=> ["rgba(255,0,221,1)", "rgba(255,85,0,1)", "rgba(119,255,0,1)", "rgba(0,255,187,1)", "rgba(0,17,255,1)"]
irb(main):002:0> RandPalette.random 3, alpha: 0.2
=> ["rgba(0,255,153,0.2)", "rgba(153,0,255,0.2)", "rgba(255,153,0,0.2)"]
```

