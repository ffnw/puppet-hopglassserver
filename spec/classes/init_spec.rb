require 'spec_helper'
describe 'hopglassserver' do

  context 'with defaults for all parameters' do
    it { should contain_class('hopglassserver') }
  end
end
