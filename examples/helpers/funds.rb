# frozen_string_literal: true

def print_funds(results)
  print_list('fund', 'id', results, %w[_embedded terminals], %w[_embedded funds])
end

def print_fund(results)
  print_item('fund', results)
end

def fund_columns
  %w[
    id
    name
    state
  ]
end
