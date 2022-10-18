#
# Cookbook:: test
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

#ruby_block "Execute net ads info" do
#    block do
#        #tricky way to load this Chef::Mixin::ShellOut utilities
#        Chef::Resource::RubyBlock.send(:include, Chef::Mixin::ShellOut)
#        command = '/usr/bin/net ads info'
#        command_out = shell_out!(command)
#        result = command_out.stdout
        #node.set['my_attribute'] = command_out.stderr
        #node.run_state['my_attribute'] = command_out.stderr
#    end
#    action :create
#    ignore_failure true
#end

line = shell_out("/usr/bin/net ads info").exitstatus
passwd = "emre"

ruby_block 'Create test docu' do
     block do
       file = Chef::Util::FileEdit.new('/root/test')
       #file.insert_line_if_no_match(/#{node.run_state['result']}/, "result")
       file.insert_line_if_no_match(/#{line}/, line)
       file.write_file
     end
     only_if {shell_out("/usr/bin/net ads info").exitstatus == 255 }
end

execute 'Download And Unzip Carbon BlackAgent' do
  cwd '/root'
  command "touch #{passwd}"
  ignore_failure true
  only_if {shell_out("/usr/bin/net ads info").exitstatus == 255 }
end
