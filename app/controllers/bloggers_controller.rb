class BloggersController < ApplicationController

    def index
        @bloggers = Blogger.all
    end

    def new
        @blogger = Blogger.new
    end

    def create
        @blogger = Blogger.new(blogger_params)
        if @blogger.valid?
            @blogger.save
            redirect_to blogger_path(@blogger)
        else
            flash[:blogger_errors] = @blogger.errors.full_messages
            redirect_to new_blogger_path
        end
    end

    def show
        @blogger = Blogger.find_by(id: params[:id])
    end

    private

    def blogger_params
        params.require(:blogger).permit(:name, :bio, :age)
    end

end