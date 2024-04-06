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
require "rails_helper"

RSpec.describe Example do
  pending "add some examples to (or delete) #{__FILE__}"
end
