# == Schema Information
#
# Table name: examples
#
#  id            :bigint           not null, primary key
#  content       :text
#  embedding     :vector(3072)
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
  auto_strip_attributes :content, squish: true
  before_save :set_embedding

  validates :content, uniqueness: {scope: :experiment_id}

  belongs_to :experiment
  belongs_to :user

  has_neighbors :embedding

  def to_s
    content
  end

  def set_embedding
    client = OpenAI::Client.new
    
    response = client.embeddings(
      parameters: {
        model: "text-embedding-3-large",
        input: content
      }
    )

    self.embedding = response.dig("data", 0, "embedding")
  end
end
