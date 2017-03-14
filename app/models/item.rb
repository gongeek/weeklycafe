class Item < ApplicationRecord
  belongs_to :site

  def self.group_by_day (items, good_site_ids)
    items=items.reject { |item| !(good_site_ids.include? item.site_id) }
    groups=[]
    temp_hash=Hash.new
    tag_day=''
    items.reverse.each_with_index do |item, index|
      item_day=item.create_day
      if index==0
        tag_day=item_day
        temp_hash[:day]=tag_day
        temp_hash[:items]=[item]
        if items.length == 1
          groups.push(temp_hash)
        end
      else
        if item_day!=tag_day
          temp_hash[:items].sort! { |a, b| b.access_num.to_i <=>a.access_num.to_i }
          groups.push(temp_hash)
          temp_hash=Hash.new
          tag_day=item_day
          temp_hash[:day]=tag_day
          temp_hash[:items]=[item]
        else
          temp_hash[:items].push(item)
          if index==items.length-1
            temp_hash[:items].sort! { |a, b| b.access_num.to_i <=>a.access_num.to_i }
            groups.push(temp_hash)
          end
        end
      end
    end
    groups
  end

  def create_day
    Date.strptime(self.created_at.to_s, "%Y-%m-%d")
  end
end