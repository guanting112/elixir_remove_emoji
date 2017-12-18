defmodule RemoveEmoji do
  alias RemoveEmoji.Rules

  def sanitize(value) do
    Rules.emoji_codepoints |> Regex.replace(value, "")
  end
end
