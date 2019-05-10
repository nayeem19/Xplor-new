class AptsController < ApplicationController
	before_action :find_apt, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :edit]

	def index
		if params[:category].blank?
			@apts = Apt.all.order("created_at DESC")
		else
			@category_id = Category.find_by(name: params[:category]).id
			@apts = Apt.where(:category_id => @category_id).order("created_at DESC")
		end
	end

	def show
		if @apt.reviews.blank?
			@average_review = 0
		else
			@average_review = @apt.reviews.average(:rating).round(2)
		end
	end

	def new
		@apt = current_user.apts.build
		@categories = Category.all.map{ |c| [c.name, c.id] }
	end

	def create
		@apt = current_user.apts.build(apt_params)
		@apt.category_id = params[:category_id]

		if @apt.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
		@categories = Category.all.map{ |c| [c.name, c.id] }
	end

	def update
		@apt.category_id = params[:category_id]
		if @apt.update(apt_params)
			redirect_to apt_path(@apt)
		else
			render 'edit'
		end
	end

	def destroy
		@apt.destroy
		redirect_to root_path
	end

	private

		def apt_params
			params.require(:apt).permit(:title, :description, :author, :category_id, :apt_img)
		end

		def find_apt
			@apt = Apt.find(params[:id])
		end

end