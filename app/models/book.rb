class Book < ApplicationRecord
  include WorkflowActiverecord
  workflow do

    state :writing do
      event :review, :transitions_to => :reviewing
    end

    state :reviewing do
      event :write, :transitions_to => :writing
      event :print, :transitions_to => :printing
    end

    state :printing do
      event :write, :transitions_to => :writing
      event :publish, :transitions_to => :published
    end

    state :published do
      event :write, :transitions_to => :writing
    end

  end
end
