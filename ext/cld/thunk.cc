#include <stdio.h>
#include <string.h>
#include "./cld2/internal/lang_script.h"
#include "./cld2/public/compact_lang_det.h"
#include "./cld2/public/encodings.h"

using namespace CLD2;

typedef struct {
  const char *name;
  const char *code;
  bool reliable;
} RESULT;

extern "C" {
  RESULT detectLanguageThunkInt(const char * src,
                                bool is_plain_text,
                                bool best_effort,
                                const char* tld_hint_param,
                                const char* content_lang_hint_param,
                                bool score_as_quads_param) {
    bool is_reliable;
    Language plus_one = UNKNOWN_LANGUAGE;
    int encoding_hint_val = UNKNOWN_ENCODING;
    Language language_hint_val = UNKNOWN_LANGUAGE;

    CLDHints cld_hints = {content_lang_hint_param, tld_hint_param, encoding_hint_val, language_hint_val};

    int flags = 0;
    if (best_effort) {
      flags |= kCLDFlagBestEffort;
    }
    if (score_as_quads_param) {
      flags |= kCLDFlagScoreAsQuads;
    }

    double normalized_score3[3];
    Language language3[3];
    int percent3[3];
    int text_bytes;
    ResultChunkVector resultchunkvector;

    Language lang;
    lang = ExtDetectLanguageSummary(src,
                          strlen(src),
                          is_plain_text,
                          &cld_hints,
                          flags,
                          language3,
                          percent3,
                          normalized_score3,
                          &resultchunkvector,
                          &text_bytes,
                          &is_reliable);

    RESULT res;
    res.name = LanguageName(lang);
    res.code = LanguageCode(lang);
    res.reliable = is_reliable;
    return res;
  }
}

int main(int argc, char **argv) {
}