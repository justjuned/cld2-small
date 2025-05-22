# Compact Language Detection 2.0(Updated to latest CLD2 source code)

Based on Jason Toy's CLD v1.0.

Based on BanjoInc's CLD v2.0.

Blazing-fast language detection for Ruby provided using Compact Language Detector v2.0

### NOTE: Using smaller verison of CLD2 currently.

## How to Use

The `detect_language` method returns a hash with the language name, code, and reliability.

```ruby
CLD.detect_language("Working as expected")
# => {:name => "ENGLISH", :code => "en", :reliable => true}

CLD.detect_language("plus ça change, plus c'est la même chose")
# => {:name => "FRENCH", :code => "fr", :reliable => true}
```

**Options**

You can pass an options hash as the second argument to `detect_language`:

```ruby
CLD.detect_language(text, options = {})
```

Available options:

*   `:is_plain_text` (Boolean, default: `true`): Set to `false` if the input text is HTML. CLD2 will then try to skip HTML tags.
*   `:best_effort` (Boolean, default: `false`): If `true`, CLD2 will give its best-effort answer, even on short or ambiguous text, instead of potentially returning "Unknown".
*   `:tld_hint` (String, default: `nil`): A Top-Level Domain hint (e.g., `"id"`, `"us"`) to boost detection accuracy for languages associated with that TLD.
*   `:content_language_hint` (String, default: `nil`): An HTTP Content-Language header style hint (e.g., `"en,fr"`) to boost detection for the specified languages.
*   `:score_as_quads` (Boolean, default: `false`): Forces CLD2 to use quadgram-based scoring for certain languages that are normally detected by script alone. This can be a refinement for more meaningful text detection in those languages but depends on CLD2's internal data tables.

**Examples with Options:**

```ruby
# Using best_effort for short text
CLD.detect_language("test", best_effort: true)
# => Might return a language like {:name => "ENGLISH", :code => "en", :reliable => false}
#    instead of "Unknown"

# Providing a TLD hint
CLD.detect_language("Ini adalah teks dalam bahasa Indonesia", tld_hint: "id")
# => {:name => "INDONESIAN", :code => "id", :reliable => true}

# Providing a content language hint
CLD.detect_language("Ceci est un texte en français.", content_language_hint: "fr,en")
# => {:name => "FRENCH", :code => "fr", :reliable => true}

# Using score_as_quads (example, effect depends on text and CLD2 tables)
CLD.detect_language("Ελληνικό κείμενο", score_as_quads: true)
# => May provide a more refined result for Greek
```

## Installation

Add this line to your application's Gemfile:

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
