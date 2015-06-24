response = HTTParty.get ("https://ismaelc-pinterest.p.mashape.com/wynnjenks/boards",
  headers:{
    "X-Mashape-Key" => "1Nh8Dmk92ImshSPviOWoRZwNxpukp1YUHA0jsnd8thcqBXt0e6",
    "Accept" => "application/json"
  })

  boards = response["body"].map{|body| body["href"]}

  boards.map do
    {|board| board.gsub!{"\/wynnjenks\/",""}}
  end
