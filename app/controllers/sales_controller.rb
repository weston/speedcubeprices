require 'digest'
class SalesController < ApplicationController
	def index
		allSales = Promotion.all.order('created_at')
		@sales = []
		allSales.each do |sale|
			if (sale.approved) and (sale.expiration.next.next.future?) then #Why two nexts? No idea
				@sales.push(sale);
			end
		end
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
		if params[:date].length == 0 then
			flash[:notice] ="You must include an expiration date"
			redirect_to "/sales/store"	
			return
		end
		promo.expiration = Date.parse(params[:date])
		password = params[:password]
		passwords = {}
		passwords["SpeedCubeShop.com"] = "6de1c8799f4a4dbe4fa3cb35d0656490582bb0bed50304d2251532b8d94b322b"
		passwords["theCubicle.us"] = "de4b7328807cc363e5f5e94b22cb1c39a99a6dc996687a99fa1d7cb4a0a8f0d4"
		passwords["Cubezz.com"] = "510debfd835172ae11a96642728ff0aabf3b603c90a1a5b5150dee5ce260f2dc"
		passwords["Cubes4Speed.com"] = "3c0742c81e433c79d78521002172f7a773ffac15b648c97335dcb45cec6cd600"
		passwordHash = Digest::SHA256.hexdigest(password)
		passwords.each do |name,hash| 
			if passwordHash == hash then
				promo.store_name = name
				promo.save()
				flash[:notice] = "Succesfully saved. This promotion will show up on this page when it is approved."
				redirect_to "/sales/store"	
				return
			end
		end
		flash[:notice] = "Incorrect password. Please input again."
		redirect_to "/sales/store"	
		return
	end
	def admin
		@sales = Promotion.all
	end

	def post_admin

	end
	def approve_promotion
		id = params[:id]
		code = params[:pw]
		passwordHash = "6de1c8799f4a4dbe4fa3cb35d0656490582bb0bed50304d2251532b8d94b322b" 
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
