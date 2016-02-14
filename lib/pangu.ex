defmodule Pangu do
  # \u2e80-\u2eff CJK Radicals Supplement
  # \u2f00-\u2fdf Kangxi Radicals
  # \u3040-\u309f Hiragana
  # \u30a0-\u30ff Katakana
  # \u3100-\u312f Bopomofo
  # \u3200-\u32ff Enclosed CJK Letters and Months
  # \u3400-\u4dbf CJK Unified Ideographs Extension A
  # \u4e00-\u9fff CJK Unified Ideographs
  # \uf900-\ufaff CJK Compatibility Ideographs
  # http://unicode-table.com/en/
  # https://github.com/vinta/pangu

  defp cjk_quote(str) do
    Regex.replace ~r/([\x{2e80}-\x{2eff}\x{2f00}-\x{2fdf}\x{3040}-\x{309f}\x{30a0}-\x{30ff}\x{3100}-\x{312f}\x{3200}-\x{32ff}\x{3400}-\x{4dbf}\x{4e00}-\x{9fff}\x{f900}-\x{faff}])(["])/u, str, "\\1 \\2"
  end

  defp quote_cjk(str) do
	  Regex.replace ~r/(["])([\x{2e80}-\x{2eff}\x{2f00}-\x{2fdf}\x{3040}-\x{309f}\x{30a0}-\x{30ff}\x{3100}-\x{312f}\x{3200}-\x{32ff}\x{3400}-\x{4dbf}\x{4e00}-\x{9fff}\x{f900}-\x{faff}])/u, str, "\\1 \\2"
  end

  defp fix_quote(str) do
	  Regex.replace ~r/(["'\(\[\{<\x{201c}]+)(\s*)(.+?)(\s*)(["'\)\]\}>\x{201d}]+)/u, str, "\\1\\3\\5"
  end

  defp fix_single_quote(str) do
	  Regex.replace ~r/([\x{2e80}-\x{2eff}\x{2f00}-\x{2fdf}\x{3040}-\x{309f}\x{30a0}-\x{30ff}\x{3100}-\x{312f}\x{3200}-\x{32ff}\x{3400}-\x{4dbf}\x{4e00}-\x{9fff}\x{f900}-\x{faff}])( )(')([A-Za-z])/u, str, "\\1\\3\\4"
  end

  defp spacing_quote(str) do
	  str
    |> cjk_quote
    |> quote_cjk
    |> fix_quote
    |> fix_single_quote
  end

  defp cjk_hash(str) do
	  Regex.replace ~r/([\x{2e80}-\x{2eff}\x{2f00}-\x{2fdf}\x{3040}-\x{309f}\x{30a0}-\x{30ff}\x{3100}-\x{312f}\x{3200}-\x{32ff}\x{3400}-\x{4dbf}\x{4e00}-\x{9fff}\x{f900}-\x{faff}])(#(\S+))/u, str, "\\1 \\2"
  end

  defp hash_cjk(str) do
	  Regex.replace ~r/((\S+)#)([\x{2e80}-\x{2eff}\x{2f00}-\x{2fdf}\x{3040}-\x{309f}\x{30a0}-\x{30ff}\x{3100}-\x{312f}\x{3200}-\x{32ff}\x{3400}-\x{4dbf}\x{4e00}-\x{9fff}\x{f900}-\x{faff}])/u, str, "\\1 \\3"
  end

  defp spacing_hash(str) do
	  str
    |> cjk_hash
    |> hash_cjk
  end

  defp cjk_operator_ans(str) do
	  Regex.replace ~r/([\x{2e80}-\x{2eff}\x{2f00}-\x{2fdf}\x{3040}-\x{309f}\x{30a0}-\x{30ff}\x{3100}-\x{312f}\x{3200}-\x{32ff}\x{3400}-\x{4dbf}\x{4e00}-\x{9fff}\x{f900}-\x{faff}])([\+\-\*\/=&\\|<>])([A-Za-z0-9])/u, str, "\\1 \\2 \\3"
  end

  defp ans_operator_cjk(str) do
	  Regex.replace ~r/([A-Za-z0-9])([\+\-\*\/=&\\|<>])([\x{2e80}-\x{2eff}\x{2f00}-\x{2fdf}\x{3040}-\x{309f}\x{30a0}-\x{30ff}\x{3100}-\x{312f}\x{3200}-\x{32ff}\x{3400}-\x{4dbf}\x{4e00}-\x{9fff}\x{f900}-\x{faff}])/u, str, "\\1 \\2 \\3"
  end

  defp spacing_operator(str) do
	  str
    |> cjk_operator_ans
    |> ans_operator_cjk
  end

  defp cjk_bracket_cjk(str) do
	  Regex.replace ~r/([\x{2e80}-\x{2eff}\x{2f00}-\x{2fdf}\x{3040}-\x{309f}\x{30a0}-\x{30ff}\x{3100}-\x{312f}\x{3200}-\x{32ff}\x{3400}-\x{4dbf}\x{4e00}-\x{9fff}\x{f900}-\x{faff}])([\(\[\{<\x{201c}]+(.*?)[\)\]\}>\x{201d}]+)([\x{2e80}-\x{2eff}\x{2f00}-\x{2fdf}\x{3040}-\x{309f}\x{30a0}-\x{30ff}\x{3100}-\x{312f}\x{3200}-\x{32ff}\x{3400}-\x{4dbf}\x{4e00}-\x{9fff}\x{f900}-\x{faff}])/u, str, "\\1 \\2 \\4"
  end

  defp cjk_bracket(str) do
	  Regex.replace ~r/([\x{2e80}-\x{2eff}\x{2f00}-\x{2fdf}\x{3040}-\x{309f}\x{30a0}-\x{30ff}\x{3100}-\x{312f}\x{3200}-\x{32ff}\x{3400}-\x{4dbf}\x{4e00}-\x{9fff}\x{f900}-\x{faff}])([\(\[\{<\x{201c}>])/u, str, "\\1 \\2"
  end

  defp bracket_cjk(str) do
	  Regex.replace ~r/([\)\]\}>\x{201d}<])([\x{2e80}-\x{2eff}\x{2f00}-\x{2fdf}\x{3040}-\x{309f}\x{30a0}-\x{30ff}\x{3100}-\x{312f}\x{3200}-\x{32ff}\x{3400}-\x{4dbf}\x{4e00}-\x{9fff}\x{f900}-\x{faff}])/u, str, "\\1 \\2"
  end

  defp fix_bracket(str) do
	  Regex.replace ~r/([\(\[\{<\x{201c}]+)(\s*)(.+?)(\s*)([\)\]\}>\x{201d}]+)/u, str, "\\1\\3\\5"
  end

  defp spacing_bracket(str) do
    old_str = str
	  new_str = str |> cjk_bracket_cjk
    str = new_str
    if old_str == new_str do
      str = str |> cjk_bracket |> bracket_cjk
    end

    fix_bracket str
  end

  defp fix_symbol(str) do
	  Regex.replace ~r/([\x{2e80}-\x{2eff}\x{2f00}-\x{2fdf}\x{3040}-\x{309f}\x{30a0}-\x{30ff}\x{3100}-\x{312f}\x{3200}-\x{32ff}\x{3400}-\x{4dbf}\x{4e00}-\x{9fff}\x{f900}-\x{faff}])([~!;:,\.\?\x{2026}])([A-Za-z0-9])/u, str, "\\1\\2 \\3"
  end

  defp spacing_symbol(str) do
    fix_symbol str
  end

  defp cjk_ans(str) do
	  Regex.replace ~r<([\x{2e80}-\x{2eff}\x{2f00}-\x{2fdf}\x{3040}-\x{309f}\x{30a0}-\x{30ff}\x{3100}-\x{312f}\x{3200}-\x{32ff}\x{3400}-\x{4dbf}\x{4e00}-\x{9fff}\x{f900}-\x{faff}])([A-Za-z0-9`\$%\^&\*\-=\+\\\|/@\x{00a1}-\x{00ff}\x{2022}\x{2027}\x{2150}-\x{218f}])>u, str, "\\1 \\2"
  end

  defp ans_cjk(str) do
	  Regex.replace ~r<([A-Za-z0-9`~\$%\^&\*\-=\+\\\|/!;:,\.\?\x{00a1}-\x{00ff}\x{2022}\x{2026}\x{2027}\x{2150}-\x{218f}])([\x{2e80}-\x{2eff}\x{2f00}-\x{2fdf}\x{3040}-\x{309f}\x{30a0}-\x{30ff}\x{3100}-\x{312f}\x{3200}-\x{32ff}\x{3400}-\x{4dbf}\x{4e00}-\x{9fff}\x{f900}-\x{faff}])>u, str, "\\1 \\2"
  end

  defp spacing_ans(str) do
	  str
    |> cjk_ans
    |> ans_cjk
  end

  def spacing(str) do
    str
    |> spacing_quote
    |> spacing_hash
    |> spacing_operator
    |> spacing_bracket
    |> spacing_symbol
    |> spacing_ans
  end
end
