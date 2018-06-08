class PagesController < ApplicationController
  def home
    @films = Film.all.limit(4)
    @ads = Ad.last
  end

  def about_us
    @info_contact_request = ContactRequest.count
    @info_users = User.count
  end

  def contact_us
    @contact_request = ContactRequest.new
  end

  def send_message
    @contact_request = ContactRequest.create(contact_request_params)
    respond_to do |format|
      if @contact_request.save
        # ContactRequestMailer.send_contact_request(@contact_request).deliver
        format.html { redirect_to contact_us_url, notice: 'Contact Request was successfully created.' }
      else
        format.html { redirect_to contact_us_url, notice: 'Fail.' }
      end
    end
  end

  private

  def contact_request_params
  params.require(:contact_request).permit(:user_name, :email, :message)
  end

end
