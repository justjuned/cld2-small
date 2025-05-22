require_relative "cld/version"
require "ffi"

module CLD
  extend FFI::Library

  # Workaround FFI dylib/bundle issue.  See https://github.com/ffi/ffi/issues/42
  suffix = if FFI::Platform.mac?
    'bundle'
  else
    FFI::Platform::LIBSUFFIX
  end

  # Look in multiple possible locations
  possible_paths = [
    File.expand_path("../cld/libcld2.#{suffix}", __FILE__),
    File.expand_path("../../ext/cld/libcld2.#{suffix}", __FILE__),
    File.join(File.expand_path("../../ext/cld", __FILE__), "libcld2.#{suffix}")
  ]

  lib_path = possible_paths.find { |path| File.exist?(path) }
  raise LoadError, "Could not find libcld2.#{suffix} in #{possible_paths.join(', ')}" unless lib_path

  ffi_lib lib_path

  def self.detect_language(text, options = {})
    is_plain_text = options.fetch(:is_plain_text, true)
    best_effort = options.fetch(:best_effort, false)
    tld_hint = options.fetch(:tld_hint, nil)
    content_language_hint = options.fetch(:content_language_hint, nil)
    score_as_quads = options.fetch(:score_as_quads, false)

    result = detect_language_ext(text.to_s,
                                 is_plain_text,
                                 best_effort,
                                 tld_hint,
                                 content_language_hint,
                                 score_as_quads)
    Hash[ result.members.map {|member| [member.to_sym, result[member]]} ]
  end

  private

  class ReturnValue < FFI::Struct
    layout :name, :string, :code, :string, :reliable, :bool
  end

  attach_function "detect_language_ext", "detectLanguageThunkInt",
                  [:buffer_in, :bool, :bool, :string, :string, :bool],
                  ReturnValue.by_value
end
