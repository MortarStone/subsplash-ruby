# frozen_string_literal: true

def print_donations(results)
  print_list('donation', 'id', results, %w[_embedded donations])
end

def print_donation(results)
  print_item('donation', results)
end

def donation_columns
  [
    'id',
    'auth_date',
    %w[total_amount value]
  ]
end
