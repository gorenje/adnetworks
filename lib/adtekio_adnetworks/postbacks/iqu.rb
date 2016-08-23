class AdtekioAdnetworks::Postbacks::Iqu < AdtekioAdnetworks::BasePostbackClass
  include AdtekioAdnetworks::BasePostbacks

  define_postback_for :all, :mac do
    { :url => "http://trk.com/p.ashx",
      :params => {
        :f => "pb",
        :o => "@{netcfg.o}@",
        :r => "@{params[:click]}@"
      },
      
    }
  end

end
