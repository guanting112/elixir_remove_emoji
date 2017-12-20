Remove Emoji
=================================================

[![Build Status](https://travis-ci.org/guanting112/elixir_remove_emoji.svg?branch=master)](https://travis-ci.org/guanting112/elixir_remove_emoji)

It can remove any of the emoji. 💻🔥🤯🚫
您可以透過該套件移除令人困擾的 Emoji 符號。

```elixir

original_string = "👦👦🏻🇯🇵🇰🇳🇰🇷👦🏼👦🏽👦🏾😄😅😆😇😈😉😊"
sanitized_string = original_string |> RemoveEmoji.sanitize()

# true, :ok
IO.puts "" === sanitized_string

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

MIT LICENSE ( See LICENSE.txt )
