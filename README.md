# The Youtube Ruby Gem

[![Build Status](https://travis-ci.org/copyrightly/youtube.png?branch=master)](https://travis-ci.org/copyrightly/youtube)
[![Dependency Status](https://gemnasium.com/copyrightly/youtube.png)](https://gemnasium.com/copyrightly/youtube)
[![Code Climate](https://codeclimate.com/github/copyrightly/youtube.png)](https://codeclimate.com/github/copyrightly/youtube)
[![Coverage Status](https://coveralls.io/repos/copyrightly/youtube/badge.png?branch=master)](https://coveralls.io/r/copyrightly/youtube)

A Ruby interface to the Youtube API

## Installation

```ruby
gem 'youtube', github: 'octoly/youtube'
```

## Usage

```ruby
@yt = Youtube::Client.new(developer_key: 'youtube_api_key')

@video = @yt.video(id: 'fD1eRbq09yU')
@videos = @yt.video(id: ['fD1eRbq09yU', 'AVjvsgcBKrs'])

@channel = @yt.channel(id: 'UCVrPiUtl29kULN2HIAm244Q')
@channels = @yt.channel(id: ['UCMmADDDgI-dXaPGoIZ3qIsQ', 'UCVrPiUtl29kULN2HIAm244Q'])
```
