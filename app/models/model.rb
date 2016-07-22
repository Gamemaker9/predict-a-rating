class Ranking
    
attr_accessor :user_rating, :games_won, :games_lost, :opponent_score

    def initialize(user_rating, games_won, games_lost, opponent_score)
        @user_rating = user_rating.to_f
        @games_won = games_won.to_f
        @games_lost = games_lost.to_f
        @opponent_score = opponent_score
    end
   
    def calculate 
        new_sum = []
        @opponent_score.gsub(","," ").split.each do |i|
            new_sum << i.to_f 
        end
        updated_sum = []
        new_sum.each do |i|
            updated_sum << i - @user_rating
        end
        sum = 0
        updated_sum.each do |i|
            sum += i
        end
        score = (@user_rating + (16*((@games_won - @games_lost)+((sum.to_f)/400)))).round
        return score
    end

end    

# test = Ranking.new(1000,4,1,"1111, 1234, 1235, 2344")
# puts test.calculate