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
                 
                 
        def flower_fortune()
                 
            # ## 화투점 시작 화투패 세팅
            # # cards = []
            # # 4.times do
            # #   12.times do |n|
            # #       cards.push(n+1)
            # #   end
            # # end
            # # print cards.sort!
            
            $cards = [1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 7, 8, 8, 8, 8, 9, 9, 9, 9, 10, 10, 10, 10, 11, 11, 11, 11, 12, 12, 12, 12]
            
            
            # card 섞기
            $t = Time.now.day
            $t = $t.to_i
            if $t > 32
                @error_message = 'OPPS, SORRY. WE HAVE SOME ERROR.'
            else
                ($t+1).times do
                    $cards.shuffle!
                end
            end
            
            # 4장씩 깔기
            $in_ground = []
            $in_hand = []
            
            4.times do |n|
                4.times do |m|
                    if m == 0
                      $group = [] 
                    end
                    
                    print $group.push($cards.pop())
                end
                $in_ground.push($group)
                print $in_ground
            end
            
            $in_hand = $cards
            
                        # # 테스트용
                        # $in_ground = [[4,2,2,1], [9,7,11,5], [11,3,7,2], [9,12,3,4]]
                        # $in_hand = [6,5,7,3,12,10,6,8,3,1,6,4,12,4,8,9,12,8,10,6,11,9,1,10,10,5,11,8,1,2,7,5]
                        
            # 카드 맞추기
            $check_index = 0
            $checked_cards = [[],[],[],[]]
            $ground = []
            
            def check_process()
                pick = $in_hand.pop()
                puts pick
                
                4.times do |m|
                    puts 'check if matched'
                    if $in_ground[m].last == pick
                        puts "matched!"
                        
                        $checked_cards[$check_index].push(pick)
                        $checked_cards[$check_index].push($in_ground[m].pop())
                        
                        $check_index = ($check_index+1)%4
                        
                        check_process()
                        break
                    elsif $ground.size != 0 && $ground.first == pick
                        puts "matched! in hand"
                        
                        $checked_cards[$check_index].push(pick)
                        $checked_cards[$check_index].push($ground.shift())
                        
                        $check_index = ($check_index+1)%4
                        
                        check_process()
                        break
                    else
                        if m == 3
                            puts "in_hand.last : " + $in_hand.last.to_s
                            $ground.push(pick)
                        end
                    end
                    
                    
                 end
            end
            
            
            32.times do |n|
                if $in_hand.size != 0
                    puts "n : #{n}"
                    
                    check_process()
                else
                    puts "n : #{n} nil"
                    break
                end
                
            end
            
            $ground.compact!
            
                        # # 테스트용
                        # $checked_cards = [[4,4],[1,1,1,1,11,11],[8,8,8,8,6,6],[10,10]]
            
            $final_pick = []
            
            4.times do |n|
               
               print $checked_cards[n]
               puts ""
               
               $i = 0
               while $i< $checked_cards[n].size do
                   puts $i
                   
                   $j = 0
                   while $j < $checked_cards[n].size do
                       if $checked_cards[n][$i] != $checked_cards[n][$j]
                           if ($j-$i) == 4
                               $final_pick.push($checked_cards[n][$i])
                               $i = $j
                               break
                           end
                       end
                       $j += 1
                   end
                   $i += 1
               end
            
            end
            
            
            print $in_ground
            print $in_hand
            print $ground
            print $checked_cards
            
            print $in_ground.flatten.size + $ground.size + $in_hand.size + $checked_cards.flatten.size
            
            print $final_pick
            
            
            
            if $final_pick.size == 0
                flower_fortune()
            else
                puts "FINAL!!!! : #{$final_pick}"
            end
        end
        
        flower_fortune()
        
    end
end
