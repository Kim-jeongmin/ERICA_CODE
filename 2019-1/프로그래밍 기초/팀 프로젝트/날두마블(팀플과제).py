print("Welcome to Naldo Marble!")
k=int(input('칩의 개수를 정해주세요.(5/10/15)'))
while k not in {5,10,15}:
    print('다시 입력해주세요')
    k=int(input('칩의 개수를 정해주세요.(5/10/15)'))
print('당신과 com에게 각각', k,'개의 칩이 주어집니다!')
board=[["  .","   ","      .","   ","     .","      ","   ."],
    ["호날두 ","---","손흥민 ","---","베일 ","---","네이마르"],
           ['  |','                                 ','|'],
           ['  |','                                 ','|'],
           ["  .",'                                 ',".  "],
           ["즐라탄","                         ","레반도프스키"],
           ['  |','                                 ','|'],
           ['  |','            KIMNALDO             ','|'],
           ['  |','                                 ','|'],
           ["  .",'                                 ',".  "],
           ["포그바","                           ","아구에로"],
           ['  |','                                 ','|'],
           ['  |','                                 ','|'],
           ["  .","  ","      .","    ","    .","    ","       ."],
           ["리베리","----","메시","----","음바페","----","수아레즈"]]
def show_board(board):
    for row in board:
        s = ''
        for col in row:
            s+=str(col)
            s+= ' '
        print(s)
        
import random
def dice():
    d=[1,2,3,4,5,6]
    D=random.choice(d)
    return D

s=[board[1][0],board[1][2],board[1][4],board[1][6],board[5][2],board[10][2],board[14][6],board[14][4],board[14][2],board[14][0],board[10][0],board[5][0]]
def move(n):
    sum=0
    sum+=n
    if sum>12:
        sum-=12



chip_me = chip_com = k
def Cpu_Remove(f):
    if f==0:
            k=''
            for i in board[0][0]:
                if i != 'C':
                    k+=i
            board[0][0]=k
    if f==1:
        k=''
        for i in board[0][2]:
            if i != 'C':
                k+=i
        board[0][2]=k
    if f==2:
        k=''
        for i in board[0][4]:
            if i != 'C':
                k+=i
        board[0][4]=k
    if f==3:
        k=''
        for i in board[0][6]:
            if i != 'C':
                k+=i
        board[0][6]=k
    if f==4:
        k=''
        for i in board[4][2]:
            k=''
            if i != 'C':
                k+=i
        board[4][2]=k
    if f==5:
        k=''
        for i in board[9][2]:
            if i != 'C':
                k+=i
        board[9][2]=k
    if f==6:
        k=''
        for i in board[13][6]:
            if i != 'C':
                k+=i
        board[13][6]=k
    if f==7:
        k=''
        for i in board[13][4]:
            if i != 'C':
                k+=i
        board[13][4]=k
    if f==8:
        k=''
        for i in board[13][2]:
            if i != 'C':
                k+=i
        board[13][2]=k
    if f==9:
        k=''
        for i in board[13][0]:
            if i != 'C':
                k+=i
        board[13][0]=k
    if f==10:
        k=''
        for i in board[9][0]:
            if i != 'C':
                k+=i
        board[9][0]=k
    if f==11:
        k=''
        for i in board[4][0]:
            if i != 'C':
                k+=i
        board[4][0]=k
def Player_Remove(e):
    if e==0:
        k=''
        for i in board[0][0]:
            if i != 'M':
                k+=i
        board[0][0]=k
    if e==1:
        k=''
        for i in board[0][2]:
            if i != 'M':
                k+=i
        board[0][2]=k
    if e==2:
        k=''
        for i in board[0][4]:
            if i !='M':
                k+=i
        board[0][4]=k
    if e==3:
        k=''
        for i in board[0][6]:
            if i !='M':
                k+=i
        board[0][6]=k
    if e==4:
        k=''
        for i in board[4][2]:
            if i != 'M':
                k+=i
        board[4][2]=k
    if e==5:
        k=''
        for i in board[9][2]:
            if i!='M':
                k+=i
        board[9][2]=k
    if e==6:
        k=''
        for i in board[13][6]:
            if i!='M':
                k+=i
        board[13][6]=k
    if e==7:
        k=''
        for i in board[13][4]:
            if i!='M':
                k+=i
        board[13][4]=k
    if e==8:
        k=''
        for i in board[13][2]:
            if i!='M':
                k+=i
        board[13][2]=k
    if e==9:
        k=''
        for i in board[13][0]:
            if i!='M':
                k+=i
        board[13][0]=k
    if e==10:
        k=''
        for i in board[9][0]:
            if i!='M':
                k+=i
        board[9][0]=k
    if e==11:
        k=''
        for i in board[4][0]:
            if i!='M':
                k+=i
        board[4][0]=k
                    
