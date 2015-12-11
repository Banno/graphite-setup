require 'spec_helper'

describe 'graphite' do
  it 'accepts data via relay' do
    client = GraphiteAPI.new( graphite: 'relay:2003' )
    expect(client.metrics("test.serverspec" => 1).size).to eq 1
  end
  
  it 'can query ingested data from web' do
    sleep 5
    conn = Faraday.new(:url => "http://web") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
    datapoints = JSON.parse(conn.get('/render?&target=test.serverspec&from=-1min&rawData=true&format=json').body).first['datapoints'].map {|k| k.first}
    unique_datapoints = datapoints.to_set.size
    expect(unique_datapoints).to be > 1
  end

end
