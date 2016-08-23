class AdtekioAdnetworks::Postbacks::Appnext < AdtekioAdnetworks::BasePostbackClass
  include AdtekioAdnetworks::BasePostbacks

  define_postback_for :all, :mac do
    { :url => "http://admin.appnext.com/conversion.aspx",
      :params => {
        :clickid => "@{params[:click]}@"
      },
      
    }
  end

end
