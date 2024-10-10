class Task < ApplicationRecord
    validates :status, inclusion: { in: [0, 1], message: "must be either 0 or 1" }
    def toggle_status
        self.status = status.zero? ? 1 : 0
      save
    end
end
  