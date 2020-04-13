# Helper Functions for System Info
class System
def self.save_game
  $gtk.serialize_state('game_save.txt', $gtk.args.state)
end

def self.load_game
  $gtk.args.state = $gtk.deserialize_state('game_save.txt')
end

def self.add_to_inventory(item, amt)
  current_item = System.inventory[item] || item
  System.inventory[item] += amt
end

def self.add_total_xp(amt)
 System.player[:total_xp] += amt
end


def self.system_info
  $gtk.args.state[:system_info]
end

def self.player
  $gtk.args.state[:system_info][:player]
end

def self.inventory
  $gtk.args.state[:system_info][:inventory]
end

def self.game_stats
  $gtk.args.state[:system_info][:game_stats]
end

end
