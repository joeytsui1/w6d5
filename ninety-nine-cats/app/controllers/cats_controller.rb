class CatsController < ApplicationController
    def index
        @cats = Cat.all
        render :index
    end

    def show
        @cat = Cat.find(params[:id])
        
        if @cat
            render :show
        else 
            redirect_to cats_url
        end
    end

    def new
        @cat = Cat.new
        render :new
    end

    def create
        @cat = Cat.new(cat_params)

        if @cat.color == @cat.color.downcase
            @cat.color = @cat.color.capitalize!
        end

        if @cat.save
            redirect_to cat_url(@cat)
        else
            render :new
        end
    end

    def edit
        @cat = Cat.find(params[:id])

        render :edit
    end

    def update
        @cat = Cat.find(params[:id])

        if @cat.update(cat_params)

            redirect_to cat_url(@cat)
        else
            render :edit
        end
    end

    private

    def cat_params
        params.require(:cat).permit(:color, :birth_date, :name, :sex, :description)
    end
end
