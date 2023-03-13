class BugsController < ApplicationController
    before_action :set_bug, only: [:update, :show, :destroy]

    def index
      @bugs = Bug.all
    end

    def new
      @bug = Bug.new
    end
    
    def create
      @bug = Bug.new(bug_params)
      if @bug.save
        flash[:success] = "Bug was successfully created"
        redirect_to bug_path(@bug)
      else
        render 'new'
      end
    end
    
    def edit
      @bug = Bug.find(params[:id])
    end
    
    def update
      if @bug.update(bug_params)
        flash[:success] = "Bug is updated successfully"
        redirect_to @bug
      else
        render 'edit'
      end
    end
    
    def show
      @bug_projects = @bug.projects
    end
    
    def destroy
      Bug.find(params[:id]).destroy
      flash[:success] = "Bug deleted successfully"
      redirect_to bugs_path
    end

    private
    
      def bug_params
        params.require(:bug).permit(:image, :title, :description, :btype, :status, :deadline ,:project_ids => [])
      end
      
      def set_bug
        @bug = Bug.find(params[:id])
      end
      
      # def require_admin
      #   if !logged_in? || (logged_in? and !user.manager?)
      #     flash[:danger] = "Only admin users can perform that action"
      #     redirect_to bugs_path
      #   end
      # end
    
  end