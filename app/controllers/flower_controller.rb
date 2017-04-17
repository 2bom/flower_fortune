class FlowerController < ApplicationController
    def index
        ## 모든 화투패를 배열에 일단 저장.
        # $result = []
        # 
        # def set(num, title, content)
        #     new = Hash.new
        #     new['num'] = num
        #     new['title'] = title
        #     new['content'] = content
        #     $result.push(new)
        # end
        # 
        # set(1, '송학', '소식')
        # set(2, '매조', '님, 애인')
        # set(3, '벚꽃', '산보, 여행')
        # set(4, '흑싸리', '데이트, 근심')
        # set(5, '난초', '국수, 식사')
        # set(6, '목단', '기쁨')
        # set(7, '홍싸리', '행운, 횡재')
        # set(8, '공산', '달밤, 저녁')
        # set(9, '국화', '술, 술자리')
        # set(10, '단풍', '걱정, 불안')
        # set(11, '오동', '돈, 수입')
        # set(12, '비', '손님, 친구')
        # 
        # puts $result
        
        result = [{"num"=>1, "title"=>"송학", "content"=>"애인, 소식"},
                 {"num"=>2, "title"=>"매조", "content"=>"애인, 이성"},
                 {"num"=>3, "title"=>"벚꽃", "content"=>"산책, 여행"},
                 {"num"=>4, "title"=>"흑싸리", "content"=>"데이트, 근심"},
                 {"num"=>5, "title"=>"난초", "content"=>"국수, 식사"},
                 {"num"=>6, "title"=>"목단", "content"=>"기쁨"},
                 {"num"=>7, "title"=>"홍싸리", "content"=>"행운, 횡재"},
                 {"num"=>8, "title"=>"공산", "content"=>"달밤, 저녁"},
                 {"num"=>9, "title"=>"국화", "content"=>"술, 술자리"},
                 {"num"=>10, "title"=>"단풍", "content"=>"걱정, 불안"},
                 {"num"=>11, "title"=>"오동", "content"=>"돈, 수입"},
                 {"num"=>12, "title"=>"비", "content"=>"손님, 친구"}]
                 
                 
        # ## 화투점 시작 화투패 세팅
        # # cards = []
        # # 4.times do
        # #   12.times do |n|
        # #       cards.push(n+1)
        # #   end
        # # end
        # # print cards.sort!
        
        $cards = [1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 7, 8, 8, 8, 8, 9, 9, 9, 9, 10, 10, 10, 10, 11, 11, 11, 11, 12, 12, 12, 12]
        
    end
end
