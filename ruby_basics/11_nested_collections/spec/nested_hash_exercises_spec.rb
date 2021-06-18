require 'spec_helper'
require_relative '../exercises/nested_hash_exercises'

RSpec.describe 'Nested hash exercises' do
  describe 'add information about language exercise' do
    let(:hash) do
      {
        ruby: { initial_release: 'December 25, 1996' },
        javascript: { is_beautiful?: false }
      }
    end

    it 'adds is_beautiful?: true k/v pair to the ruby nested hash' do
      expected_output = {
        ruby: { is_beautiful?: true, initial_release: 'December 25, 1996' },
        javascript: { is_beautiful?: false }
      }
      expect(add_information_about_language(hash, :ruby, :is_beautiful?, true)).to eq(expected_output)
    end

    xit "adds initial_release: 'December 4, 1995', k/v pair to the javascript nested hash" do
      expected_output = {
        ruby: { initial_release: 'December 25, 1996' },
        javascript: { is_beautiful?: false, initial_release: 'December 4, 1995' }
      }
      expect(add_information_about_language(hash, :javascript, :initial_release, 'December 4, 1995')).to eq(expected_output)
    end
  end

  describe 'add language exercise' do
    let(:hash) do
      {
        ruby: { is_beautiful?: true, initial_release: 'December 25, 1996' },
        javascript: { is_beautiful?: false, initial_release: 'December 4, 1995' }
      }
    end

    xit 'adds a hash about java with the included kv pairs' do
      key_to_add = :java
      value_to_add = { is_beautiful?: false, initial_release: 'May 23, 1995' }
      expected_output = {
        ruby: { is_beautiful?: true, initial_release: 'December 25, 1996' },
        javascript: { is_beautiful?: false, initial_release: 'December 4, 1995' },
        java: { is_beautiful?: false, initial_release: 'May 23, 1995' }
      }
      expect(add_language(hash, key_to_add, value_to_add)).to eq(expected_output)
    end

    xit 'adds a hash about python with the included kv pairs' do
      key_to_add = :python
      value_to_add = { is_beautiful?: false, initial_release: 'Feb 20, 1991' }
      expected_output = {
        ruby: { is_beautiful?: true, initial_release: 'December 25, 1996' },
        javascript: { is_beautiful?: false, initial_release: 'December 4, 1995' },
        python: { is_beautiful?: false, initial_release: 'Feb 20, 1991' }
      }
      expect(add_language(hash, key_to_add, value_to_add)).to eq(expected_output)
    end
  end

  describe 'delete information about language exercise' do
    let(:hash) do
      {
        ruby: { is_beautiful?: true, initial_release: 'December 25, 1996' },
        javascript: { is_beautiful?: false, initial_release: 'December 4, 1995' }
      }
    end

    xit 'removes the is_beautiful? k/v pair from the ruby nested hash' do
      expected_output = {
        ruby: { initial_release: 'December 25, 1996' },
        javascript: { is_beautiful?: false, initial_release: 'December 4, 1995' }
      }
      expect(delete_information_about_language(hash, :ruby, :is_beautiful?)).to eq(expected_output)
    end

    xit 'removes the initial_release k/v pair from the javascript nested hash' do
      expected_output = {
        ruby: { is_beautiful?: true, initial_release: 'December 25, 1996' },
        javascript: { is_beautiful?: false }
      }
      expect(delete_information_about_language(hash, :javascript, :initial_release)).to eq(expected_output)
    end
  end

  describe 'delete language hash' do
    let(:hash) do
      {
        ruby: { is_beautiful?: true, initial_release: 'December 25, 1996' },
        javascript: { is_beautiful?: false, initial_release: 'December 4, 1995' }
      }
    end

    xit 'removes the ruby hash' do
      expected_output = {
        javascript: { is_beautiful?: false, initial_release: 'December 4, 1995' }
      }
      expect(delete_language(hash, :ruby)).to eq(expected_output)
    end

    xit 'removes the javascript hash' do
      expected_output = {
        ruby: { is_beautiful?: true, initial_release: 'December 25, 1996' }
      }
      expect(delete_language(hash, :javascript)).to eq(expected_output)
    end
  end

  describe 'delete beautiful languages exercise' do
    context 'when only ruby is beautiful' do
      let(:hash) do
        {
          ruby: { is_beautiful?: true, initial_release: 'December 25, 1996' },
          javascript: { is_beautiful?: false, initial_release: 'December 4, 1995' },
          python: { is_beautiful?: false, initial_release: 'Feb 20, 1991' }
        }
      end

      xit 'returns the hash without ruby' do
        expected_output = {
          javascript: { is_beautiful?: false, initial_release: 'December 4, 1995' },
          python: { is_beautiful?: false, initial_release: 'Feb 20, 1991' }
        }
        expect(delete_beautiful_languages(hash)).to eq(expected_output)
      end
    end

    context 'when javascript is beautiful (never but lets pretend)' do
      let(:hash) do
        {
          ruby: { is_beautiful?: false, initial_release: 'December 25, 1996' },
          javascript: { is_beautiful?: true, initial_release: 'December 4, 1995' },
          python: { is_beautiful?: false, initial_release: 'Feb 20, 1991' }
        }
      end

      xit 'returns the hash without javascript' do
        expected_output = {
          ruby: { is_beautiful?: false, initial_release: 'December 25, 1996' },
          python: { is_beautiful?: false, initial_release: 'Feb 20, 1991' }
        }
        expect(delete_beautiful_languages(hash)).to eq(expected_output)
      end
    end
  end

  describe 'find language facts exercise' do
    let(:hash) do
      {
        ruby: { facts: ['was made for programmer happiness', 'its code is beautiful'],
                initial_release: 'December 25, 1996',
                is_beautiful?: true },

        javascript: { facts: ['you have to use semicolons everywhere', "its real name isn't even javascript"],
                      initial_release: 'December 4, 1995',
                      is_beautiful?: false }
      }
    end

    xit 'returns an array with the first fact given for each language' do
      expected_output = ['was made for programmer happiness', 'you have to use semicolons everywhere']
      expect(find_language_facts(hash, 0)).to eq(expected_output)
    end

    xit 'returns an array with the second fact given for each language' do
      expected_output = ['its code is beautiful', "its real name isn't even javascript"]
      expect(find_language_facts(hash, 1)).to eq(expected_output)
    end
  end
end