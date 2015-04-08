require 'spec_helper'

describe Fastenv do
  it 'has a version number' do
    expect(Fastenv::VERSION).not_to be nil
  end

  describe "when asked about an existing environment variable" do
    let(:expected_env_var_value) { '/this/path/may/or/may/not/exist' }

    before do
      ENV["THIS_ENV_VAR_IS_SET"] = expected_env_var_value
    end

    it "returns the value of the environment variable" do
      expect(Fastenv.this_env_var_is_set).to eq expected_env_var_value
    end
  end

  describe "when asked about a non-existent environment variable" do
    let(:unset_env_var) { 'THIS_ENV_VAR_DOES_NOT_EXIST' }

    before do
      ENV[unset_env_var] = nil
    end

    it "raises an argument error" do
      expect{Fastenv.this_env_var_does_not_exist}.to raise_error(NameError)
    end

    it "gives a good error message" do
      expect{Fastenv.this_env_var_does_not_exist}
        .to raise_error.with_message(/Couldn't find .* #{unset_env_var}/)
    end
  end
end

