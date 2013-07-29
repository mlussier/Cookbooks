#
Chef::Log.info "*** Begin Stempremier Startup ***"

execute "start" do
  command "sudo /home/ubuntu/stempremier-1.0-SNAPSHOT/start -Dhttp.port=80 &" 
end

Chef::Log.info "*** End Stempremier Startup ***"

