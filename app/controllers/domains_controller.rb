class DomainsController < ApplicationController
  before_action :set_domain, only: [:show, :destroy]

  def new
    @domain = Domain.last
    @record = @domain.records.new
  end

  def create
    @domain = Domain.new(domain_params)

    if @domain.save
      redirect_to :back, notice: t(:saved)
    else
      render 'domains/new'
    end
  end

  def show
    @domainlast = Domain.last
    @record = @domainlast.records.new
  end

  def search
    if params[:search].present?
      @domains = Domain.search(params[:search])
    else
      redirect_to root_path, notice: t(:blank)
    end
  end

  def destroy
    @domain.destroy
    redirect_to root_path
  end

  def index
    @domains = Domain.all
  end
private

  def domain_params
    params.require(:domain).permit(:name)
  end

  def set_domain
    @domain = Domain.find(params[:id])
  end
end
