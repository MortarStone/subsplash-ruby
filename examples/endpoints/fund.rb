require_relative 'endpoint_helper'

response = @client.fund('3de245a4-a292-45be-b5fe-33d0e348d4fd')
print_fund(response)
