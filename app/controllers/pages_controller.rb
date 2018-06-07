class PagesController < ApplicationController
  def home
  end

  def about_us
    @info = ContactRequest.count
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