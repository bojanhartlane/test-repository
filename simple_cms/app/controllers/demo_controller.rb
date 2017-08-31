class DemoController < ApplicationController

  layout 'application'

  def index
    render('index')
  end

  def view
    @array = [1,2,3,4,5]
    @id = params['id']
    @page = params[:page]
    render('view')
  end

  def other_view
    redirect_to(:controller => 'demo', :action => 'view')
  end

  def escape_output

  end
end
