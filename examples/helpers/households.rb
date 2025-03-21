# frozen_string_literal: true

def print_households(results)
  print_list('household', 'id', results, %w[_embedded households])
end

def print_household(results)
  print_item('household', results)
end

def household_columns
  %w[
    id
    name
    status
  ]
end
