require 'pry'
require_relative '../lib/concerns/findable'

class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end

  def genres
    genre = songs.map {|song| song.genre}
    genre.uniq
  end

  def songs
    @songs
  end

  def save
    @@all << self
  end

  # def self.find(name)
  #   self.all.detect{ |artist| artist.name == name }
  # end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end
end
