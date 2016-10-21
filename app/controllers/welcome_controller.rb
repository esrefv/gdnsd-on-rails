class WelcomeController < ApplicationController

  def index
    @domains_count = Domain.all.count
  end
end
