class AdtekioAdnetworks::Postbacks::Moblin < AdtekioAdnetworks::BasePostbackClass
  include AdtekioAdnetworks::BasePostbacks

  define_postback_for :ios, :mac do
    { :url => "http://track.mct.moblin.com/cn/@{netcfg.company_id}@/",
      :params => {
        :token => "@{params[:click]}@"
      },
      :check => "!event.params[:click].nil?"
    }
  end

end
