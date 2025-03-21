# frozen_string_literal: true

Dir[File.join(__dir__, 'helpers', '*.rb')].each { |file| require file }

def print_no_access_message
  puts 'Unless something has recently changed, we do not have access to this table or the table does not exist.'
end

def print_list(object_name, pk_id_name, response, response_chain = nil)
  list = response.body.dig(*response_chain)

  if list.nil? || list.empty?
    puts 'Nothing found'
    puts
  else
    headers = column_headers(object_name)
    puts "There were #{list.count} #{object_name.pluralize} found"
    puts
    puts print_column_headers(headers)
    list.each_with_index do |item, index|
      print_row(index, item, headers)
    end
    puts
    print_duplicates(pk_id_name, list)
  end

  print_metadata(response.body)
  print_rate_limiting(response.headers)
end

def print_metadata(body)
  return unless body.key?('_links')

  puts 'Links:'
  body['_links'].each do |key, value|
    puts "  #{key}: #{value}"
  end
  puts "Count: #{body['count']}"
  puts
end

def print_rate_limiting(headers)
  return unless headers.key?('x-rate-limit-limit')

  puts 'Rate Limiting: '
  puts "  Limit: #{headers['x-rate-limit-limit']}"
  puts "  Remaining: #{headers['x-rate-limit-remaining']}"
  puts "  Reset: #{headers['x-rate-limit-reset']}"
  puts
end

def column_headers(object_name)
  send("#{object_name}_columns")
end

def print_column_headers(headers)
  headers = [:index] + headers
  puts headers.map { |h| column_header(h) }.join(' :: ')
end

def item_value(item, header)
  if header.is_a?(Array) # chain of values
    header.inject(item) { |a, e| a.nil? ? nil : a[e] }
  else
    item[header]
  end
end

def print_row(index, item, column_headers)
  cells = [index]
  column_headers.each do |header|
    value = item.is_a?(Hash) ? item_value(item, header) : item.public_send(header)
    value = value.to_digits if value.instance_of?(BigDecimal)
    cells << value
  end
  puts cells.join(' :: ')
end

def print_item(object_name, response, response_chain = nil)
  item = response_chain ? response.body.dig(*response_chain) : response.body
  puts
  if item.nil?
    puts 'Item not found'
  else
    column_headers(object_name).each do |header|
      value = item.is_a?(Hash) ? item_value(item, header) : item.public_send(header)
      value = value.to_digits if value.instance_of?(BigDecimal)
      puts "#{column_header(header)}: #{value}"
    end
  end
  puts

  print_rate_limiting(response.headers)
end

def column_header(header)
  header.is_a?(Array) ? header.join('.') : header
end

def print_duplicates(pk_id_name, list)
  counts = {}
  list.each do |item|
    id = item.is_a?(Hash) ? item[pk_id_name] : item.send(pk_id_name)
    counts[id] ||= 0
    counts[id] += 1
  end

  duplicates = counts.select { |_key, value| value > 1 }.keys - [nil]
  puts "There are #{duplicates.count} duplicates: #{duplicates.inspect}"
  puts
end
