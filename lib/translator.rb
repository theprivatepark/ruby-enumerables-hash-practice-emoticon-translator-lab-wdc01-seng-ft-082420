require 'pry'
require 'yaml'

#place MEANING inside a hash. meaning will point to a new hash with new key and value/emoticon

def load_library(file)
  emoticon = YAML.load_file('./lib/emoticons.yml')
container = {}
  emoticon.each do |meaning,emoticon|
    container[meaning] = {}
    container[meaning][:english] = emoticon[0]
    container[meaning][:japanese] = emoticon[1]
  end
  container
end

def get_english_meaning(file,jap_emoticon)
  results = "Sorry, that emoticon was not found"
  library = load_library(file)
  library.each do |meaning, emoticons|
    if library[meaning][:japanese] == jap_emoticon
      results = meaning
    end
  end
  results
end

def get_japanese_emoticon(file, emoticon)
  results = "Sorry, that emoticon was not found"
  library = load_library(file)
  library.each do |meaning, emoticons|
    if library[meaning][:english] == emoticon
      results = library[meaning][:japanese]
  end
end
results
end
