#!/usr/bin/env ruby

require 'rest-client'
require 'json'

# support a more dynamic approach to Pivotal project
# support creating a branch from an existing story

story_json = RestClient.post(
    "https://www.pivotaltracker.com/services/v5/projects/23357/stories",
     { 'name' => ARGV[1] }.to_json,
    { 'X-TrackerToken' => ENV['PIVOTAL_TOKEN'], 'Content-Type' => 'application/json' })
story = JSON(story_json)

`git checkout -t -b #{ARGV[0]}/#{story['id']}/#{ARGV[1]}`

`open #{story['url']}`
