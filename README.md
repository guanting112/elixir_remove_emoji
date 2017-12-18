Remove Emoji
=================================================

[![Build Status](https://travis-ci.org/guanting112/elixir_remove_emoji.svg?branch=master)](https://travis-ci.org/guanting112/elixir_remove_emoji)

此為針對「移除」Unicode Emoji 圖示 所開發的專屬套件，
您可以透過該套件移除令人困擾的 Emoji 符號。
( It can remove any of the emoji supported by that package. )

```elixir

original_string = ".👦👦🏻👦🏼👦🏽👦🏾👦🏿👧👧🏻👧🏼👧🏽👧🏾👧🏿👨👨🏻👨🏼👨🏽👨🏾👨🏿👩👩🏻👩🏼👩🏽👩🏾👩🏿."

expect_string = ".."
sanitized_string = original_string |> RemoveEmoji.sanitize()

IO.puts sanitized_string == expect_string

```

Installation / 安裝方式
------

請在您的 Elixir 專案裡的 mix.exs 加入以下指令，然後執行 mix deps.get 更新依賴即可。

```elixir
def deps do
  [
    {:remove_emoji, "~> 1.0.0"}
  ]
end
```

Demo ( Before / After )
------

![emoji_effect](https://i.imgur.com/OzcQYWL.jpg)


LICENSE
--------

MIT LICENSE
