class Review < ActiveRecord::Base
  belongs_to :restaurant, :user
  validates :rating,
    presence: true,
    numericality: { only_integer: true },
    length: { in: 6..20 }
  validates :body,
  presence: true,
  length: {
    minimum: 5,
    maximum: 250,
    tokenizer: lambda { |str| str.scan(/\w+/) },
    too_short: "A description must have at least %{count} words",
    too_long: "A description must have at most %{count} words"
  }
end
