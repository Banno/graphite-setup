require 'spec_helper'

describe 'graphite' do
  it 'accepts data' do
    client = GraphiteAPI.new( graphite: 'relay:2003' )
    expect(client.metrics("test.serverspec" => 1).size).to eq 1
  end

  it 'writes the data to whisper' do
    client = GraphiteAPI.new( graphite: 'relay:2003' )
    client.metrics("test.serverspec" => 1)
    sleep 5
    expect(file('/opt/graphite/storage/whispera/test/serverspec.wsp')).to be_file
    expect(file('/opt/graphite/storage/whisperb/test/serverspec.wsp')).to_not be_file
  end

  it 'hashes keys to different carbon nodes' do
    client = GraphiteAPI.new( graphite: 'relay:2003' )
    client.metrics("test.serverspectest" => 1)
    sleep 5
    expect(file('/opt/graphite/storage/whispera/test/serverspectest.wsp')).to_not be_file
    expect(file('/opt/graphite/storage/whisperb/test/serverspectest.wsp')).to be_file
  end

  it 'allows data retrieval' do
    conn = Faraday.new(:url => "http://web") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
    datapoints = JSON.parse(conn.get('/render?&target=test.serverspec&from=-1min&rawData=true&format=json').body).first['datapoints'].map {|k| k.first}
    unique_datapoints = datapoints.to_set.size
    expect(unique_datapoints).to be > 1
  end
end
