require 'appscript'
require 'sinatra'

set :logging, nil

get '/' do

  def status

    status = Appscript::app('Spotify').player_state.get.to_s
    return status

  end

  def trackName

    trackName = Appscript::app('Spotify').current_track.name.get
    return trackName

  end

  def trackArtist

    trackArtist = Appscript::app('Spotify').current_track.artist.get
    return trackArtist

  end

  def trackAlbum

    trackAlbum = Appscript::app('Spotify').current_track.album.get
    return trackAlbum

  end

  @title = "Red Sashimi is kicking out the jams!"

  unless status == "paused"
    "Now playing #{ trackName } by #{ trackArtist }"
  end

  erb :layout
end

get '/sinatra' do
  redirect "http://sinatrarb.com"
end

get '/spotify' do
  redirect "http://spotify.com"
end