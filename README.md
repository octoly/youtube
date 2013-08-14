# The Youtube Ruby Gem

[![Build Status](https://travis-ci.org/copyrightly/youtube.png?branch=master)](https://travis-ci.org/copyrightly/youtube)
[![Dependency Status](https://gemnasium.com/copyrightly/youtube.png)](https://gemnasium.com/copyrightly/youtube)
[![Code Climate](https://codeclimate.com/github/copyrightly/youtube.png)](https://codeclimate.com/github/copyrightly/youtube)
[![Coverage Status](https://coveralls.io/repos/copyrightly/youtube/badge.png?branch=master)](https://coveralls.io/r/copyrightly/youtube)

A Ruby interface to the Youtube API

## Installation

gem 'youtube', git: 'https://github.com/copyrightly/youtube'

## Usage

@yt = Youtube::Client.new(developer_key: 'youtube_api_key')
@video = @yt.video(id: 'fD1eRbq09yU')