def Player_Prchs(sum1,sum2,e,f):
    global chip_me
    purchase=input(s[sum1]+"선수를 영입하시겠습니까?(yes/no): ")
    while purchase not in {'yes','no'}:
        print('다시 입력해주세요')
        purchase=input(s[sum1]+"선수를 영입하시겠습니까?(yes/no): ")
    if purchase=='yes':
        chip_me -= 1
        if sum1==0:
            board[1][0]=board[1][0]+"$"
            if board[1][0][-2:]=='$$':
                board[1][0]=board[1][0][:-1]
                chip_me+=1
                pass
                print("이미 영입한 선수입니다.")
        if sum1==1:
            board[1][2]=board[1][2]+"$"
            if board[1][2][-2:]=='$$':
                board[1][2]=board[1][2][:-1]
                chip_me+=1
                pass
                print("이미 영입한 선수입니다.")
        if sum1==2:
            board[1][4]=board[1][4]+"$"
            if board[1][4][-2:]=='$$':
                board[1][4]=board[1][4][:-1]
                chip_me+=1
                pass
                print("이미 영입한 선수입니다.")
        if sum1==3:
            board[1][6]=board[1][6]+"$"
            if board[1][6][-2:]=='$$':
                board[1][6]=board[1][6][:-1]
                chip_me+=1
                pass
                print("이미 영입한 선수입니다.")
        if sum1==4:
            board[5][2]=board[5][2]+"$"
            if board[5][2][-2:]=='$$':
                board[5][2]=board[5][2][:-1]
                chip_me+=1
                pass
                print("이미 영입한 선수입니다.")
        if sum1==5:
            board[10][2]=board[10][2]+"$"
            if board[10][2][-2:]=='$$':
                board[10][2]=board[10][2][:-1]
                chip_me+=1
                pass
                print("이미 영입한 선수입니다.")
        if sum1==6:
            board[14][6]=board[14][6]+"$"
            if board[14][6][-2:]=='$$':
                board[14][4]=board[14][4][:-1]
                chip_me+=1
                pass
                print("이미 영입한 선수입니다.")
        if sum1==7:
            board[14][4]=board[14][4]+"$"
            if  board[14][4][-2:]=='$$':
                board[14][4]=board[14][4][:-1]
                chip_me+=1
                pass
                print("이미 영입한 선수입니다.")
        if sum1==8:
            board[14][2]=board[14][2]+"$"
            if board[14][2][-2:]=='$$':
                board[14][2]=board[14][2][:-1]
                chip_me+=1
                pass
                print("이미 영입한 선수입니다.")
        if sum1==9:
            board[14][0]=board[14][0]+"$"
            if board[14][0][-2:]=='$$':
                board[14][0]=board[14][0][:-1]
                chip_me+=1
                pass
                print("이미 영입한 선수입니다.")
        if sum1==10:
            board[10][0]=board[10][0]+"$"
            if board[10][0][-2:]=='$$':
                board[10][0]=board[10][0][:-1]
                chip_me+=1
                pass
                print("이미 영입한 선수입니다.")
        if sum1==11:
            board[5][0]=board[5][0]+"$"
            if board[5][0][-2:]=='$$':
                board[5][0]=board[5][0][:-1]
                chip_me+=1
                pass
                print("이미 영입한 선수입니다.")
        Player_Remove(e)
        show_board(board)
        print('당신의 칩이 '+str(chip_me)+'개 남았습니다!')
    elif purchase=='no':
        Player_Remove(e)
    if chip_me!=0:
        next=input("enter키를 누르세요!")
        while next not in {''}:
            print('다시 입력해주세요.')
            next=input('enter키를 누르세요!')
        go2(sum1,sum2,e,f)
    elif chip_me==0:
        print('플레이어가 졌습니다.')
