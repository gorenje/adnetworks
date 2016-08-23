class AdtekioAdnetworks::Postbacks::Adknowledge < AdtekioAdnetworks::BasePostbackClass
  include AdtekioAdnetworks::BasePostbacks

  define_postback_for :ios, :mac do
    { :url => "http://tracking.adk-mobile.com/mobile/postback/",
      :params => {
        :at => "@{netcfg.at}@",
        :postbackid => "@{params[:click]}@"
      },
      
    }
  end

end
