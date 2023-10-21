# frozen_string_literal: true

module QuickOpenAI
  module Extensions
    module String
      def gpt4(**)
        QuickOpenAI::Gpt4.gpt4(self, **)
      end

      def gpt3(**)
        QuickOpenAI::Gpt3.gpt3(self, **)
      end

      def dalle2(**)
        QuickOpenAI::Dalle.dalle2(self, **)
      end

      def dalle3(**)
        QuickOpenAI::Dalle.dalle3(self, **)
      end
    end
  end
end
