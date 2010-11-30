module Animoto
  module Resources
    module Jobs
      class Directing < Animoto::Resources::Jobs::Base
    
        endpoint '/jobs/directing'

        # @return [Hash<Symbol,Object>]
        # @see Animoto::Support::StandardEnvelope::ClassMethods#unpack_standard_envelope
        def self.unpack_standard_envelope body
          super.merge(:storyboard_url => unpack_links(body)['storyboard'])
        end
    
        attr_reader :storyboard
        attr_reader :storyboard_url

        # @return [Jobs::Directing]
        # @see Animoto::Jobs::Base#instantiate
        def instantiate attributes = {}
          @storyboard_url = attributes[:storyboard_url]
          @storyboard = Animoto::Resources::Storyboard.new(:url => @storyboard_url) if @storyboard_url
          super
        end
      end
    end
  end
end