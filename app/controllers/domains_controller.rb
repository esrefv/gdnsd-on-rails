class DomainsController < ApplicationController
  before_action :set_domain, only: [:show,:update,:edit,:destroy]

  def new
    @domain = Domain.new
    @domain.build_soa
  end

  def create
    @domain = Domain.new(domain_params)
    if @domain.save
      flash[:success] = t('activerecord.attributes.domain.saved')
      redirect_to @domain
    else
      render :new
    end
  end

  def show
    @domain = Domain.find(params[:id])
    @record = @domain.records.new
    gon.domainname = @domain.name
  end

  def search
    if params[:search].present?
      @domains = Domain.order('id').search(params[:search])
    else
      flash[:alert] =  t('activerecord.attributes.domain.blank')
      redirect_to root_path
    end
  end

  def destroy
    @domain.destroy
    redirect_to root_path
  end

  def edit

  end

  def update
    if @domain.update(domain_params)
      redirect_to domain_path(@domain)
    else
      render :edit
    end
  end

  def index
    @domains = Domain.all.order(:id)
  end

  private

  def set_domain
    @domain = Domain.find(params[:id])
  end

  def domain_params
    params.require(:domain).permit(:name, soa_attributes:[:id, :nameserver1, :nameserver2, :email, :serial_number,
                                                          :refresh, :retry, :expire, :ttl_default, :ttl_min])
  end

end
