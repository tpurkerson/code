Puppet::Functions.create_function(:write_line_to_file) do 
#  dispatch :up do
#    param 'String', :some_string
#  end

dispatch :write_line_to_file do
  required_param 'String', :filename
  required_param 'String', :str
end

def write_line_to_file(filename, str) 
  # Note that parameters_hash defaults to an empty hash.
# end
#         filename = args[0]
#         str = args[1]
        File.open(filename, 'a') {|fd| fd.puts str }
      end
    end

