require_relative '../lib/app'

describe "the keys_name method" do
  
  it "should return an array of strings" do
    expect(keys_name).to be_an_instance_of(Array)
    expect(keys_name.all?(String)).to be true
  end


  it "should contain at least a few sample values" do
    expect(keys_name).to include("BTC") 
    expect(keys_name).to include("ETH")
    expect(keys_name).to include("DOGE")
  end

end


describe "the crypto_hash method" do
  it "should return a value" do
    expect(crypto_hash.class).not_to be_nil
  end

  it "should return an array of hashes" do
    expect(crypto_hash).to be_an_instance_of(Array)
    expect(crypto_hash.all?(Hash)).to be true
  end
end

 describe "the crypto_hash method" do
   it "should contain at least a few sample values" do
     expect(crypto_hash).to include({keys_name[0] => values_money[0]})
   end
 end



