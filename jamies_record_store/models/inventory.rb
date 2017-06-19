require_relative("artist")
require_relative("album")
require_relative("genre")
require_relative("../db/sql_runner")

class Inventory

 def initialize(options)
  @quantity = options["quantity"].to_i
 end

def stock_level

  if @quantity >= 20
    return green
    
  
end
end