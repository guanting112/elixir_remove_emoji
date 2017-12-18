RemoveEmoji
------

```elixir

original_string = ".👦👦🏻👦🏼👦🏽👦🏾👦🏿👧👧🏻👧🏼👧🏽👧🏾👧🏿👨👨🏻👨🏼👨🏽👨🏾👨🏿👩👩🏻👩🏼👩🏽👩🏾👩🏿."

expect_string = ".."
sanitized_string = original_string |> RemoveEmoji.sanitize()

IO.puts sanitized_string == expect_string

```

Installation
------

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `remove_emoji` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:remove_emoji, "~> 0.1.0"}
  ]
end
```

Demo ( Before / After )
------

![emoji_effect](https://i.imgur.com/OzcQYWL.jpg)
