module ActiveProjection
  module Autoload
    include ActiveEvent::Support::Autoload

    private

    def self.dir_names
      %w(app/validators app/models app/projections)
    end
  end
end
