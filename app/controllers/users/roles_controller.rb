class Users::RolesController < ApplicationController
  before_action :set_role, only: [:show, :update, :destroy]

	# GET /users/roles
	def index
		@roles = Role.all
		render json: @roles
	end

	# GET /users/roles/:id
	def show
		render json: @role
	end

	# POST /users/roles
	def create
		@role = Role.new(role_params)
		if @role.save
			render json: { message: 'Role Created successfully', role: @role }, status: :created
		else
			render json: @role.errors, status: :unprocessable_entity
		end
	end

	# PATCH/PUT /users/roles/:id
	def update
		if @role.update(role_params)
			render json: { message: 'Role updated successfully', role: @role }
		else
			render json: @role.errors, status: :unprocessable_entity
		end
	end
	 
  # GET /users/roles/team_leads
	def team_leads
		@lead = User.joins(:roles).where(roles: { name: 'HR' })
		render json: @lead
	end

	# DELETE /users/roles/:id
	def destroy
		render json: { message: 'Role deleted successfully'} if @role.destroy
	end

	private

	def set_role
		@role = Role.find(params[:id])
	rescue ActiveRecord::RecordNotFound => e
		render json: {message: "#{e}"}
	end

	def role_params
		params.require(:role).permit(:name)
	end
end
