<% module_namespacing do -%>
class <%= class_name %> < ActiveRecord::Base
  self.table_name = '<%=table_name %>'
end
<% end -%>