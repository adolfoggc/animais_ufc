class MembersController < ApplicationController
  def index
  	@admins = Admin.all
  end

  def new
  	@admin = @admin.new
  end

  def delete
  end
end
