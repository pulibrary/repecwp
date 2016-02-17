module ApplicationHelper
  def format_handle paper
  
  end

  def format_file_url paper

  end

  def format_authors paper

  end

  def series_link id
    series = Series.find(id)
    link_to series.sectionurlid, series_path(id)
  end
end
