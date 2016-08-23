class AdtekioAdnetworks::Postbacks::Supersonic < AdtekioAdnetworks::BasePostbackClass
  include AdtekioAdnetworks::BasePostbacks

  define_postback_for :all, :mac do
    { :url => "http://track.supersonicads.com/api/v1/processCommissionsCallback.php",
      :params => {
        :advertiserId => "@{netcfg.advertiser_id}@",
        :dynamicParameter => "@{params[:click]}@",
        :password => "@{netcfg.password}@"
      },
      
    }
  end

end
