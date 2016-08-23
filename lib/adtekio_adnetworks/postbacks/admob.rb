class AdtekioAdnetworks::Postbacks::Admob < AdtekioAdnetworks::BasePostbackClass
  include AdtekioAdnetworks::BasePostbacks

  define_postback_for :all, :mac do
    { :url => "https://www.googleadservices.com/pagead/conversion/@{netcfg.path}@/",
      :params => {
        :bundleid => "@{event.bundleid}@",
        :label => "@{netcfg.label}@",
        :muid => "@{muidify(event.adid)}@"
      },
      
    }
  end

end
