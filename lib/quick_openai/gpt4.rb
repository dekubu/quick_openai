# frozen_string_literal: true

module QuickOpenAI
  module Gpt4
    def self.gpt4(prompt, **options)
      parameters = {
        model: "gpt-4",
        max_tokens: 8092,
        messages: [
          {
            role: "system",
            content: "You are a helpful assistant."
          },
          {
            role: "user",
            content: prompt
          }
        ],
        **options
      }

      response = QuickOpenAI.fetch_response_from_client do |client|
        client.chat(parameters: parameters) # Updated to use chat_completions
      end

      text = response.dig("choices", 0, "message", "content")
      raise QuickOpenAI::Error, "Unable to parse response." if text.nil? || text.empty?

      text.chomp.strip
    end
  end
end
