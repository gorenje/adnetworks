class AdtekioAdnetworks::Postbacks::CyberagentKjnw < AdtekioAdnetworks::BasePostbackClass
  include AdtekioAdnetworks::BasePostbacks

  define_postback_for :ios, :mac do
    { :url => "http://sp.appli-info.com/k/@{params[:partner_data]}@/@{params[:click]}@",
      :params => {
        
      },
      
    }
  end

end
