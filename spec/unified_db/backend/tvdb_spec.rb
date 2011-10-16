require 'spec_helper'

describe UnifiedDB::Backend::TVDB do
  subject { described_class.new }
  
  it "should return valid find by title" do
    result = subject.find(:title => 'StarGate SG-1')
    result.class.should eql(Hash)
    do_sort(result.keys).should eql([:result, :service, :status])
    result[:status].should eql('success')
    result[:service].should eql('tvdb')
    result[:result].class.should eql(Array)
    result[:result].size.should eql 1
    
    first_result = result[:result].first
    first_result.class.should eql(UnifiedDB::Result::Title)
    first_result.id.should eql('72449')
    first_result.title.should eql('Stargate SG-1')
    first_result.year.should eql('1997')
    
    encoded = Yajl::Encoder.new.encode result
    decoded = Yajl::Parser.new.parse encoded
    
    decoded.class.should eql(Hash)
    do_sort(decoded.keys).should eql(['result', 'service', 'status'])
    decoded['status'].should eql('success')
    decoded['service'].should eql('tvdb')
    decoded['result'].class.should eql(Array)
    decoded['result'].size.should eql 1
    
    first_result = decoded['result'].first
    first_result.class.should eql(Hash)
    first_result['id'].should eql('72449')
    first_result['title'].should eql('Stargate SG-1')
    first_result['year'].should eql('1997')
  end
  
  it "should return empty array if invalid find by title specified" do
    result = subject.find(:title => "qwertyuiopasdfghjkllzxcvbnm")
    result.class.should eql(Hash)
    do_sort(result.keys).should eql([:result, :service, :status])
    result[:status].should eql('success')
    result[:service].should eql('tvdb')
    result[:result].class.should eql(Array)
    result[:result].size.should eql(0)
  end
    
  
  it "should return valid find by id" do
    result = subject.find(:id => '72449')
    result.class.should eql(Hash)
    do_sort(result.keys).should eql([:result, :service, :status])
    result[:status].should eql('success')
    result[:service].should eql('tvdb')
    
    result[:result].class.should eql(UnifiedDB::Result::ID)
    result[:result].id.should eql('72449')
    result[:result].title.should eql('Stargate SG-1')
    result[:result].overview.class.should eql(String)
    result[:result].overview.length.should be > 20
    result[:result].release_date.class.should eql(String)
    result[:result].genres.should eql(["Action and Adventure", "Science-Fiction"])
    result[:result].rating.class.should eql(Float)
    result[:result].rating.should be > 4
    result[:result].rating.should be < 10
    result[:result].runtime.should eql(60)
    result[:result].actors.class.should eql(Array)
    result[:result].actors.first.should eql({"Richard Dean Anderson"=>"Col./Gen. Jack O'Neill"})
    result[:result].directors.should eql([])
    result[:result].writers.should eql([])
    result[:result].posters.class.should eql(Array)
    result[:result].posters.size.should be > 0
  end
  
  it "should return error if id was not found" do
    result = subject.find(:id => '72449123')
    result.class.should eql(Hash)
    do_sort(result.keys).should eql([:reason, :status])
    result[:status].should eql('error')
    result[:reason].should eql('not found')
  end
  
end
