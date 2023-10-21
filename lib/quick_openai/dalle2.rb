# frozen_string_literal: true

module QuickOpenAI
  module Dalle
    def self.dalle2(prompt, **options)
      parameters = {
        prompt: prompt,
        **options
      }

      response = QuickOpenAI.fetch_response_from_client do |client|
        client.images.generate(parameters: parameters)
      end

      results = response.fetch("data")

      tempfiles = results.map do |result|
        url = result["url"]
        Down.download(url)
      end

      (tempfiles.size == 1) ? tempfiles.first : tempfiles
    end

    # Alias the dalle2 method to dalle3
    class << self
      alias_method :dalle3, :dalle2
    end
  end
end
