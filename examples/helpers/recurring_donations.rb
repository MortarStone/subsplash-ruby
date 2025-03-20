def print_recurring_donations(results)
  print_list("recurring_donation", 'id', results, %w[_embedded recurring-donations])
end

def print_recurring_donation(results)
  print_item('recurring_donation', results)
end

def recurring_donation_columns
  %w[
    id
    amount
    recurrence_rule
    status
  ]
end
