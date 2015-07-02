module Lita
  module Handlers
    class DevopsReactions < Handler
      route(/^(devops reaction).*/i, :devops_reaction)
    
      def devops_reaction(response)
        reply_to_name = response.user.metadata['mention_name'].nil? ?
                         "#{response.user.name}" :
                        "#{response.user.metadata['mention_name']}"
        post = random_post

        response.reply "#{post[:title]} #{post[:image]}"
      end

      private

      def random_post
        resp = Curl.get('http://devopsreactions.tumblr.com/random') do |curl|
          curl.follow_location = true
        end
        doc = Nokogiri::HTML(resp.body_str)

        img = doc.at("div[class=item_content]//img")['src']
        title = doc.at("div[class=item_content]//a").text

        {image: img, title: title} 
      end

    end

    Lita.register_handler(DevopsReactions)
  end
end
