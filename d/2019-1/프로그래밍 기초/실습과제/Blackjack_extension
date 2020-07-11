import cardgame
def blackjack():
    print("Welcome to SMaSH Casino!")
    username, tries, wins, chips, members = login(load_members())
    tries2,wins2 = 1,0
    start = True
    deck = cardgame.fresh_deck()
    while start:
        finish = False
        print('-----')
        dealer, player = [], []
        card, deck = cardgame.hit(deck)
        player.append(card)
        card, deck = cardgame.hit(deck)
        dealer.append(card)
        card, deck = cardgame.hit(deck)
        player.append(card)
        card, deck = cardgame.hit(deck)
        dealer.append(card)
        print("My cards are:")
        print(" ", "****", "**")
        print(" ", dealer[1]["suit"], dealer[1]["rank"])
        cardgame.show_cards(player, "Your cards are: ")
        score_player = cardgame.count_score(player)
        score_dealer = cardgame.count_score(dealer)
        while not finish:
            if score_player == 21:
                wins2 += 1
                chips += 2
                finish = True
                print('Blackjack! You won.')
            elif score_player > 21:
                chips -= 1
                finish = True
                print('You bust! I won.')
            else:
                if score_player < 21:
                    if cardgame.more('Hit? (y/n) '):
                        card, deck = cardgame.hit(deck)
                        print(' ', card['suit'], card['rank'])
                        player.append(card)
                        score_player = cardgame.count_score(player)
                    else:
                        finish = True
                        if score_player > 21:
                            chips -= 1
                            print('You bust! I won.')
                        else:
                            while score_dealer <= 16:
                                card, deck = cardgame.hit(deck)
                                dealer.append(card)
                                score_dealer = cardgame.count_score(dealer)
                            cardgame.show_cards(dealer, 'My cards are:')
                            if score_dealer > 21:
                                wins2 += 1
                                chips += 1
                                print('I bust! You won.')
                            else:
                                if score_player == score_dealer:
                                    wins2 += 0.5
                                    print('We draw.')
                                else:
                                    if score_player > score_dealer:
                                        wins2 += 1
                                        chips += 1
                                        print('You won.')
                                    else:
                                        chips -= 1
                                        print('I won.')
        print('Chips =',chips)
        tries2 += 1
        start = cardgame.more('Play More? (y/n) ')
    print('-----')
    print('You played ' + str(tries2) + ' games and won ' + str(wins2) + ' of them')
    winRate2 = "{0:.1f}".format(wins2 / tries2 * 100)
    print('Your winning percentage today is ' + str(winRate2) + ' %.')
    tries += tries2
    wins += wins2
    passwd = members[username][0]
    members[username] = (passwd,tries,wins,chips)
    store_members(members)
    show_top5(members)
    print('Bye!')
    exit()

def login(members):
    username = input("Enter your name: (4 letters max) ")
    while len(username) > 4:
        username = input("Enter your name: (4 letters max) ")
    trypasswd = input("Enter your password: ")
    if username in members:  #<members의 키 중에서 username이 있다>
        if trypasswd == members[username][0]: #<trypasswd가 username의 비밀번호와 일치한다>
            tries,wins,chips = members[username][1:]
            # username의 게임시도 횟수와 이긴 횟수를 members에서 가져와 보여준다.
            # 예시: You played 101 games and won 54 of them.
            print("You played "+str(tries)+" games and won "+str(wins)+" of them.")
            # 승률 계산하여 %로 보여줌 (분모가 0인 오류 방지해야 함)
            # 예시: Your all-time winning percentage is 53.5 %
            if tries <= 0:
                winRate = 0
            else:
                winRate = "{0:.1f}".format(wins/tries*100)
            print("Your all-time winning percentage is "+str(winRate)+" %")
            # 칩 보유개수를 보여줌
            # 예시 : 개수가 양수이면 You have 5 chips.
            # 예시 : 개수가 음수이면 You owe 5 chips.
            if chips >= 0:
                print("You have "+str(chips)+" chips.")
            else:
                print("You owe "+str(abs(chips))+" chips.")
            return username, tries, wins, chips, members
        else:
            return login(members)
    else:
        # username을 members 사전에 추가한다.
        members[username] = (trypasswd,0,0,0)
        return username, 0, 0, 0, members
def load_members():
    file = open("members.txt","r")
    members = {}
    for line in file:
        name, passwd, tries, wins, chips = line.strip('\n').split(',')
        members[name] = (passwd,int(tries),float(wins),int(chips))
    file.close()
    return members
def store_members(members):
    file = open("members.txt","w")
    names = members.keys()
    for name in names:
        passwd, tries, wins, chips = members[name]
        line = name + ',' + passwd + ',' + str(tries) + ',' + str(wins) + "," + str(chips) + '\n'
        file.write(line)
    file.close()
def show_top5(members):
    print("-----")
    # 칩의 개수 역순으로 정렬
    arr = []
    for name in members:
        arr.append(members[name][3])
    arr = list(reversed(sorted(arr)))
    sorted_members = {}
    for i in range(len(arr)):
        for name in members:
            if members[name][3] == arr[i]:
                sorted_members[name] = arr[i]
    print("All-time Top 5 based on the number of chips earned")
    # sorted_members[:5]의 원소를 차례대로 참고하여 보여주되 0이하는 무시한다.
    rank = 1
    for name in sorted_members:
        if sorted_members[name] <= 0:
            break
        print(str(rank)+". "+name+" : "+str(sorted_members[name]))
        rank += 1
blackjack()
