# Compact Language Detection 2.0(Updated to latest CLD2 source code)

Based on Jason Toy's CLD v1.0.

Based on BanjoInc's CLD v2.0.

Blazing-fast language detection for Ruby provided using Compact Language Detector v2.0

### NOTE: Using smaller verison of CLD2 currently.

## How to Use

```ruby
CLD.detect_language("Working as expected")
# => {:name => "ENGLISH", :code => "en", :reliable => true}

CLD.detect_language("plus ça change, plus c'est la même chose")
# => {:name => "FRENCH", :code => "fr", :reliable => true}
```

## Installation

Add this line to your application's Gemfile:CLD2Owners

```ruby
gem 'cld2-small', require 'cld'
```

And then execute:

```sh
$ bundle
```

## Thanks

Thanks to the Chrome authors, and to Mike McCandless for writing a Python version.

Thanks to Jason Toy for the original cld v1.0 ruby port.

Thanks to BanjoInc for cld v2.0 ruby port.

Licensed the same as CLD2Owners.
