module Lita
  module Handlers
    class Ovation < Handler
      route(/^ovation(\s*|\s+(\S+))$/, :ovation, help: {
        'ovation' => '\o\ /o/',
        'ovation Amora' => '\o\ Amora /o/'
      })

      def ovation(r)
        r.reply format_ovation(r.matches[0][0])
      end

      private

      def format_ovation(match)
        if match.length == 0
          '\o\ \o/ \o/ \o\ /o/'
        else
          str = '\o\ /o/ \o/ '
          str+= match.gsub(/\s/, '')
          str+= ' \o/ \o\ /o/'
          str
        end
      end
    end

    Lita.register_handler(Ovation)
  end
end
