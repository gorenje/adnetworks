class AdtekioAdnetworks::Postbacks::Webmedia < AdtekioAdnetworks::BasePostbackClass
  include AdtekioAdnetworks::BasePostbacks

  define_postback_for :ios, :mac do
    { :url => "http://clicktracking.wmadv.com/traffic/pixel/@{netcfg.partner_id}@/",
      :params => {
        :mytoken => "@{params[:click]}@"
      },
      
    }
  end

end