def Cpu_Prchs(sum1,sum2,e,f):
    global chip_com
    z=('yes','no')
    purchase=random.choice(z)
    if purchase=='yes':
        chip_com -= 1
        print(str('com이 ')+str(s[sum2])+str(' 선수를 영입하였습니다!'))
        if sum2==0:
            board[1][0]=board[1][0]+"\\\\"
            if board[1][0][-2:]=='\\':
                board[1][0]=board[1][0][:-1]
                chip_com+=1
                pass
                print("이미 영입한 선수입니다.")
        if sum2==1:
            board[1][2]=board[1][2]+"\\"
            if  board[1][2][-2:]=='\\\\':
                board[1][2]=board[1][2][:-1]
                chip_com+=1
                pass
                print("이미 영입한 선수입니다.")
        if sum2==2:
            board[1][4]=board[1][4]+"\\"
            if board[1][4][-2:]=='\\\\':
                board[1][4]=board[1][4][:-1]
                chip_com+=1
                pass
                print("이미 영입한 선수입니다.")
        if sum2==3:
            board[1][6]=board[1][6]+"\\"
            if board[1][6][-2:]=='\\\\':
                board[1][6]=board[1][6][:-1]
                chip_com+=1
                pass
                print("이미 영입한 선수입니다.")
        if sum2==4:
            board[5][2]=board[5][2]+"\\"
            if board[5][2][-2:]=='\\\\':
                board[5][2]=board[5][2][:-1]
                chip_com+=1
                pass
                print("이미 영입한 선수입니다.")
        if sum2==5:
            board[10][2]=board[10][2]+"\\"
            if board[10][2][-2:]=='\\\\':
                board[10][2]=board[10][2][:-1]
                chip_com+=1
                pass
                print("이미 영입한 선수입니다.")
        if sum2==6:
            board[14][6]=board[14][6]+"\\"
            if board[14][6][-2:]=='\\\\':
                board[14][6]=board[14][6][:-1]
                chip_com+=1
                pass
                print("이미 영입한 선수입니다.")
        if sum2==7:
            board[14][4]=board[14][4]+"\\"
            if board[14][4][-2:]=='\\\\':
                board[14][4]=board[14][4][:-1]
                chip_com+=1
                pass
                print("이미 영입한 선수입니다.")
        if sum2==8:
            board[14][2]=board[14][2]+"\\"
            if board[14][2][-2:]=='\\\\':
                board[14][2]=board[14][2][:-1]
                chip_com+=1
                pass
                print("이미 영입한 선수입니다.")
        if sum2==9:
            board[14][0]=board[14][0]+"\\"
            if board[14][0][-2:]=='\\\\':
                board[14][0]=board[14][0][:-1]
                chip_com+=1
                pass
                print("이미 영입한 선수입니다.")
        if sum2==10:
            board[10][0]=board[10][0]+"\\\\"
            if board[10][0][-1]=='\\':
                board[10][0]=board[10][0][:-1]
                chip_com+=1
                pass
                print("이미 영입한 선수입니다.")
        if sum2==11:
            board[5][0]=board[5][0]+"\\\\"
            if  board[5][0][-1]=='\\':
                board[5][0]=board[5][0][:-1]
                chip_com+=1
                pass
                print("이미 영입한 선수입니다.")
        Cpu_Remove(f)
        
        show_board(board)
        print('com의 칩이'+str(chip_com)+'개 남았습니다!')
    elif purchase=='no':
        Cpu_Remove(f)
         
        print(str('com이 ')+str(s[sum2])+str(' 선수를 영입하지 않았습니다!'))
    if chip_com!=0:
        next=input("enter키를 누르세요!")
        while next not in {''}:
            print('다시 입력해주세요')
            next=input('enter키를 누르세요!')
        go1(sum1,sum2,e,f)
    elif chip_com==0:
        print('com이 졌습니다.')
