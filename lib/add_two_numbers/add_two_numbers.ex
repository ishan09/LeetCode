# Definition for singly-linked list.
#
# defmodule ListNode do
#   @type t :: %__MODULE__{
#           val: integer,
#           next: ListNode.t() | nil
#         }
#   defstruct val: 0, next: nil
# end

defmodule AddTwoNumbers do
  @spec add_two_numbers(l1 :: ListNode.t() | nil, l2 :: ListNode.t() | nil) :: ListNode.t() | nil
  def add_two_numbers(l1, l2) do
    add(l1, l2)
  end

  defp add(l1, l2, carry \\ 0)
  defp add(nil, nil, 1), do: %ListNode{val: 1, next: nil}
  defp add(nil, nil, 0), do: nil
  defp add(nil, l1, carry), do: add(l1, nil, carry)
  defp add(nil, l1, 0), do: l1

  defp add(%{val: val, next: next}, nil, carry) do
    current = rem(val + carry, 10)
    carry = div(val + carry, 10)
    %ListNode{val: current, next: add(next, nil, carry)}
  end

  defp add(%{val: val1, next: next1}, %{val: val2, next: next2}, carry) do
    current = rem(val1 + val2 + carry, 10)
    carry = div(val1 + val2 + carry, 10)
    %ListNode{val: current, next: add(next1, next2, carry)}
  end
end
