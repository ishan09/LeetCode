defmodule PalindromeNumber do
  @spec is_palindrome(x :: integer) :: boolean
  def is_palindrome(x) when x < 0, do: false

  def is_palindrome(x) do
    x |> split() |> is_palindrome_()
  end

  defp is_palindrome_(splitted_list) do
    splitted_list == reverse(splitted_list)
  end

  defp split(0, acc), do: acc

  defp split(x, acc \\ []) do
    div = div(x, 10)
    rem = rem(x, 10)
    split(div, [rem | acc])
  end

  defp reverse([], acc), do: acc

  defp reverse([h | t], acc \\ []) do
    reverse(t, [h | acc])
  end
end
