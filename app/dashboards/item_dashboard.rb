require "administrate/base_dashboard"

class ItemDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    site: Field::BelongsTo,
    id: Field::Number,
    name: Field::String,
    content: Field::Text,
    link: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    access_num: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :site,
    :id,
    :name,
    :content,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :site,
    :id,
    :name,
    :content,
    :link,
    :created_at,
    :updated_at,
    :access_num,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :site,
    :name,
    :content,
    :link,
    :access_num,
  ].freeze

  # Overwrite this method to customize how items are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(item)
  #   "Item ##{item.id}"
  # end
end
