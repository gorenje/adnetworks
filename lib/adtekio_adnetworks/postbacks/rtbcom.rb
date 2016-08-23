class AdtekioAdnetworks::Postbacks::Rtbcom < AdtekioAdnetworks::BasePostbackClass
  include AdtekioAdnetworks::BasePostbacks

  define_postback_for :ios, :mac do
    { :url => "https://t.manage.com/@{netcfg.app_id}@",
      :params => {
        :uh => "@{params[:click]}@",
        :_uh_ifa => "@{event.adid}@",
        :_uh_ip => "@{event.ip}@"
      },
      
    }
  end

  define_postback_for :android, :mac do
    { :url => "https://t.manage.com/@{netcfg.app_id}@",
      :params => {
        :_uh_sha1_android_id => "@{Digest::SHA1.hexdigest(params[:android_id])}@",
        :_uh_ip => "@{event.ip}@",
        :_uh_gaid => "@{params[:gadid]}@"
      },
      
    }
  end

end
