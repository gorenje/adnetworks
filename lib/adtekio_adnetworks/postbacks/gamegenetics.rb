class AdtekioAdnetworks::Postbacks::Gamegenetics < AdtekioAdnetworks::BasePostbackClass
  include AdtekioAdnetworks::BasePostbacks

  define_postback_for :ios, :mac do
    { :url => "http://track.popmog.com/registration",
      :params => {
        :flow_id => "@{params[:click]}@"
      },
      
    }
  end

end
