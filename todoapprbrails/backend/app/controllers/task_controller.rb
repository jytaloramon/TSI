class TaskController < ApplicationController

    # GET /task
    def index
        @tasks = Task.all
        render json: @tasks
    end

    # POST /task
    def create
        @task = Task.new(task_params)

        if @task.save
            render json: {msg: "Sucesso"}
        else
            render json: {msg: "erro"}
        end
    end

    # PATCH /task
    def update
        @task = Task.where("id = ?", (params[:task])[:id]).first
        @task.is_active = !@task.is_active

        if @task.save
            render json: {msg: "Sucesso"}
        else
            render json: {msg: "erro"}
        end    
    end

    # DELETE /task/1
    def destroy
        @task = Task.find((params[:task])[:id]).destroy

        render json: @task
    end

    private

    def task_params
        params.require(:task).permit(:description, :date_task)
    end

end