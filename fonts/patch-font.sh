#!/usr/bin/env sh

# Explanation of options: https://github.com/ryanoasis/nerd-fonts/wiki/ScriptOptions
# Related Github issue thread: https://github.com/Powerlevel9k/powerlevel9k/issues/430

docker run --rm \
  -v ~/fonts/origin:/in \
  -v ~/fonts/patched:/out \
  nerdfonts/patcher \
  --progressbars \
  --adjust-line-height \
  --variable-width-glyphs \
  --complete
