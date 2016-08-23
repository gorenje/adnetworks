class AdtekioAdnetworks::Postbacks::Inneractive < AdtekioAdnetworks::BasePostbackClass
  include AdtekioAdnetworks::BasePostbacks

  define_postback_for :ios, :mac do
    { :url => "http://tracking.inner-active.com/aff_lsr",
      :params => {
        :transaction_id => "@{params[:click]}@"
      },
      
    }
  end

end
