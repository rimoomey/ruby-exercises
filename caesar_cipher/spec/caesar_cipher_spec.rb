# frozen_string_literal: false

require './lib/caesar_cipher'

describe '#encode' do
  it 'shifts a single character forward' do
    expect(encode('z', 1)).to eql('a')
  end

  it 'shifts multiple characters forward' do
    expect(encode('ABC', 2)).to eql('CDE')
  end

  it 'does not shift special characters' do
    expect(encode('//', 2)).to eql('//')
  end

  it 'shifts a single character in reverse' do
    expect(encode('a', -1)).to eql('z')
  end
end
