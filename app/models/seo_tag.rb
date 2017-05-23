class SeoTag < ActiveRecord::Base
  serialize :open_graph
  
  def show_title
    title
  end
  
  def exists?
    !new_record?
  end
end
