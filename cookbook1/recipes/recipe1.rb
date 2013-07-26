#
# include_recipe "Chef::Log"
Chef::Log.info "This is a console test to see if it works"
directory "/home/ubuntu/STEMPremier" do
  owner "root"
  group "root"
  mode 00644
  action :create
end