def go1(sum1,sum2,e,f):
    global chip_me
    global chip_com
    e=sum1
    show_board(board)
    roll=input('주사위를 던지세요!(enter키를 누르세요)')
    if roll=='':
        n=dice()
        print(str('주사위가 ')+str(n)+str('이 나왔습니다!'))
        move(n)
        sum1+=n
        if sum1>=12:
            sum1-=12
            print('당신의 말 위치: '+s[sum1])
    if sum1==0:
        board[0][0]+='M'
        if board[1][0][-1]=='\\':
            print('상대방의 선수를 임대합니다.(플레이어의 칩이 com에게 넘어갑니다)')
            chip_me-=1
            chip_com+=1
            print('플레이어의 칩 개수: ',chip_me)
            print('com의 칩 개수: ',chip_com)
            if chip_me!=0:
                Player_Remove(e)
                next=input("enter키를 누르세요!")
                if next=='':
                    go2(sum1,sum2,e,f)
            elif chip_me==0:
                print('플레이어가 졌습니다.')
        else:
            Player_Prchs(sum1,sum2,e,f)
    if sum1==1:
        board[0][2]+='M'
        if board[1][2][-1]=='\\':
            print('상대방의 선수를 임대합니다.(플레이어의 칩이 com에게 넘어갑니다)')
            chip_me-=1
            chip_com+=1
            print('플레이어의 칩 개수: ',chip_me)
            print('com의 칩 개수: ',chip_com)
            if chip_me!=0:
                Player_Remove(e)
                next=input("enter키를 누르세요!")
                if next=='':
                    go2(sum1,sum2,e,f)
            elif chip_me==0:
                print('플레이어가 졌습니다.')
        else:
            Player_Prchs(sum1,sum2,e,f)
    if sum1==2:
        board[0][4]+='M'
        if board[1][4][-1]=='\\': 
            print('상대방의 선수를 임대합니다.(플레이어의 칩이 com에게 넘어갑니다)')
            chip_me-=1
            chip_com+=1
            print('플레이어의 칩 개수: ',chip_me)
            print('com의 칩 개수: ',chip_com)
            if chip_me!=0:
                Player_Remove(e)
                next=input("enter키를 누르세요!")
                if next=='':
                    go2(sum1,sum2,e,f)
            elif chip_me==0:
                print('플레이어가 졌습니다.')
        else:
            Player_Prchs(sum1,sum2,e,f)
    if sum1==3:
        board[0][6]+='M'
        if board[1][6][-1]=='\\':
            print('상대방의 선수를 임대합니다.(플레이어의 칩이 com에게 넘어갑니다)')
            chip_me-=1
            chip_com+=1
            print('플레이어의 칩 개수: ',chip_me)
            print('com의 칩 개수: ',chip_com)
            if chip_me!=0:
                Player_Remove(e)
                next=input("enter키를 누르세요!")
                if next=='':
                    go2(sum1,sum2,e,f)
            elif chip_me==0:
                print('플레이어가 졌습니다.')
        else:
            Player_Prchs(sum1,sum2,e,f)
    if sum1==4:
        board[4][2]+='M'
        if board[5][2][-1]=='\\':
            print('상대방의 선수를 임대합니다.(플레이어의 칩이 com에게 넘어갑니다)')
            chip_me-=1
            chip_com+=1
            print('플레이어의 칩 개수: ',chip_me)
            print('com의 칩 개수: ',chip_com)
            if chip_me!=0:
                Player_Remove(e)
                next=input("enter키를 누르세요!")
                if next=='':
                    go2(sum1,sum2,e,f)
            elif chip_me==0:
                print('플레이어가 졌습니다.')
        else:
            Player_Prchs(sum1,sum2,e,f)
    if sum1==5:
        board[9][2]+='M'
        if board[10][2][-1]=='\\':
            print('상대방의 선수를 임대합니다.(플레이어의 칩이 com에게 넘어갑니다)')
            chip_me-=1
            chip_com+=1
            print('플레이어의 칩 개수: ',chip_me)
            print('com의 칩 개수: ',chip_com)
            if chip_me!=0:
                Player_Remove(e)
                next=input("enter키를 누르세요!")
                if next=='':
                    go2(sum1,sum2,e,f)
            elif chip_me==0:
                print('플레이어가 졌습니다.')
        else:
            Player_Prchs(sum1,sum2,e,f)
    if sum1==6:
        board[13][6]+='M'
        if board[14][6][-1]=='\\':
            print('상대방의 선수를 임대합니다.(플레이어의 칩이 com에게 넘어갑니다)')
            chip_me-=1
            chip_com+=1
            print('플레이어의 칩 개수: ',chip_me)
            print('com의 칩 개수: ',chip_com)
            if chip_me!=0:
                Player_Remove(e)
                next=input("enter키를 누르세요!")
                if next=='':
                    go2(sum1,sum2,e,f)
            elif chip_me==0:
                print('플레이어가 졌습니다.')
        else:
            Player_Prchs(sum1,sum2,e,f)
    if sum1==7:
        board[13][4]+='M'
        if board[14][4][-1]=='\\':
            print('상대방의 선수를 임대합니다.(플레이어의 칩이 com에게 넘어갑니다)')
            chip_me-=1
            chip_com+=1
            print('플레이어의 칩 개수: ',chip_me)
            print('com의 칩 개수: ',chip_com)
            if chip_me!=0:
                Player_Remove(e)
                next=input("enter키를 누르세요!")
                if next=='':
                    go2(sum1,sum2,e,f)
            elif chip_me==0:
                print('플레이어가 졌습니다.')
        else:
            Player_Prchs(sum1,sum2,e,f)
    if sum1==8:
        board[13][2]+='M'
        if board[14][2][-1]=='\\':
            print('상대방의 선수를 임대합니다.(플레이어의 칩이 com에게 넘어갑니다)')
            chip_me-=1
            chip_com+=1
            print('플레이어의 칩 개수: ',chip_me)
            print('com의 칩 개수: ',chip_com)
            if chip_me!=0:
                Player_Remove(e)
                next=input("enter키를 누르세요!")
                if next=='':
                    go2(sum1,sum2,e,f)
            elif chip_me==0:
                print('플레이어가 졌습니다.')
        else:
            Player_Prchs(sum1,sum2,e,f)
    if sum1==9:
        board[13][0]+='M'
        if board[14][0][-1]=='\\':
            print('상대방의 선수를 임대합니다.(플레이어의 칩이 com에게 넘어갑니다)')
            chip_me-=1
            chip_com+=1
            print('플레이어의 칩 개수: ',chip_me)
            print('com의 칩 개수: ',chip_com)
            if chip_me!=0:
                Player_Remove(e)
                next=input("enter키를 누르세요!")
                if next=='':
                    go2(sum1,sum2,e,f)
            elif chip_me==0:
                print('플레이어가 졌습니다.')
        else:
            Player_Prchs(sum1,sum2,e,f)
    if sum1==10:
        board[9][0]+='M'
        if board[10][0][-1]=='\\':
            print('상대방의 선수를 임대합니다.(플레이어의 칩이 com에게 넘어갑니다)')
            chip_me-=1
            chip_com+=1
            print('플레이어의 칩 개수: ',chip_me)
            print('com의 칩 개수: ',chip_com)
            if chip_me!=0:
                Player_Remove(e)
                next=input("enter키를 누르세요!")
                if next=='':
                    go2(sum1,sum2,e,f)
            elif chip_me==0:
                print('플레이어가 졌습니다.')
        else:
            Player_Prchs(sum1,sum2,e,f)
    if sum1==11:
        board[4][0]+='M'
        if board[5][0][-1]=='\\':
            print('상대방의 선수를 임대합니다.(플레이어의 칩이 com에게 넘어갑니다)')
            chip_me-=1
            chip_com+=1
            print('플레이어의 칩 개수: ',chip_me)
            print('com의 칩 개수: ',chip_com)
            if chip_me!=0:
                Player_Remove(e)
                next=input("enter키를 누르세요!")
                if next=='':
                    go2(sum1,sum2,e,f)
            elif chip_me==0:
                print('플레이어가 졌습니다.')
        else:
            Player_Prchs(sum1,sum2,e,f)

