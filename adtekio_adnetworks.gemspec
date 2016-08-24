# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: adtekio_adnetworks 0.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "adtekio_adnetworks"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Gerrit Riessen"]
  s.date = "2016-08-24"
  s.description = "Encapsulate adnetworks and their importers."
  s.email = "gerrit@eccrine.io"
  s.extra_rdoc_files = [
    "README.md"
  ]
  s.files = [
    ".ruby-gemset",
    ".ruby-version",
    "Gemfile",
    "README.md",
    "Rakefile",
    "VERSION",
    "adtekio_adnetworks.gemspec",
    "lib/adtekio_adnetworks.rb",
    "lib/adtekio_adnetworks/importers.rb",
    "lib/adtekio_adnetworks/importers/cost/adcolony.rb",
    "lib/adtekio_adnetworks/importers/cost/adquant.rb",
    "lib/adtekio_adnetworks/importers/cost/appia.rb",
    "lib/adtekio_adnetworks/importers/cost/applifier.rb",
    "lib/adtekio_adnetworks/importers/cost/applift.rb",
    "lib/adtekio_adnetworks/importers/cost/applovin.rb",
    "lib/adtekio_adnetworks/importers/cost/bidmotion.rb",
    "lib/adtekio_adnetworks/importers/cost/chartboost.rb",
    "lib/adtekio_adnetworks/importers/cost/crossinstall.rb",
    "lib/adtekio_adnetworks/importers/cost/facebook.rb",
    "lib/adtekio_adnetworks/importers/cost/fractionalmedia.rb",
    "lib/adtekio_adnetworks/importers/cost/fyber.rb",
    "lib/adtekio_adnetworks/importers/cost/gamegenetics.rb",
    "lib/adtekio_adnetworks/importers/cost/glispa.rb",
    "lib/adtekio_adnetworks/importers/cost/googleadwords.rb",
    "lib/adtekio_adnetworks/importers/cost/jampp.rb",
    "lib/adtekio_adnetworks/importers/cost/leadbolt.rb",
    "lib/adtekio_adnetworks/importers/cost/lifestreet.rb",
    "lib/adtekio_adnetworks/importers/cost/loopme.rb",
    "lib/adtekio_adnetworks/importers/cost/matomy.rb",
    "lib/adtekio_adnetworks/importers/cost/mdotm.rb",
    "lib/adtekio_adnetworks/importers/cost/mmg.rb",
    "lib/adtekio_adnetworks/importers/cost/mnectar.rb",
    "lib/adtekio_adnetworks/importers/cost/moboqo.rb",
    "lib/adtekio_adnetworks/importers/cost/mobpartner.rb",
    "lib/adtekio_adnetworks/importers/cost/nanigans.rb",
    "lib/adtekio_adnetworks/importers/cost/revmob.rb",
    "lib/adtekio_adnetworks/importers/cost/rtbmob.rb",
    "lib/adtekio_adnetworks/importers/cost/startapp.rb",
    "lib/adtekio_adnetworks/importers/cost/supersonic.rb",
    "lib/adtekio_adnetworks/importers/cost/tapjoy.rb",
    "lib/adtekio_adnetworks/importers/cost/tokenads.rb",
    "lib/adtekio_adnetworks/importers/cost/unilead.rb",
    "lib/adtekio_adnetworks/importers/cost/vungle.rb",
    "lib/adtekio_adnetworks/importers/cost_import.rb",
    "lib/adtekio_adnetworks/importers/revenue/adcolony.rb",
    "lib/adtekio_adnetworks/importers/revenue/applifier.rb",
    "lib/adtekio_adnetworks/importers/revenue/applovin.rb",
    "lib/adtekio_adnetworks/importers/revenue/chartboost.rb",
    "lib/adtekio_adnetworks/importers/revenue/flurry.rb",
    "lib/adtekio_adnetworks/importers/revenue/fyber.rb",
    "lib/adtekio_adnetworks/importers/revenue/hypr_mx.rb",
    "lib/adtekio_adnetworks/importers/revenue/lifestreet.rb",
    "lib/adtekio_adnetworks/importers/revenue/mdotm.rb",
    "lib/adtekio_adnetworks/importers/revenue/mopub.rb",
    "lib/adtekio_adnetworks/importers/revenue/nexage.rb",
    "lib/adtekio_adnetworks/importers/revenue/supersonic.rb",
    "lib/adtekio_adnetworks/importers/revenue/tapsense.rb",
    "lib/adtekio_adnetworks/importers/revenue/trialpay.rb",
    "lib/adtekio_adnetworks/importers/revenue/vungle.rb",
    "lib/adtekio_adnetworks/importers/revenue_import.rb",
    "lib/adtekio_adnetworks/postbacks.rb",
    "lib/adtekio_adnetworks/postbacks/aarki.rb",
    "lib/adtekio_adnetworks/postbacks/adaction.rb",
    "lib/adtekio_adnetworks/postbacks/adcash.rb",
    "lib/adtekio_adnetworks/postbacks/adcolony.rb",
    "lib/adtekio_adnetworks/postbacks/adgorithms.rb",
    "lib/adtekio_adnetworks/postbacks/adjapon_nend.rb",
    "lib/adtekio_adnetworks/postbacks/adknowledge.rb",
    "lib/adtekio_adnetworks/postbacks/admob.rb",
    "lib/adtekio_adnetworks/postbacks/adp.rb",
    "lib/adtekio_adnetworks/postbacks/adperio.rb",
    "lib/adtekio_adnetworks/postbacks/adquant.rb",
    "lib/adtekio_adnetworks/postbacks/adstract.rb",
    "lib/adtekio_adnetworks/postbacks/adxperience.rb",
    "lib/adtekio_adnetworks/postbacks/airpush.rb",
    "lib/adtekio_adnetworks/postbacks/app_chocolate.rb",
    "lib/adtekio_adnetworks/postbacks/appfload.rb",
    "lib/adtekio_adnetworks/postbacks/appia.rb",
    "lib/adtekio_adnetworks/postbacks/appintheair.rb",
    "lib/adtekio_adnetworks/postbacks/applifier.rb",
    "lib/adtekio_adnetworks/postbacks/applift.rb",
    "lib/adtekio_adnetworks/postbacks/applovin.rb",
    "lib/adtekio_adnetworks/postbacks/appnext.rb",
    "lib/adtekio_adnetworks/postbacks/appredeem.rb",
    "lib/adtekio_adnetworks/postbacks/appsfire.rb",
    "lib/adtekio_adnetworks/postbacks/appturbo.rb",
    "lib/adtekio_adnetworks/postbacks/apsalar.rb",
    "lib/adtekio_adnetworks/postbacks/bee7.rb",
    "lib/adtekio_adnetworks/postbacks/bidmotion.rb",
    "lib/adtekio_adnetworks/postbacks/blindferretmedia.rb",
    "lib/adtekio_adnetworks/postbacks/chartboost.rb",
    "lib/adtekio_adnetworks/postbacks/cheetah.rb",
    "lib/adtekio_adnetworks/postbacks/clickky.rb",
    "lib/adtekio_adnetworks/postbacks/covus.rb",
    "lib/adtekio_adnetworks/postbacks/crossinstall.rb",
    "lib/adtekio_adnetworks/postbacks/cyberagent_ameba.rb",
    "lib/adtekio_adnetworks/postbacks/cyberagent_amoad.rb",
    "lib/adtekio_adnetworks/postbacks/cyberagent_imobile.rb",
    "lib/adtekio_adnetworks/postbacks/cyberagent_kjnw.rb",
    "lib/adtekio_adnetworks/postbacks/cyberagent_maio.rb",
    "lib/adtekio_adnetworks/postbacks/cyberagent_nend.rb",
    "lib/adtekio_adnetworks/postbacks/cyberagent_smartc.rb",
    "lib/adtekio_adnetworks/postbacks/cyberagent_smartnews.rb",
    "lib/adtekio_adnetworks/postbacks/cyberz_asta.rb",
    "lib/adtekio_adnetworks/postbacks/cyberz_bead.rb",
    "lib/adtekio_adnetworks/postbacks/cyberz_imobile.rb",
    "lib/adtekio_adnetworks/postbacks/cyberz_nend.rb",
    "lib/adtekio_adnetworks/postbacks/datalead.rb",
    "lib/adtekio_adnetworks/postbacks/eccrine.rb",
    "lib/adtekio_adnetworks/postbacks/eeline.rb",
    "lib/adtekio_adnetworks/postbacks/f5.rb",
    "lib/adtekio_adnetworks/postbacks/fiksu.rb",
    "lib/adtekio_adnetworks/postbacks/fiksu_applift.rb",
    "lib/adtekio_adnetworks/postbacks/fractionalmedia.rb",
    "lib/adtekio_adnetworks/postbacks/fyber.rb",
    "lib/adtekio_adnetworks/postbacks/gamegenetics.rb",
    "lib/adtekio_adnetworks/postbacks/ginga.rb",
    "lib/adtekio_adnetworks/postbacks/glispa.rb",
    "lib/adtekio_adnetworks/postbacks/googleadwords.rb",
    "lib/adtekio_adnetworks/postbacks/growmobile.rb",
    "lib/adtekio_adnetworks/postbacks/heyzap.rb",
    "lib/adtekio_adnetworks/postbacks/inmobi.rb",
    "lib/adtekio_adnetworks/postbacks/inneractive.rb",
    "lib/adtekio_adnetworks/postbacks/instal.rb",
    "lib/adtekio_adnetworks/postbacks/iqu.rb",
    "lib/adtekio_adnetworks/postbacks/ironsource.rb",
    "lib/adtekio_adnetworks/postbacks/jampp.rb",
    "lib/adtekio_adnetworks/postbacks/jestadigital.rb",
    "lib/adtekio_adnetworks/postbacks/jumpramp.rb",
    "lib/adtekio_adnetworks/postbacks/jumptap.rb",
    "lib/adtekio_adnetworks/postbacks/leadbolt.rb",
    "lib/adtekio_adnetworks/postbacks/lifestreet.rb",
    "lib/adtekio_adnetworks/postbacks/liftoff.rb",
    "lib/adtekio_adnetworks/postbacks/loopme.rb",
    "lib/adtekio_adnetworks/postbacks/magic_solver.rb",
    "lib/adtekio_adnetworks/postbacks/marimedia.rb",
    "lib/adtekio_adnetworks/postbacks/matomy.rb",
    "lib/adtekio_adnetworks/postbacks/mdotm.rb",
    "lib/adtekio_adnetworks/postbacks/misterbell.rb",
    "lib/adtekio_adnetworks/postbacks/mmg.rb",
    "lib/adtekio_adnetworks/postbacks/mnectar.rb",
    "lib/adtekio_adnetworks/postbacks/moblin.rb",
    "lib/adtekio_adnetworks/postbacks/moboqo.rb",
    "lib/adtekio_adnetworks/postbacks/mobpartner.rb",
    "lib/adtekio_adnetworks/postbacks/mopub.rb",
    "lib/adtekio_adnetworks/postbacks/motive_interactive.rb",
    "lib/adtekio_adnetworks/postbacks/mundo.rb",
    "lib/adtekio_adnetworks/postbacks/nanigans.rb",
    "lib/adtekio_adnetworks/postbacks/nativex.rb",
    "lib/adtekio_adnetworks/postbacks/neodau.rb",
    "lib/adtekio_adnetworks/postbacks/neverblue.rb",
    "lib/adtekio_adnetworks/postbacks/operamedia.rb",
    "lib/adtekio_adnetworks/postbacks/pandora.rb",
    "lib/adtekio_adnetworks/postbacks/phunware.rb",
    "lib/adtekio_adnetworks/postbacks/pirasin.rb",
    "lib/adtekio_adnetworks/postbacks/playhaven.rb",
    "lib/adtekio_adnetworks/postbacks/pocketmath.rb",
    "lib/adtekio_adnetworks/postbacks/propeller.rb",
    "lib/adtekio_adnetworks/postbacks/quixey.rb",
    "lib/adtekio_adnetworks/postbacks/realzeit.rb",
    "lib/adtekio_adnetworks/postbacks/remerge.rb",
    "lib/adtekio_adnetworks/postbacks/revmob.rb",
    "lib/adtekio_adnetworks/postbacks/ripple.rb",
    "lib/adtekio_adnetworks/postbacks/roostr.rb",
    "lib/adtekio_adnetworks/postbacks/rtbcom.rb",
    "lib/adtekio_adnetworks/postbacks/septeni.rb",
    "lib/adtekio_adnetworks/postbacks/seven_games.rb",
    "lib/adtekio_adnetworks/postbacks/startapp.rb",
    "lib/adtekio_adnetworks/postbacks/supersonic.rb",
    "lib/adtekio_adnetworks/postbacks/tapjoy.rb",
    "lib/adtekio_adnetworks/postbacks/taptica.rb",
    "lib/adtekio_adnetworks/postbacks/targetcircle.rb",
    "lib/adtekio_adnetworks/postbacks/todacell.rb",
    "lib/adtekio_adnetworks/postbacks/tokenads.rb",
    "lib/adtekio_adnetworks/postbacks/trademob.rb",
    "lib/adtekio_adnetworks/postbacks/trademob_magic_solver.rb",
    "lib/adtekio_adnetworks/postbacks/trialpay.rb",
    "lib/adtekio_adnetworks/postbacks/unilead.rb",
    "lib/adtekio_adnetworks/postbacks/uppsmobi.rb",
    "lib/adtekio_adnetworks/postbacks/vungle.rb",
    "lib/adtekio_adnetworks/postbacks/w4.rb",
    "lib/adtekio_adnetworks/postbacks/webmedia.rb",
    "lib/adtekio_adnetworks/postbacks/yahoo.rb",
    "lib/adtekio_adnetworks/postbacks/youappi.rb",
    "lib/adtekio_adnetworks/postbacks/zemail.rb",
    "test/helper.rb",
    "test/unit/test_basics.rb"
  ]
  s.homepage = "https://github.com/adtekio/adnetworks.git"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5.1"
  s.summary = "Encapsulate adnetworks and their importers."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<net-http-persistent>, [">= 0"])
      s.add_runtime_dependency(%q<addressable>, [">= 0"])
      s.add_runtime_dependency(%q<rest-client>, [">= 0"])
      s.add_runtime_dependency(%q<oauth2>, [">= 0"])
      s.add_runtime_dependency(%q<mechanize>, [">= 0"])
      s.add_runtime_dependency(%q<google-adwords-api>, [">= 0"])
      s.add_runtime_dependency(%q<google-api-client>, [">= 0"])
      s.add_runtime_dependency(%q<curb>, [">= 0"])
      s.add_runtime_dependency(%q<uuidtools>, [">= 0"])
      s.add_runtime_dependency(%q<erubis>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
      s.add_development_dependency(%q<pry-doc>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<rr>, [">= 0"])
    else
      s.add_dependency(%q<net-http-persistent>, [">= 0"])
      s.add_dependency(%q<addressable>, [">= 0"])
      s.add_dependency(%q<rest-client>, [">= 0"])
      s.add_dependency(%q<oauth2>, [">= 0"])
      s.add_dependency(%q<mechanize>, [">= 0"])
      s.add_dependency(%q<google-adwords-api>, [">= 0"])
      s.add_dependency(%q<google-api-client>, [">= 0"])
      s.add_dependency(%q<curb>, [">= 0"])
      s.add_dependency(%q<uuidtools>, [">= 0"])
      s.add_dependency(%q<erubis>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<pry>, [">= 0"])
      s.add_dependency(%q<pry-doc>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<rr>, [">= 0"])
    end
  else
    s.add_dependency(%q<net-http-persistent>, [">= 0"])
    s.add_dependency(%q<addressable>, [">= 0"])
    s.add_dependency(%q<rest-client>, [">= 0"])
    s.add_dependency(%q<oauth2>, [">= 0"])
    s.add_dependency(%q<mechanize>, [">= 0"])
    s.add_dependency(%q<google-adwords-api>, [">= 0"])
    s.add_dependency(%q<google-api-client>, [">= 0"])
    s.add_dependency(%q<curb>, [">= 0"])
    s.add_dependency(%q<uuidtools>, [">= 0"])
    s.add_dependency(%q<erubis>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<pry>, [">= 0"])
    s.add_dependency(%q<pry-doc>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<rr>, [">= 0"])
  end
end

