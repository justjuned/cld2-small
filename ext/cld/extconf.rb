require 'mkmf'

# Add include paths
$INCFLAGS = "-I$(srcdir) -I$(srcdir)/cld2 #{$INCFLAGS}"
$CXXFLAGS += " -std=c++98"

# List object files
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
  "cld2/internal/cld2_generated_quadchrome_2.o",
  "cld2/internal/cld2_generated_deltaoctachrome.o",
  "cld2/internal/cld2_generated_distinctoctachrome.o",
  "cld2/internal/cld_generated_score_quad_octa_2.o",
  "thunk.o"]

if have_library('stdc++')
  # Create makefile with the correct target
  create_makefile('cld/libcld2')
end

# Add clean target
File.open('Makefile', 'a') do |f|
  f.write <<-EOF

clean-local:
\t$(Q)rm -f $(CLEANOBJS) cld2/internal/*.#{CONFIG["OBJEXT"]}
  EOF
end
