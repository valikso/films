class PagesController < ApplicationController
  def home
    @films = Film.all.limit(4)
    @ads = Ad.last
  end

  def about_us
    @info_contact_request = ContactRequest.count
    @info_users = User.count
    @info_films = Film.count
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
  #order page
  def order_table
    @order = OrderTable.new
  end

  def save_new_order
    @order = OrderTable.create(order_tables_params)
    respond_to do |format|
      if @order.save
        format.html { redirect_to contact_us_url, notice: 'Your order was successfully saved.' }
      else
        format.html { redirect_to contact_us_url, notice: 'Fail.' }
      end
    end
  end

private

  def order_tables_params
  params.require(:order_table).permit(:film_name, :user_name, :comment, :film_year)
  end


  def contact_request_params
  params.require(:contact_request).permit(:user_name, :email, :message)
  end

end
