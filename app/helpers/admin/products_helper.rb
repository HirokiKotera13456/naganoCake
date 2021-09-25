module Admin::ProductsHelper
  
  def sort_orderp(column, title)
    css_class = column == sort_columnp ? "current #{sort_direction}" : nil
    direction = column == sort_columnp && sort_direction == 'desc' ? 'asc' : 'desc'
    link_to title, {sort: column, direction: direction}.merge(), class: "sort_header #{css_class}"
  end  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end

  def sort_columnp
    Product.column_names.include?(params[:sort]) ? params[:sort] : 'created_at'
  end
end
