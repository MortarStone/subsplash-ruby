# frozen_string_literal: true

def print_pledges(results)
  print_list('pledge', 'id', results, %w[_embedded pledges])
end

def print_pledge(results)
  print_item('pledge', results)
end

def pledge_columns
  [
    'id',
    %w[amount value]
  ]
end
