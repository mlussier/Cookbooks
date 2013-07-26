#
# include_recipe "Chef::Log"
Chef::Log.info "This is a console test to see if it works"
directory "/home/ubuntu/STEMPremier" do
  owner "root"
  group "root"
  mode 00755
  action :create
end

remote_file "/home/ubuntu/stem.zip" do
  source "https://s3.amazonaws.com/stempremier.com/stem.zip"
  mode 00755
end

