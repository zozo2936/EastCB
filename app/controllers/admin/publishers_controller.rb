class Admin::PublishersController < Admin::BaseController
  before_action :find_publisher, only: [:edit, :update, :destroy]
  
  def index
    @publishers = Publisher.all
  end

  def new
  @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new(publisher_params)
    if @publisher.save
      redirect_to admin_publishers_path, notic: '出版社新增成功'
    else
      render :new
    end
  end
  
  def edit
  end

  def update
    if @publisher.updute(publisher_params)
      redirect_to edit_admin_publishers_path, notic: '更新成功'
    else
      render :edit
    end
  end


  def destroy
    @publisher.destroy
    redirect_to admin_publishers_path, notice: '已刪除'
  end

  private
  def find_publisher
    @publisher =Publisher.find(params[:id])
  end

  def publisher_params
    params.require(:publisher).permit(:name, :tel, :address, :note, :online)
  end
end
