class Admin::CategoriesController < AdminController
  load_and_authorize_resource
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category].permit!)
    if @category.save
      redirect_to admin_categories_path, notice: 'Done!'
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(params[:category].permit!)
      redirect_to admin_categories_path, notice: 'Done!'
    else
      render :edit
    end
  end

  private

  def resource_params
    params[:category].permit!
  end
end
