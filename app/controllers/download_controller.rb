class DownloadController < ApplicationController
  def index
    ua = request.env['HTTP_USER_AGENT'].downcase
    if ua.include?('iphone')||ua.include?('ipod')||ua.include?('ipad')
      redirect_to 'https://itunes.apple.com/app/id1314751955'
    elsif ua.include?('android')||ua.include?('android')
      send_file("#{Rails.root}/public/apk/jam_smarthome_simplified.apk")
    else
      send_file("#{Rails.root}/public/apk/jam_smarthome_simplified.apk")
    end
  end

  def show
    ua = request.env['HTTP_USER_AGENT'].downcase
    if params[:version] == 'full'
      if ua.include?('iphone')||ua.include?('ipod')||ua.include?('ipad')
        redirect_to 'https://itunes.apple.com/app/id1314751955'
      elsif ua.include?('android')||ua.include?('android')
        send_file("#{Rails.root}/public/apk/jam_smarthome.apk")
      else
        send_file("#{Rails.root}/public/apk/jam_smarthome.apk")
      end
    else
      if ua.include?('iphone')||ua.include?('ipod')||ua.include?('ipad')
        redirect_to 'https://itunes.apple.com/app/id1314751955'
      elsif ua.include?('android')||ua.include?('android')
        send_file("#{Rails.root}/public/apk/jam_smarthome_simplified.apk")
      else
        send_file("#{Rails.root}/public/apk/jam_smarthome_simplified.apk")
      end
    end
  end
end