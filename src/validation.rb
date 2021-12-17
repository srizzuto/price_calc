
class Validations
  def self.is_empty_list?(purchased)
    !purchased.any?
  end

  def self.exist_all_items?(uniq_items, stored_items)
    !uniq_items.all? { |i| stored_items.include?(i) }
  end

  def self.is_a_valid_input?(purchased, uniq_items, stored_items)
    self.is_empty_list?(purchased) || self.exist_all_items?(uniq_items, stored_items)
  end

  def self.quit?(purchased)
    purchased[0] == "quit" && purchased.length == 1
  end
end