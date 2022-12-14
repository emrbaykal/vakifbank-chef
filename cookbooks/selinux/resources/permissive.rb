#
# Cookbook:: selinux
# Resource:: permissive
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

unified_mode true

property :context, String,
          name_property: true,
          description: 'The SELinux context to permit'

action_class do
  def current_permissives
    shell_out!('semanage permissive -ln').stdout.split("\n")
  end
end

# Create if doesn't exist, do not touch if permissive is already registered (even under different type)
action :add do
  unless current_permissives.include? new_resource.context
    converge_by "adding permissive context #{new_resource.context}" do
      shell_out!("semanage permissive -a '#{new_resource.context}'")
    end
  end
end

# Delete if exists
action :delete do
  if current_permissives.include? new_resource.context
    converge_by "deleting permissive context #{new_resource.context}" do
      shell_out!("semanage permissive -d '#{new_resource.context}'")
    end
  end
end
