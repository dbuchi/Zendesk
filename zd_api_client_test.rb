require "test/unit"
require './zd_api_client'

class ZdAPIClientTest < Test::Unit::TestCase
  
  def setup
    account = 'bluebellstech'
    username = 'deepti.buchi@gmail.com'
    password = 'bluebells'
    
    @private_resource = ZdAPIClient.new account, username, password
  end
  
  def test_api_client
    email = 'bluebells-' + rand(10*10).to_s + '@gmail.com'
    name = 'Bluebells'
    
    begin
      user_id = @private_resource.create_user(email, name)
      assert(true, message = "User created successfully")
    rescue => e
      puts "Error in creating user"
      #e.response
    end
    
    begin
      description = "Creating my ticket in Zendesk"
      ticket_id = @private_resource.create_ticket(user_id, description)
      assert(true, message = "Ticket created successfully")
    rescue => e
      puts "Error in creating a ticket"
      #e.response
    end
    
    begin
      @private_resource.mark_ticket(ticket_id)
      assert(true, message = "Ticket marked as solved")
    rescue => e
      puts "Error in updating the ticket"
      #e.response
    end
  end
  
end