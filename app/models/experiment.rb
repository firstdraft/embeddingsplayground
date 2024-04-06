# == Schema Information
#
# Table name: experiments
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  primary_id :bigint           not null
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
  belongs_to :primary
  belongs_to :user
end
