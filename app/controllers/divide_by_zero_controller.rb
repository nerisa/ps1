class DivideByZeroController < ApplicationController
  def index
    logger.info "About to divide by 0"
    num = 5/0

  end
end
