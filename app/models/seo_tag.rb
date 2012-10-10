class SeoTag < ActiveRecord::Base
  attr_accessible :title, :description, :keywords, :canonical, :open_graph, :path, :use_project_title
  serialize :open_graph
  
  def show_title
    title
  end
  
  def exists?
    !new_record?
  end
end
