class AdtekioAdnetworks::Postbacks::Neodau < AdtekioAdnetworks::BasePostbackClass
  include AdtekioAdnetworks::BasePostbacks

  define_postback_for :all, :mac do
    { :url => "http://neotrk.com/p.ashx",
      :params => {
        :a => "@{netcfg.a}@",
        :f => "pb",
        :r => "@{params[:click]}@"
      },
      
    }
  end

end
