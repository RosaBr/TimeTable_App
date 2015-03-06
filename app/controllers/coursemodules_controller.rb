class CoursemodulesController < ApplicationController

    http_basic_authenticate_with name: "kieran", password: "blah1", except: [:index, :show]

    def new
      @coursemodule = Coursemodule.new
    end

    def index
      if signed_in?
      @user = User.find(session[:user])
      @coursemodules = Coursemodule.where(course_code:  @user.course_enrolled)
      else
        @coursemodules = nil
      end
    end

    def show
      @coursemodule = Coursemodule.find(params[:id])
    end

    def create
      @coursemodule = Coursemodule.new(coursemodule_params)
      @i = 0
      @d = 7

      if @coursemodule.valid? && @coursemodule.save!
        while @i < 2
          @@recurmodule = Coursemodule.new(coursemodule_params)
          @@recurmodule.start_time += @d.days
          @@recurmodule.end_time += @d.days
          @@recurmodule.save
          @i += 1
          @d += 7
        end

          redirect_to root_url
        flash[:notice] = "Module created successfully"
      else
        render 'new'
      end
    end

    def destroy
      Coursemodule.find(params[:id]).destroy
      #take user back to main page.
      redirect_to(:action => 'index')
    end

    def edit
      @coursemodule = Coursemodule.find(params[:id])
    end

    def update
      @coursemodule = Coursemodule.find(params[:id])
      #if user changes event parameters
      if @coursemodule.update_attributes(event_params)
        #take them back to the show screen
        redirect_to(:action => 'show',:id => @coursemodule.id)
      else
        #otherwise make a new event
        render('new')
      end
    end

    private
    def coursemodule_params
      params.require( :coursemodule).permit(:title, :module_code, :module_name, :course_code, :start_time, :end_time )
    end
end
