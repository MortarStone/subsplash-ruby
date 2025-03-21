# frozen_string_literal: true

def print_campaigns(results)
  print_list('campaign', 'id', results, %w[_embedded campaigns])
end

def print_campaign(results)
  print_item('campaign', results)
end

def campaign_columns
  [
    'id',
    %w[pledged value]
  ]
end
