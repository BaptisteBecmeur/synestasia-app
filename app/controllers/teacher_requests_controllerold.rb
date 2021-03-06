class TeacherRequestsController < ApplicationController
  authorize_actions_for TeacherRequest
  before_action :set_teacher_request, only: [:show, :edit, :update, :destroy]
  # GET /teacher_requests
  # GET /teacher_requests.json
  def index
    @teacher_requests = TeacherRequest.all
  end

  # GET /teacher_requests/1
  # GET /teacher_requests/1.json
  def show
  end

  # GET /teacher_requests/new
  def new
    @teacher_request = TeacherRequest.new
  end

  # GET /teacher_requests/1/edit
  def edit
  end

  # POST /teacher_requests
  # POST /teacher_requests.json
  def create
    @teacher_request = TeacherRequest.new
    
    if @teacher_request.save
      respond_to do |format|
        if @teacher_request.save
          format.html { redirect_to efgzrgr, notice: 'Request was successfully created.' }
          format.json { render :new, status: :created, location: @teacher_request }
        else
          format.html { render :new }
          format.json { render json: @teacher_request.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /teacher_requests/1
  # PATCH/PUT /teacher_requests/1.json
  def update
    respond_to do |format|
      if @teacher_request.update(teacher_request_params)
        format.html { redirect_to @teacher_request, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @teacher_request }
      else
        format.html { render :edit }
        format.json { render json: @teacher_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teacher_requests/1
  # DELETE /teacher_requests/1.json
  def destroy
    @teacher_request.destroy
    respond_to do |format|
      format.html { redirect_to teacher_requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher_request
      if params[:id].present?
        @teacher_request = TeacherRequest.find(params[:id])
      else
        @teacher_request = TeacherRequest.new
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teacher_request_params
      params.require(:teacher_request).permit(:user_id, :status)
    end
end
