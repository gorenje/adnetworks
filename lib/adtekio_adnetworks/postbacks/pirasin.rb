class AdtekioAdnetworks::Postbacks::Pirasin < AdtekioAdnetworks::BasePostbackClass
  include AdtekioAdnetworks::BasePostbacks

  define_postback_for :all, :mac do
    { :url => "http://mbttd.com/engine/conversion/@{params[:click]}@",
      :params => {
        
      },
      
    }
  end

end
