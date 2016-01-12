module ApplicationHelper
    
    def sorting(col)
        title = col.titleize
        direction = col == params[:sort] && params[:direction] == "asc" ? "desc" : "asc"
        #link_to title, params.merge(sort: col, :direction => direction, page:nil)
        link_to title, params.merge(:sort => col, :direction => direction, :page => nil)
    end
end
