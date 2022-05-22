class Pledge < ActiveRecord::Base
  belongs_to :contributor,  foreign_key: 'contributors_id'
  belongs_to :project,  foreign_key: 'projects_id'
end