def go2(sum1,sum2,e,f):
    global chip_com
    global chip_me
    f=sum2
    show_board(board)
    n=dice()
    print(str('주사위가 ')+str(n)+str('이 나왔습니다!'))
    move(n)
    sum2+=n
    if sum2>=12:
        sum2-=12
    print('com의 말  위치: '+s[sum2])
    if sum2==0:
        board[0][0]+='C'
        if board[1][0][-1]=='$':
            print('상대방의 선수를 임대합니다.(com의 칩이 플레이어에게 넘어갑니다)')
            chip_com-=1
            chip_me+=1
            print('com의 칩 개수: ',chip_com)
            print('플레이어의 칩 개수: ',chip_me)
            if chip_com!=0:
                Cpu_Remove(f)
                next=input("enter키를 누르세요!")
                if next=='':
                    go1(sum1,sum2,e,f)
            elif chip_com==0:
                print('com이 졌습니다.')
        else:
            Cpu_Prchs(sum1,sum2,e,f)
    if sum2==1:
        board[0][2]+='C'
        if board[1][2][-1]=='$':
            print('상대방의 선수를 임대합니다.(com의 칩이 플레이어에게 넘어갑니다)')
            chip_com-=1
            chip_me+=1
            print('com의 칩 개수: ',chip_com)
            print('플레이어의 칩 개수: ',chip_me)
            if chip_com!=0:
                Cpu_Remove(f)
                next=input("enter키를 누르세요!")
                if next=='':
                    go1(sum1,sum2,e,f)
            elif chip_com==0:
                print('com이 졌습니다.')
        else:
            Cpu_Prchs(sum1,sum2,e,f)
    if sum2==2:
        board[0][4]+='C'
        if board[1][4][-1]=='$':
            print('상대방의 선수를 임대합니다.(com의 칩이 플레이어에게 넘어갑니다)')
            chip_com-=1
            chip_me+=1
            print('com의 칩 개수: ',chip_com)
            print('플레이어의 칩 개수: ',chip_me)
            if chip_com!=0:
                Cpu_Remove(f)
                next=input("enter키를 누르세요!")
                if next=='':
                    go1(sum1,sum2,e,f)
            elif chip_com==0:
                print('com이 졌습니다.')
        else:
            Cpu_Prchs(sum1,sum2,e,f)
    if sum2==3:
        board[0][6]+='C'
        if board[1][6][-1]=='$':
            print('상대방의 선수를 임대합니다.(com의 칩이 플레이어에게 넘어갑니다)')
            chip_com-=1
            chip_me+=1
            print('com의 칩 개수: ',chip_com)
            print('플레이어의 칩 개수: ',chip_me)
            if chip_com!=0:
                Cpu_Remove(f)
                next=input("enter키를 누르세요!")
                if next=='':
                    go1(sum1,sum2,e,f)
            elif chip_com==0:
                print('com이 졌습니다.')
        else:
            Cpu_Prchs(sum1,sum2,e,f)
    if sum2==4:
        board[4][2]+='C'
        if board[5][2][-1]=='$':
            print('상대방의 선수를 임대합니다.(com의 칩이 플레이어에게 넘어갑니다)')
            chip_com-=1
            chip_me+=1
            print('com의 칩 개수: ',chip_com)
            print('플레이어의 칩 개수: ',chip_me)
            if chip_com!=0:
                Cpu_Remove(f)
                next=input("enter키를 누르세요!")
                if next=='':
                    go1(sum1,sum2,e,f)
            elif chip_com==0:
                print('com이 졌습니다.')
        else:
            Cpu_Prchs(sum1,sum2,e,f)
    if sum2==5:
        board[9][2]+='C'
        if board[10][2][-1]=='$':
            print('상대방의 선수를 임대합니다.(com의 칩이 플레이어에게 넘어갑니다)')
            chip_com-=1
            chip_me+=1
            print('com의 칩 개수: ',chip_com)
            print('플레이어의 칩 개수: ',chip_me)
            if chip_com!=0:
                Cpu_Remove(f)
                next=input("enter키를 누르세요!")
                if next=='':
                    go1(sum1,sum2,e,f)
            elif chip_com==0:
                print('com이 졌습니다.')
        else:
            Cpu_Prchs(sum1,sum2,e,f)
    if sum2==6:
        board[13][6]+='C'
        if board[14][6][-1]=='$':
            print('상대방의 선수를 임대합니다.(com의 칩이 플레이어에게 넘어갑니다)')
            chip_com-=1
            chip_me+=1
            print('com의 칩 개수: ',chip_com)
            print('플레이어의 칩 개수: ',chip_me)
            if chip_com!=0:
                Cpu_Remove(f)
                next=input("enter키를 누르세요!")
                if next=='':
                    go1(sum1,sum2,e,f)
            elif chip_com==0:
                print('com이 졌습니다.')
        else:
            Cpu_Prchs(sum1,sum2,e,f)
    if sum2==7:
        board[13][4]+='C'
        if board[14][4][-1]=='$':
            print('상대방의 선수를 임대합니다.(com의 칩이 플레이어에게 넘어갑니다)')
            chip_com-=1
            chip_me+=1
            print('com의 칩 개수: ',chip_com)
            print('플레이어의 칩 개수: ',chip_me)
            if chip_com!=0:
                Cpu_Remove(f)
                next=input("enter키를 누르세요!")
                if next=='':
                    go1(sum1,sum2,e,f)
            elif chip_com==0:
                print('com이 졌습니다.')
        else:
            Cpu_Prchs(sum1,sum2,e,f)
    if sum2==8:
        board[13][2]+='C'
        if board[14][2][-1]=='$':
            print('상대방의 선수를 임대합니다.(com의 칩이 플레이어에게 넘어갑니다)')
            chip_com-=1
            chip_me+=1
            print('com의 칩 개수: ',chip_com)
            print('플레이어의 칩 개수: ',chip_me)
            if chip_com!=0:
                Cpu_Remove(f)
                next=input("enter키를 누르세요!")
                if next=='':
                    go1(sum1,sum2,e,f)
            elif chip_com==0:
                print('com이 졌습니다.')
        else:
            Cpu_Prchs(sum1,sum2,e,f)
    if sum2==9:
        board[13][0]+='C'
        if board[14][0][-1]=='$':
            print('상대방의 선수를 임대합니다.(com의 칩이 플레이어에게 넘어갑니다)')
            chip_com-=1
            chip_me+=1
            print('com의 칩 개수: ',chip_com)
            print('플레이어의 칩 개수: ',chip_me)
            if chip_com!=0:
                Cpu_Remove(f)
                next=input("enter키를 누르세요!")
                if next=='':
                    go1(sum1,sum2,e,f)
            elif chip_com==0:
                print('com이 졌습니다.')
        else:
            Cpu_Prchs(sum1,sum2,e,f)
    if sum2==10:
        board[9][0]+='C'
        if board[10][0][-1]=='$':
            print('상대방의 선수를 임대합니다.(com의 칩이 플레이어에게 넘어갑니다)')
            chip_com-=1
            chip_me+=1
            print('com의 칩 개수: ',chip_com)
            print('플레이어의 칩 개수: ',chip_me)
            if chip_com!=0:
                Cpu_Remove(f)
                next=input("enter키를 누르세요!")
                if next=='':
                    go1(sum1,sum2,e,f)
            elif chip_com==0:
                print('com이 졌습니다.')
        else:
            Cpu_Prchs(sum1,sum2,e,f)
    if sum2==11:
        board[4][0]+='C'
        if board[5][0][-1]=='$':
            print('상대방의 선수를 임대합니다.(com의 칩이 플레이어에게 넘어갑니다)')
            chip_com-=1
            chip_me+=1
            print('com의 칩 개수: ',chip_com)
            print('플레이어의 칩 개수: ',chip_me)
            if chip_com!=0:
                Cpu_Remove(f)
                next=input("enter키를 누르세요!")
                if next=='':
                    go1(sum1,sum2,e,f)
            elif chip_com==0:
                print('com이 졌습니다.')
        else:
             Cpu_Prchs(sum1,sum2,e,f)

