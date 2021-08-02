# frozen_string_literal: true

require 'rspec/autorun'
require './logs'

describe '#most_page_views' do
  it 'should receive a log as an argument' do
    expect(Logs).to respond_to(:most_page_views).with(1).argument
  end

  it 'should return a list of webpages ordered by most page views to least page views' do
    logs_list = Logs.most_page_views('webserver.log')
    target = [
      ['/about/2', 90],
      ['/contact', 89],
      ['/index', 82],
      ['/about', 81],
      ['/help_page/1', 80],
      ['/home', 78]
    ]
    expect(logs_list).to eq target
  end

  it 'should return a list of webpages with most unique page views ordered from most views to least' do
    logs_list = Logs.most_unique_views('webserver.log')
    target = [
      ['/help_page/1', 23],
      ['/contact', 23],
      ['/home', 23],
      ['/index', 23],
      ['/about/2', 22],
      ['/about', 21]
    ]
    expect(logs_list).to eq target
  end
end
