# == Schema Information
#
# Table name: examples
#
#  id            :bigint           not null, primary key
#  content       :text
#  embedding     :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  experiment_id :bigint           not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_examples_on_experiment_id  (experiment_id)
#  index_examples_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (experiment_id => experiments.id)
#  fk_rails_...  (user_id => users.id)
#
class Example < ApplicationRecord
  after_commit :set_first_primary

  auto_strip_attributes :content, squish: true

  validates :content, uniqueness: { scope: :experiment_id }

  belongs_to :experiment
  belongs_to :user

  def to_s
    content
  end

  def set_first_primary
    experiment.update(primary_id: id) if experiment.primary.nil?
  end
end
