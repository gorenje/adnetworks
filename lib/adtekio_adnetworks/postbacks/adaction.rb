class AdtekioAdnetworks::Postbacks::Adaction < AdtekioAdnetworks::BasePostbackClass
  include AdtekioAdnetworks::BasePostbacks

  define_postback_for :ios, :mac do
    { :url => "http://tracking.adactioninteractive.com/aff_lsr",
      :params => {
        :transaction_id => "@{params[:click]}@",
        :security_token => "@{netcfg.security_token}@"
      },
      
    }
  end

end
