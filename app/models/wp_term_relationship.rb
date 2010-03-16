require 'composite_primary_keys'

class WpTermRelationship < ActiveRecord::Base
  set_primary_keys :object_id, :term_taxonomy_id
  self.abstract_class = true
  establish_connection "wordpress"
  set_table_name 'wp_term_relationships'

  belongs_to :wp_post, :foreign_key => 'object_id', :primary_key => 'ID'
  has_one :wp_term_taxonomy, :foreign_key => 'term_taxonomy_id'
end
