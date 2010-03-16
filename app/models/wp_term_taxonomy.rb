class WpTermTaxonomy < ActiveRecord::Base
  set_primary_key 'term_taxonomy_id'
  self.abstract_class = true
  establish_connection "wordpress"
  set_table_name 'wp_term_taxonomy'


  belongs_to :wp_term_relationship, :foreign_key => 'term_taxonomy_id'
  belongs_to :wp_term, :foreign_key => 'term_id'
end
