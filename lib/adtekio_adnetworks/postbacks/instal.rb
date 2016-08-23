class AdtekioAdnetworks::Postbacks::Instal < AdtekioAdnetworks::BasePostbackClass
  include AdtekioAdnetworks::BasePostbacks

  define_postback_for :ios, :mac do
    { :url => "http://instal.com/trkinst/",
      :params => {
        :clkid => "@{params[:click]}@",
        :_advid => "@{netcfg.advid}@"
      },
      
    }
  end

end
