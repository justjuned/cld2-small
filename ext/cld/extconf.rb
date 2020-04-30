require 'mkmf'

# HACK: mkmf doesn't support multiple subdirs for the same library
$objs = ["cld2/internal/cldutil.o",
  "cld2/internal/cldutil_shared.o",
  "cld2/internal/compact_lang_det.o",
  "cld2/internal/compact_lang_det_hint_code.o",
  "cld2/internal/compact_lang_det_impl.o",
  "cld2/internal/debug.o",
  "cld2/internal/fixunicodevalue.o",
  "cld2/internal/generated_entities.o",
  "cld2/internal/generated_language.o",
  "cld2/internal/generated_ulscript.o",
  "cld2/internal/getonescriptspan.o",
  "cld2/internal/lang_script.o",
  "cld2/internal/offsetmap.o",
  "cld2/internal/scoreonescriptspan.o",
  "cld2/internal/tote.o",
  "cld2/internal/utf8statetable.o",
  "cld2/internal/cld_generated_cjk_uni_prop_80.o",
  "cld2/internal/cld2_generated_cjk_compatible.o",
  "cld2/internal/cld_generated_cjk_delta_bi_4.o",
  "cld2/internal/generated_distinct_bi_0.o",
  "cld2/internal/cld2_generated_quadchrome0122_2.o",
  "cld2/internal/cld2_generated_deltaoctachrome0122.o",
  "cld2/internal/cld2_generated_distinctoctachrome0122.o",
  "cld2/internal/cld_generated_score_quad_octa_0122_2.o",
  "thunk.o"]

$CXXFLAGS += " -std=c++98"

if have_library('stdc++')
  create_makefile('libcld2')
end

# to clean up object files under internal subdirectory.
open('Makefile', 'a') do |f|
  f.write <<EOS

  CLEANOBJS := $(CLEANOBJS) cld2/internal/*.#{CONFIG["OBJEXT"]}
EOS
end