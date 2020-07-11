def fresh_deck():
    suits = {"Spade", "Heart", "Diamond", "Club"}
    ranks = {"A", 2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K"}
    deck = []
    import random
    for i in suits:
        for j in ranks:
            deck.append({"suit": i, "rank": j})
    random.shuffle(deck)
    return deck


def hit(deck):
    if deck == []:
        deck = fresh_deck()
    return (deck[0], deck[1:])

def count_score(cards):
    score = 0
    number_of_ace = 0
    for card in cards:
        if card["rank"] == "J" or card["rank"] == "Q" or card["rank"] == "K":
            score += 10
        elif card["rank"] == "A":
            score += 11
            number_of_ace += 1
        else:
            score += card["rank"]
    while score > 21 and number_of_ace > 0:
        score -= 10
        number_of_ace -= 1
    return score



def show_cards(cards, message):
    print(message)
    for card in cards:
        print(card['suit'], card['rank'])


def more(message):
    answer = input(message)
    while answer not in {"y", "n"}:
        answer = input(message)
    return answer == "y"


print("Welcome to SMaSH Casino")
def blackjack(chips):
    deck = fresh_deck()
    dealer = []
    player = []
    card, deck = hit(deck)  # 1장 뽑아서
    player.append(card)  # 손님에게 주고
    card, deck = hit(deck)  # 1장 뽑아서
    dealer.append(card)  # 딜러에게 주고
    card, deck = hit(deck)  # 1장 뽑아서
    player.append(card)  # 손님에게 주고
    card, deck = hit(deck)  # 1장 뽑아서
    dealer.append(card)# 딜러에게 준다.
    print("My cards are:")
    print(" ", "****", "**")
    print(" ", dealer[1]["suit"], dealer[1]["rank"])
    show_cards(player, "Your cards are:")
    score_player = count_score(player)
    score_dealer = count_score(dealer)
    if score_player == 21:
        print("Blackjack! You Won")
        chips += 2
        print("Chips =",chips)
        hi = input("Play more? y/n")
        while hi not in {"y", "n"}:
            hi = input("Play more? y/n")
        if hi == 'y':
            blackjack(chips)
    else:
        hi = input("Hit? y/n")
        while hi not in {"y", "n"}:
            hi = input("Hit? y/n")
        while hi != 'n' and score_player <= 21:
            card, deck = hit(deck)  # 1장 뽑아서
            player.append(card)  # 손님에게 주고
            score_player = count_score(player)
            print(player[len(player)-1]['suit'],player[len(player)-1]['rank'])
            if score_player > 21:
                print("You bust I won")
                chips -= 1
                print("Chips =", chips)
                hi = input("Play more? y/n")
                while hi not in {"y", "n"}:
                    hi = input("Play more? y/n")
                if hi == 'y':
                    print("-----")
                    blackjack(chips)
                else:
                    print("Bye!")
                    exit(0)
            hi = input("Hit? y/n")
            while hi not in {"y", "n"}:
                hi = input("Hit? y/n")
        while score_dealer <= 16:
            card, deck = hit(deck)
            dealer.append(card)
            score_dealer = count_score(dealer)
        if score_dealer > 21:
            show_cards(dealer,"My cards are")
            print("I bust, You Won!")
            chips += 1
            print("Chips =",chips)
            hi = input("Play more? y/n")
            while hi not in {"y", "n"}:
                hi = input("Play more? y/n")
            if hi == 'y':
                print("-----")
                blackjack(chips)
            else:
                print("Bye!")
                exit(0)
        if score_dealer == score_player:
            show_cards(dealer,"My cards are")
            print("We draw")
            print("Chips =", chips)
            hi = input("Play more? y/n")
            while hi not in {"y", "n"}:
                hi = input("Play more? y/n")
            if hi == 'y':
                blackjack(chips)
            else:
                print("Bye!")
                exit(0)
        elif score_dealer < score_player:
            show_cards(dealer, "My cards are")
            print("You Won!")
            chips += 1
            print("Chips =", chips)
            hi = input("Play more? y/n")
            while hi not in {"y", "n"}:
                hi = input("Play more? y/n")
            if hi == 'y':
                print("-----")
                blackjack(chips)
            else:
                print("Bye!")
                exit(0)
        else:
            show_cards(dealer, "My cards are")
            print("I won!")
            chips -= 1
            print("Chips =", chips)
            hi = input("Play more? y/n")
            while hi not in {"y", "n"}:
                hi = input("Play more? y/n")
            if hi == 'y':
                blackjack(chips)
            else:
                print("Bye!")
                exit(0)
blackjack(0)
