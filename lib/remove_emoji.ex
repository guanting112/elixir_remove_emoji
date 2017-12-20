defmodule RemoveEmoji do
  alias RemoveEmoji.Rules

  @doc """
  Sanitize original string, remove emoji symbol.
  
  ## Examples

      iex> "👦👦🏻🇯🇵😇😈" |> RemoveEmoji.sanitize()
      ""

  """
  def sanitize(original_string) do
    Rules.emoji_codepoints |> Regex.replace(original_string, "")
  end
end
