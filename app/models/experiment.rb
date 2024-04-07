# == Schema Information
#
# Table name: experiments
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  primary_id :bigint
#  user_id    :bigint           not null
#
# Indexes
#
#  index_experiments_on_primary_id  (primary_id)
#  index_experiments_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (primary_id => examples.id)
#  fk_rails_...  (user_id => users.id)
#
class Experiment < ApplicationRecord
  attr_accessor :primary_example

  after_create :create_primary_example

  belongs_to :primary, class_name: "Example", optional: true
  belongs_to :user
  has_many :examples

  def create_primary_example
    the_primary_example = examples.create(
      content: primary_example,
      user: user
    )

    self.update(primary: the_primary_example)
  end

  def to_s
    primary ? primary.content : "No primary example set"
  end
end
