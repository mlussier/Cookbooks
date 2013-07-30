#
# include_recipe "Chef::Log"
Chef::Log.info "*** Begin Stempremier deployment ***"
#directory "/home/ubuntu/STEMPremier" do
#  owner "root"
#  group "root"
#  mode 00755
#  action :create
# end

execute "delete" do
  command "sudo rm -f /home/ubuntu/stem.zip"
  user "ubuntu"
end

execute "removeRUNNINGPID" do
  command "sudo rm -f /home/ubuntu/stempremier-1.0-SNAPSHOT/RUNNING_PID"
  user "ubuntu"
end

remote_file "/home/ubuntu/stem.zip" do
  source "https://s3.amazonaws.com/stempremier.com/stem.zip"
  mode 00777
end

execute "unzip" do
  command "sudo unzip -xo /home/ubuntu/stem.zip -d /home/ubuntu/." 
  user "ubuntu"
end
execute "chmod" do
  command "sudo chmod +x /home/ubuntu/stempremier-1.0-SNAPSHOT/start"
  user "ubuntu"
end

execute "kill" do
  command "sudo pkill java &"
end

execute "start" do
  command "sudo /home/ubuntu/stempremier-1.0-SNAPSHOT/start -Dhttp.port=80 > /home/ubuntu/stempremier-1.0-SNAPSHOT/logfile &" 
end
Chef::Log.info "*** End Stempremier deployment ***"

