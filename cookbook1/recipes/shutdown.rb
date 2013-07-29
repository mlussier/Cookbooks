#
Chef::Log.info "*** Begin Stempremier Shutdown ***"

execute "kill" do
  command "sudo pkill java &"
end

Chef::Log.Info "*** End Stempremier Shutdown ***"

