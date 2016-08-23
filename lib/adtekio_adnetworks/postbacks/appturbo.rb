class AdtekioAdnetworks::Postbacks::Appturbo < AdtekioAdnetworks::BasePostbackClass
  include AdtekioAdnetworks::BasePostbacks

  define_postback_for :all, :mac do
    { :url => "http://tracking.appturbo.net/callback.php",
      :params => {
        :campaign => "@{netcfg.campaign}@",
        :info => "@{netcfg.info}@"
      },
      
    }
  end

end
