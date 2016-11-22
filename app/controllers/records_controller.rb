class RecordsController < ApplicationController
  before_action :set_domain
  before_action :set_record, only: [:update]

  
  def create
    @record = @domain.records.new(record_params)
    if @record.save
      flash[:success] =  t(:record_succes)
      redirect_to domain_path(@domain)
    else
      flash[:alert] =  t(:record_not_valid)
      redirect_to domain_path(@domain)
    end
  end

  def destroy
    @record = @domain.records.find(params[:id])
    @record.destroy
    redirect_to domain_path(@domain)
  end


private

  def record_params
    params.require(:record).permit(:domain_id,:name,:rtype,:content,:ttl,:prio)
  end

  def set_record
    @record = Record.find(params[:id])
  end

  def set_domain
    @domain = Domain.find(params[:domain_id])
  end
end
