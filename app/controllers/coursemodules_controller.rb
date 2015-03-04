class CoursemodulesController < ApplicationController

    http_basic_authenticate_with name: "kieran", password: "kieran", except: [:index, :show]

    def new
      @coursemodule = Coursemodule.new
    end

    def index
      @coursemodules = Coursemodule.all
    end

    def show
      @coursemodule = Coursemodule.find(params[:id])
    end

    def create
      @coursemodule = Coursemodule.new(coursemodule_params)
      @i = 0
      @d = 7

      if @coursemodule.valid? && @coursemodule.save!
        while @i < 15
          @@recurmodule = Coursemodule.new(coursemodule_params)
          @@recurmodule.start_time += @d.days
          @@recurmodule.end_time += @d.days
          @@recurmodule.save
          @i += 1
          @d += 7
        end

          redirect_to controller: 'coursemodules', action: 'index'
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
      params.require( :coursemodule).permit(:module_code, :module_name, :course_code, :start_time, :end_time )
    end
end
