defmodule LongestSubstring do
  @spec length_of_longest_substring(s :: String.t()) :: integer
  def length_of_longest_substring(s) do
    s
    |> String.codepoints()
    |> count()
  end

  defp count(list, acc \\ {[], 0})

  defp count([], {uniq, c1}) do
    max(length(uniq), c1)
  end

  defp count([h | t], {uniq, c1}) do
    if Enum.member?(uniq, h) do
      count(t, {[h | Enum.take_while(uniq, &(&1 != h))], max(length(uniq), c1)})
    else
      count(t, {[h | uniq], c1})
    end
  end
end
