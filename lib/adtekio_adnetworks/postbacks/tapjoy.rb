class AdtekioAdnetworks::Postbacks::Tapjoy < AdtekioAdnetworks::BasePostbackClass
  include AdtekioAdnetworks::BasePostbacks

  define_postback_for :ios, :mac do
    { :url => "https://ws.tapjoyads.com/log_device_app",
      :params => {
        :advertising_id => "@{event.adid}@",
        :app_id => "<%=params[:partner_data] || netcfg.app_id %>",
        :device_ip => "@{event.ip}@",
        :library_version => "server",
        :sdk_type => "connect",
        :sha1_mac_address => "<%=Digest::SHA1.hexdigest(params[:mid])%>"
      },
      :check => "!event.adid.nil?"
    }
  end

  define_postback_for :android, :mac do
    { :url => "https://ws.tapjoyads.com/log_device_app",
      :params => {
        :android_id => "@{params[:android_id]}@",
        :advertising_id => "@{params[:gadid]}@",
        :app_id => "@{netcfg.app_id}@",
        :device_ip => "@{event.ip}@",
        :library_version => "server",
        :sdk_type => "connect",
        :sha1_mac_address => "<%=Digest::SHA1.hexdigest(params[:mid])%>"
      },
      
    }
  end

end
