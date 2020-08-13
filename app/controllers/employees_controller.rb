class EmployeesController < ApplicationController
    before_action :find_employee, only: [:show, :edit, :update]

    def index
        @employees = Employee.all
    end

    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.new(employee_params)
        

        if @employee.valid?
            @employee.save
            redirect_to employee_path(@employee)
        else
            render :new
        end
    end

    def edit
    end

    def update
        @employee.update(employee_params)
        if @employee.valid?
            @employee.save
            redirect_to employee_path(@employee)
        else
            render :edit
        end
    end

    def show
    end

    private

    def find_employee
        @employee = Employee.find(params[:id])
    end

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id)
      end

end
