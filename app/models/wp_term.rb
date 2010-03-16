class WpTerm < ActiveRecord::Base
  self.abstract_class = true
  establish_connection "wordpress"
  set_table_name 'wp_terms'
  set_primary_key 'term_id'

  has_many :wp_term_taxonomies, :source => 'wp_term_taxonomy'
  has_many :wp_term_relationships, :through => :wp_term_taxonomies
  has_many :wp_posts, :foreign_key => 'object_id', :through => :wp_term_relationships

  def self.move_to_radiant
    WpTerm.find(:all).each do |term|
      MetaTag.find_or_create_by_name(term.name.strip.squeeze(' '))
    end
  end
end
