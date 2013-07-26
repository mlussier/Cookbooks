#
# include_recipe "Chef::Log"
Chef::Log.info "*** Begin Stempremier deployment ***"
#directory "/home/ubuntu/STEMPremier" do
#  owner "root"
#  group "root"
#  mode 00755
#  action :create
# end

remote_file "/home/ubuntu/stem.zip" do
  source "https://s3.amazonaws.com/stempremier.com/stem.zip"
  mode 00777
end

execute "unzip" do
  command "unzip -xo /home/ubuntu/stem.zip -d /home/ubuntu/." 
  user "ubuntu"
end
execute "chmod" do
  command "chmod +x /home/ubuntu/stempremier-1.0-SNAPSHOT/start"
  user "ubuntu"
end
Chef::Log.info "*** End Stempremier deployment ***"

