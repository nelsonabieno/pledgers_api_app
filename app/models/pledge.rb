class Pledge < ActiveRecord::Base
  belongs_to :contributor
  belongs_to :project
end