class AdtekioAdnetworks::Postbacks::Phunware < AdtekioAdnetworks::BasePostbackClass
  include AdtekioAdnetworks::BasePostbacks

  define_postback_for :ios, :mac do
    { :url => "http://tapit.go2cloud.org/aff_lsr",
      :params => {
        :offer_id => "@{netcfg.offer_id}@",
        :transaction_id => "@{params[:click]}@"
      },
      
    }
  end

end
