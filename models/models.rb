require 'sqlite3'
require 'sequel'
require 'digest/md5'

class REM
  def self.connect options
    @@db = Sequel.connect options
    @@boards = @@db[:boards]
    @@yarns = @@db[:yarns]
    @@posts = @@db[:posts]
    @@files = @@db[:files]
    @@cooldowns = @@db[:cooldowns]
  end
end

class BoardNotFound < StandardError
  def initialize msg = 'No such board found'
    super
  end
end

class YarnNotFound < StandardError
  def initialize msg = 'No such yarn found'
    super
  end
end

class PostNotFound < StandardError
  def initialize msg = 'No such post found'
    super
  end
end

class FileNotFound < StandardError
  def initialize msg = 'No such file found'
    super
  end
end

%w[board yarn post cooldown attachment image].each do |f|
  require_relative "sequel/#{f}"
end
