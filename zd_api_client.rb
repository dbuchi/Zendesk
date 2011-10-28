require 'rubygems'
require 'rest-client'

class ZdAPIClient
  
  #Get the status id for solved status from api docs
  SOLVED_STATUSID = 3
  
  def initialize(account, email, pass)
    url = "http://" + account + ".zendesk.com"
    @private_resource = RestClient::Resource.new url, email, pass
  end
  
  #POST /users.xml
  def create_user(email, name)
    xml = '<user><email>' + email + '</email><name>' + name + '</name></user>'
    response = @private_resource['users.xml'].post xml, :content_type => 'application/xml'
    
    validate_response(response)
  end
  
  #POST /tickets.xml
  def create_ticket(id, description)
    xml = '<ticket><description>' + description + '</description><id>' + id + '</id></ticket>'
    response = @private_resource['tickets.xml'].post xml, :content_type => 'application/xml'
    
    validate_response(response)
  end
  
  #PUT /tickets/#{id}.xml
  def mark_ticket(ticket_id)
    url = "tickets/" + ticket_id
    
    xml = '<ticket><status_id>' + SOLVED_STATUSID.to_s + '</status_id></ticket>'
    response = @private_resource[url].put xml, :content_type => 'application/xml'
    
    validate_response(response)
  end
  
  private
  
  def validate_response(response)
    case response.code
      when 507
        return "Account does not allow for more users to be created"
      when 201
        url = response.headers[:location]
        url =~ /(\d+).xml/
        #Return user id and ticket id for corresponding operations
        id  = $1
      when 200
        #ticket updated successfully
        return true
      else
        response.return!(request, result, &block)
    end
  end

end