result=''
a='you win!'
b='you lose!'
c='draw!'
import random
while True:

    x= input('선플레이어를 정하겠습니다.\n무엇을 내시겠습니까?(가위/바위/보): ')
    while x not in {'가위','바위','보'}:
        print('다시 입력해주세요.')
        x=input('무엇을 내시겠습니까?(가위/바위/보): ')
    rsp = ('가위', '바위', '보')
    y=random.choice(rsp)
    if x=="가위" and y=="보" :
        result=a
        print('you: '+x)
        print('com: '+y)
        print(result)
        break
    elif x=="보" and y=="바위" :
        result=a
        print('you: '+x)
        print('com: '+y)
        print(result)
        break
    elif x=="바위" and y=="가위" :
        result=a
        print('you: '+x)
        print('com: '+y)
        print(result)
        break
    elif x=="보" and y=="가위" :
        result=b
        print('you: '+x)
        print('com: '+y)
        print(result)
        break
    elif x=="바위" and y=="보" :
        result=b
        print('you: '+x)
        print('com: '+y)
        print(result)
        break
    elif x=="가위" and y=="바위" :
        result=b
        print('you: '+x)
        print('com: '+y)
        print(result)
        break
    
    else :
        result=c
        print('you: '+x)
        print('com: '+y)
        print(result)
        
if result==a:
    print('당신이 먼저 게임을 시작합니다!')
    go1(0,0,0,0)
elif result==b:
    print('com이 먼저 게임을 시작합니다!')
    go2(0,0,0,0)
