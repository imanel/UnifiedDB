require 'spec_helper'

describe UnifiedDB::Backend::IMDB do
  subject { described_class.new }
  
  it "should return valid find by title" do
    result = subject.find(:title => 'Dark Knight')
    result.class.should eql(Hash)
    do_sort(result.keys).should eql([:result, :service, :status])
    result[:status].should eql('success')
    result[:service].should eql('imdb')
    result[:result].class.should eql(Array)
    result[:result].size.should be > 18
    
    first_result = result[:result].first
    first_result.class.should eql(UnifiedDB::Result::Title)
    first_result.id.should eql('tt0468569')
    first_result.title.should eql('The Dark Knight')
    first_result.year.should eql('2008')
    
    encoded = Yajl::Encoder.new.encode result
    decoded = Yajl::Parser.new.parse encoded
    
    decoded.class.should eql(Hash)
    do_sort(decoded.keys).should eql(['result', 'service', 'status'])
    decoded['status'].should eql('success')
    decoded['service'].should eql('imdb')
    decoded['result'].class.should eql(Array)
    decoded['result'].size.should be > 18
    
    first_result = decoded['result'].first
    first_result.class.should eql(Hash)
    first_result['id'].should eql('tt0468569')
    first_result['title'].should eql('The Dark Knight')
    first_result['year'].should eql('2008')
  end
  
  it "should return empty array if invalid find by title specified" do
    result = subject.find(:title => "qwertyuiopasdfghjkllzxcvbnm")
    result.class.should eql(Hash)
    do_sort(result.keys).should eql([:result, :service, :status])
    result[:status].should eql('success')
    result[:service].should eql('imdb')
    result[:result].class.should eql(Array)
    result[:result].size.should eql(0)
  end
    
  
  it "should return valid find by id" do
    result = subject.find(:id => 'tt0468569')
    result.class.should eql(Hash)
    do_sort(result.keys).should eql([:result, :service, :status])
    result[:status].should eql('success')
    result[:service].should eql('imdb')
    
    result[:result].class.should eql(UnifiedDB::Result::ID)
    result[:result].id.should eql('tt0468569')
    result[:result].title.should eql('The Dark Knight')
    result[:result].overview.class.should eql(String)
    result[:result].overview.length.should be > 20
    result[:result].release_date.class.should eql(String)
    result[:result].genres.should eql(["Action", "Crime", "Drama", "Thriller"])
    result[:result].rating.class.should eql(Float)
    result[:result].rating.should be > 4
    result[:result].rating.should be < 10
    result[:result].runtime.should eql(152)
    result[:result].actors.class.should eql(Array)
    result[:result].actors.first.should eql({"Christian Bale" => "Bruce Wayne/Batman"})
    result[:result].directors.should eql(["Christopher Nolan"])
    result[:result].writers.should eql(["Jonathan Nolan", "Christopher Nolan"])
    result[:result].posters.class.should eql(Array)
    result[:result].posters.size.should be > 0
  end
  
  it "should return error if id was not found" do
    result = subject.find(:id => 'tt046856910')
    result.class.should eql(Hash)
    do_sort(result.keys).should eql([:reason, :status])
    result[:status].should eql('error')
    result[:reason].should eql('not found')
  end
  
end
