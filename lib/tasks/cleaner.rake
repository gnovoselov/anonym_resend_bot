# frozen_string_literal: true

namespace :cleaner do
  task perform: [:environment] do
    CleanerService.perform
  end
end
