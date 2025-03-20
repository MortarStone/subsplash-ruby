def print_profiles(results)
  print_list("profile", 'id', results, %w[_embedded profiles])
end

def print_profile(results)
  print_item('profile', results)
end

def profile_columns
  [
    'id',
    'first_name',
    'last_name',
    'household_role',
    'status',
    %w[_embedded household id]
  ]
end
