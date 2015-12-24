require 'spec_helper'

describe 'multiple_include' do
  let(:msg) { 'expected multiple include' }

  context 'with fix disabled' do
    context 'include single class' do
      let(:code) { "include foo" }

      it 'should not detect any problems' do
        expect(problems).to have(0).problems
      end
    end

    context 'include multiple class' do
      let(:code) { "include foo, bar, baz" }

      it 'should detect a multiple problem' do
        expect(problems).to have(2).problems
      end

      it 'should create a warning' do
        expect(problems).to contain_warning(msg).on_line(1).in_column(12)
      end
    end
  end
end

describe 'enclosed_reserved_words' do
  let(:msg) { 'check reserved words enclosed in quotes' }

  context 'not enclosed reserved words' do
    let(:code) { "ensure => present" }

    it 'should not detect any problems' do
      expect(problems).to have(0).problems
    end
  end

  context 'enclosed reserved words' do
    let(:code) { "ensure => 'present'" }

    it 'should not detect any problems' do
      expect(problems).to have(1).problems
    end
  end
end
