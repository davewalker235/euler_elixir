defmodule Euler113 do
  def increment(l) do
    l
  end
end

#
# Every time you hit a nine you increment the next number by one and set everything behind it to that number
# [1, 2, 3, 3, 4, 4]
#
# 1
# 2
# ..
# 98
# 99
# 099
# 111
# 112     117
# 113     118
# 119     119
# 122     221
#
#
# [1, 2, 3, 4]
