namespace :matching do
  desc 'Generate matches and update matched_with column'
  task :generate_matches => :environment do
    users = User.all

    if users.count < 2
      puts "You need at least 2 users to generate matches."
      return
    end

    losers = users.to_a
    result = []

    picked = true
    while picked
      picked = false
      available = losers.dup

      losers.each do |giver|
        receiver = available.sample

        if receiver == giver
          picked = true
          break
        else
          while receiver == giver
            receiver = available.sample
          end
          
          available.delete(receiver)

          # Update the matched_with column in the database
          giver.update(matched_with: receiver.name)
        end
      end
    end

    result.each { |r| puts r }
  end
end
