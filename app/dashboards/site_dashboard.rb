require "administrate/base_dashboard"

class SiteDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    item: Field::HasMany,
    user_site: Field::HasMany,
    user: Field::HasMany,
    id: Field::Number,
    url: Field::String,
    name: Field::String,
    rss: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    recent_item_link: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :item,
    :user_site,
    :user,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :item,
    :user_site,
    :user,
    :id,
    :url,
    :name,
    :rss,
    :created_at,
    :updated_at,
    :recent_item_link,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :item,
    :user_site,
    :user,
    :url,
    :name,
    :rss,
    :recent_item_link,
  ].freeze

  # Overwrite this method to customize how sites are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(site)
  #   "Site ##{site.id}"
  # end
end
