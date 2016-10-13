class DomainsController < ApplicationController
  def new
    @domain = Domain.new
  end

  def create
    @domain = Domain.new(domain_params)
    if @domain.save
      redirect_to domain_path(@domain)
    else
      render 'domains/new'
    end
  end

  def show
    set_domain
  end

  def search
    if params[:search].present?
      @domains = Domain.search(params[:search])
    else
      @domains = []
    end
  end

  def destroy
    set_domain
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
