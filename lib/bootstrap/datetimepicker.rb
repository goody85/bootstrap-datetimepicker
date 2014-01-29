require "bootstrap/datetimepicker/version"

module Bootstrap
  module DateTimePicker
    class << self
      def load!
        register_rails_engine if rails?
      end

      # Paths
      def gem_path
        @gem_path ||= File.expand_path '..', File.dirname(__FILE__)
      end

      def assets_path
        @assets_path ||= File.join gem_path, 'vendor', 'assets'
      end

      def stylesheets_path
        File.join assets_path, 'stylesheets'
      end

      def javascripts_path
        File.join assets_path, 'javascripts'
      end

      # Environment detection helpers
      def asset_pipeline?
        defined?(::Sprockets)
      end

      def rails?
        defined?(::Rails)
      end

      private
      def register_rails_engine
        require 'bootstrap/datetimepicker/rails/engine' if ::Rails.version >= '3.1'
      end
    end
  end
end

Bootstrap::DateTimePicker.load!