class AdtekioAdnetworks::Postbacks::Matomy < AdtekioAdnetworks::BasePostbackClass
  include AdtekioAdnetworks::BasePostbacks

  define_postback_for :android, :mac do
    { :url => "http://network.adsmarket.com/cevent",
      :params => {
        :p1 => "@{Digest::SHA1.hexdigest(params[:mid])}@",
        :programid => "@{params[:partner_data]}@",
        :type => "lead",
        :visitor_cid => "@{params[:click]}@"
      },
      
    }
  end

  define_postback_for :ios, :mac do
    { :url => "http://network.adsmarket.com/cevent",
      :params => {
        :p1 => "@{Digest::SHA1.hexdigest(params[:mid])}@",
        :programid => "@{params[:partner_data]}@",
        :type => "lead",
        :visitor_cid => "@{params[:click]}@"
      },
      :store_user => true
    }
  end

  define_postback_for :ios, :fun do
    { :url => "http://network.adsmarket.com/cevent",
      :params => {
        :p1 => "@{Digest::SHA1.hexdigest(params[:mid])}@",
        :programid => "@{user.click_data['partner_data']}@",
        :type => "lead",
        :visitor_cid => "@{user.click_data['click']}@",
        :externalid => "funnel"
      },
      :user_required => true,
      :check => "event.params[:funnel_step] == 'start_tutorial'"
    }
  end

  define_postback_for :ios, :pay do
    { :url => "http://network.adsmarket.com/cevent",
      :params => {
        :p1 => "@{Digest::SHA1.hexdigest(params[:mid])}@",
        :programid => "@{user.click_data['partner_data']}@",
        :type => "lead",
        :visitor_cid => "@{user.click_data['click']}@",
        :externalid => "sale"
      },
      :user_required => true
    }
  end

end
