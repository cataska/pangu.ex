defmodule PanguTest do
  use ExUnit.Case
  doctest Pangu

  test "Spacing" do
    assert Pangu.spacing("新八的構造成分有95%是眼鏡、3%是水、2%是垃圾") == "新八的構造成分有 95% 是眼鏡、3% 是水、2% 是垃圾"
    assert Pangu.spacing("所以,請問Jackey的鼻子有幾個?3.14個!") == "所以, 請問 Jackey 的鼻子有幾個? 3.14 個!"
    assert Pangu.spacing("JUST WE就是JUST WE，既不偉大也不卑微！") == "JUST WE 就是 JUST WE，既不偉大也不卑微！"
    assert Pangu.spacing("搭載MP3播放器，連續播放時數最長達到124小時的超強利刃……菊一文字RX-7!") == "搭載 MP3 播放器，連續播放時數最長達到 124 小時的超強利刃…… 菊一文字 RX-7!"
    assert Pangu.spacing("V") == "V"
  end

  test "Spacing text" do
    assert Pangu.spacing("Mr.龍島主道：「Let's Party!各位高明博雅君子！」") == "Mr. 龍島主道：「Let's Party! 各位高明博雅君子！」"
  end

  test "Latin1 Supplement" do
    assert Pangu.spacing("中文Ø漢字") == "中文 Ø 漢字"
    assert Pangu.spacing("中文 Ø 漢字") == "中文 Ø 漢字"
  end

  test "General Punctuation" do
    assert Pangu.spacing("中文•漢字") == "中文 • 漢字"
    assert Pangu.spacing("中文 • 漢字") == "中文 • 漢字"
  end

  test "Number Forms" do
    assert Pangu.spacing("中文Ⅶ漢字") == "中文 Ⅶ 漢字"
    assert Pangu.spacing("中文 Ⅶ 漢字") == "中文 Ⅶ 漢字"
  end

  test "CJK Radicals Supplement" do
    assert Pangu.spacing("abc⻤123") == "abc ⻤ 123"
    assert Pangu.spacing("abc ⻤ 123") == "abc ⻤ 123"
  end

  test "Kangxi Radicals" do
    assert Pangu.spacing("abc⾗123") == "abc ⾗ 123"
    assert Pangu.spacing("abc ⾗ 123") == "abc ⾗ 123"
  end

  test "Hiragana" do
    assert Pangu.spacing("abcあ123") == "abc あ 123"
    assert Pangu.spacing("abc あ 123") == "abc あ 123"
  end

  test "Katakana" do
    assert Pangu.spacing("abcア123") == "abc ア 123"
    assert Pangu.spacing("abc ア 123") == "abc ア 123"
  end

  test "Bopomofo" do
    assert Pangu.spacing("abcㄅ123") == "abc ㄅ 123"
    assert Pangu.spacing("abc ㄅ 123") == "abc ㄅ 123"
  end

  test "Enclosed CJK Letters and Months" do
    assert Pangu.spacing("abc㈱123") == "abc ㈱ 123"
    assert Pangu.spacing("abc ㈱ 123") == "abc ㈱ 123"
  end

  test "Quote" do
    assert Pangu.spacing("前面\"中文123漢字\"後面") == "前面 \"中文 123 漢字\" 後面"
  end

end
