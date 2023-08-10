# frozen_string_literal: true

class ApplicationService
  include ErrorsConcern

  def self.perform(params = {}, &)
    new(params).call(&)
  end

  def initialize(params = {})
    @params = params
  end

  def call; end

  private

  attr_reader :params

  def serialized_params
    params.to_json
  end
end
