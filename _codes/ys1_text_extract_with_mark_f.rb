require "ys1"

pac = YS1::Text.extract_with_mark_f("ys1_text_extract_with_mark_f.txt", /^header/)
pac.class
