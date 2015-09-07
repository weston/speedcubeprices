require 'digest'
class SalesController < ApplicationController
	def index
		@sales = Promotion.all
	end
	def store

	end
	def post_submit
		promo = Promotion.new
		promo.description = params[:description]
		promo.title = params[:title]
		promo.link = params[:link]
		if !promo.link.start_with?('http') then
			promo.link = 'http://' + promo.link
		end

		promo.store_name = params[:storeName]
		promo.expiration = Date.parse(params[:date])
		password = params[:password]
		promo.save()
		redirect_to "/sales"	
	end
	def admin
		@sales = Promotion.all
	end

	def post_admin

	end
	def approve_promotion
		id = params[:id]
		code = params[:pw]
		passwordHash = "6de1c8799f4a4dbe4fa3cb35d0656490582bb0bed50304d2251532b8d94b322b" #lol why are you trying to find my passwords?
		if (Digest::SHA256.hexdigest(code) == passwordHash) then
			Promotion.find(id).update(approved: true)
		end
		redirect_to "/"
	end
	def delete_promotion
		id = params[:id]
		code = params[:pw]
		passwordHash = "6de1c8799f4a4dbe4fa3cb35d0656490582bb0bed50304d2251532b8d94b322b"
		if (Digest::SHA256.hexdigest(code) == passwordHash) then
			Promotion.find(id).destroy()
		end
		redirect_to "/"
	end


end
