defmodule TwoSum do
  @spec two_sum(nums :: [integer], target :: integer) :: [integer]
  def two_sum(nums, target) do
    nums |> find(target)
  end

  defp find(list, target, index \\ 0)
  defp find([], _, _), do: nil

  defp find([num | t], target, index) do
    case find_second(target - num, t, index + 1) do
      nil -> find(t, target, index + 1)
      second_index -> [index, second_index]
    end
  end

  defp find_second(target, list, index \\ 0)
  defp find_second(_, [], _), do: nil

  defp find_second(target, [num | t], index) do
    if target == num do
      index
    else
      find_second(target, t, index + 1)
    end
  end
end
