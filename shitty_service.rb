require 'socket'
server = TCPServer.new 8080

# We are going to return the name as part of the banner so we can tell who we are talking to
# from the VIP.
name = `hostname`

# we need a way to dial up and down the probability of failure. You know... for funsies. 
while session = server.accept
  decide = rand * 100
  if decide.to_i > 90 
    session.puts "#{name}: #{decide.to_i} bummer."
    exit
  end
  session.puts "#{name}: you rolled #{decide.to_i} it is your lucky day."
  session.close
end
