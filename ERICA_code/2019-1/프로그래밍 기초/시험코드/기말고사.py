프로그래밍기초 CS13
목요일 13:00 ~ 15:00
오후 7:20 마감
기말고사
100점

Computing ERICA
오후 4:50
학번.py로 제출바람! 제출버튼 눌러야 제출됩니다

2019exam2.py
텍스트

format.txt
텍스트
수업 댓글
내 과제
할당됨
내가 추가하거나 생성한 파일을 교사가 보거나 수정할 수 있습니다.
완료로 표시하거나 과제를 첨부하여 제출하세요.
비공개 댓글

### 반: CS13
### 학번: 2019041094
### 이름: 김정민

### [2점] 1. 독서 퀴즈 (컴퓨터과학이 여는 세계)
### O 또는 X로 답하시오. 
### 문제 번호 앞의 O/X 중에서 아닌 것을 지우세요.
### O (1) 메모리는 스위치만 이용해서도 구현가능하다.
### O (2) 컴퓨터로 문제를 푸는 알고리즘을 고안할 때 통밥(hueristic)과 무작위(randomness)를 동원하면 
###         효과적인 경우가 있다.
### O (3) 튜링과 처치가 각각 독립적으로 정의한 튜링기계와 람다계산법은 능력이 동일하다. 
###         튜링기계로 정의해서 돌릴 수 있는 것은 모두 람다계산법으로 정의해서 계산할 수 있고 그 반대도 성립한다.
### O (4) 사람이 새로운 지식을 만드는 방식으로 디덕(deduction, 반드시이끌기)이외에 
###         앱덕(abduction, 원인짐작하기)과 인덕(induction, 짐작해서 이끌기)이 있고, 
###         기계학습(machine learning)은 앱덕과 디덕을 자동화하는 기술이다.


### [2점] 2. 윤년 출력 프로시저
### 시작년도와 종료년도를 정수 인수로 주면 해당 기간동안의 윤년을 모두 한 줄에 하나씩 프린트하는 프로시저
### print_leap_year를 주어진 아래 뼈대 코드에 맞추어 작성하시오.
### 시작년도와 종료년도 모두 계산에 포함해야 합니다.
### 주어진 윤년 확인 함수 is_leap_year는 활용해도 좋습니다.
### 예를 들어 print_leap_year(1990,2004)를 호출하면,
### 다음과 같이 윤년을 한 줄에 하나씩 화면에 프린트 해야 합니다.
# 1990 ~ 2004 기간 중에서 윤년은 다음과 같습니다.
# 1992
# 1996
# 2000
# 2004

def is_leap_year(year):
    return year % 400 == 0 or year % 4 == 0 and year % 100 != 0

def print_leap_year(yearfrom, yearto):
    print(yearfrom, "~", yearto, "기간 중에서 윤년은 다음과 같습니다.")
    for year in range(yearfrom, yearto+1):
        if is_leap_year(year)==True:
            print(year)


### [3점] 3. ISBN-10 코드 검사 함수
### ISBN은 국제 표준 도서 번호로서, ISBN 1-2345-6789-X 또는 ISBN 1-4133-0454-0 같은 형식으로 표현합니다.
### 하이픈(-)을 제외한 10자리 중에서 앞 9자리는 모두 0~9 사이의 숫자로 구성합니다.
### 마지막 자리는 0~9 또는 X인데, 코드가 유효한지를 확인하는 자리수입니다.
### 이 자리수의 문자를 처음 부터 차례대로 d0~d9로 표현했을때,
### 마지막 자리수는 다음 공식으로 결정합니다.
### d9 = (d0*1 + d1*2 + d2*3 + d3*4 + d4*5 + d5*6 + d6*7 + d7*8 + d8*9) % 11
### d9은 이 공식에 의하면 0~10사이의 숫자가 되는데, 10인 경우에는 숫자 대신 X를 넣습니다.
### 따라서 ISBN 1-2345-6789-X 와 ISBN 1-4133-0454-0 모두 유효한 코드입니다.
### 이 코드의 앞 ISBN과 빈칸, 하이픈을 제외한 나머지 10자리 문자열을 인수로 받아
### 코드가 유효한지 True 또는 False로 확인해주는 함수 isbn10을 작성하시오.

def isbn10(s):
    if s[9]=='X':
        if 10 == (int(s[0])*1 + int(s[1])*2 + int(s[2])*3 + int(s[3])*4 + int(s[4])*5 + int(s[5])*6 + int(s[6])*7 + int(s[7])*8 + int(s[8])*9) % 11:
            return True
        else: return False
    elif int(s[9]) == (int(s[0])*1 + int(s[1])*2 + int(s[2])*3 + int(s[3])*4 + int(s[4])*5 + int(s[5])*6 + int(s[6])*7 + int(s[7])*8 + int(s[8])*9) % 11:
        return True
    else:
        return False

### test code
# print(isbn10("123456789X")) # True
# print(isbn10("1234567890")) # False
# print(isbn10("1413304540")) # True
# print(isbn10("141330454X")) # False


### [3점] 4. 오른 뿔 그리기
### 자연수를 인수로 받아서 아래와 같은 모양으로 프린트하는 프로시저 hornright를 작성하시오.

### hornright(1)을 호출하면 화면에 다음과 같이 프린트한다.
# 1

### hornright(2)를 호출하면 화면에 다음과 같이 프린트한다.
# 1 
# 2 2 
# 1 

### hornright(6)을 호출하면 화면에 다음과 같이 프린트한다.
# 1 
# 2 2 
# 3 3 3 
# 4 4 4 4 
# 5 5 5 5 5 
# 6 6 6 6 6 6 
# 5 5 5 5 5 
# 4 4 4 4 
# 3 3 3 
# 2 2 
# 1 

### hornright(12)를 호출하면 화면에 다음과 같이 프린트한다.
# 1 
# 2 2 
# 3 3 3 
# 4 4 4 4 
# 5 5 5 5 5 
# 6 6 6 6 6 6 
# 7 7 7 7 7 7 7 
# 8 8 8 8 8 8 8 8 
# 9 9 9 9 9 9 9 9 9 
# 0 0 0 0 0 0 0 0 0 0 
# 1 1 1 1 1 1 1 1 1 1 1 
# 2 2 2 2 2 2 2 2 2 2 2 2 
# 1 1 1 1 1 1 1 1 1 1 1 
# 0 0 0 0 0 0 0 0 0 0 
# 9 9 9 9 9 9 9 9 9 
# 8 8 8 8 8 8 8 8 
# 7 7 7 7 7 7 7 
# 6 6 6 6 6 6 
# 5 5 5 5 5 
# 4 4 4 4 
# 3 3 3 
# 2 2 
# 1 

### 0이하의 정수에 대해서는 아무 것도 프린트하지 말아야 한다.

def hornright(n):
    if n<=0:
        return ''
    else:
        for i in range(1,n+1):
            for _ in range(i):
                if i>=10:
                    i-=10
                print(i,end=' ')
            print()
        for i in range(n-1,0,-1):
            for _ in range(i):
                if i>=10:
                    i-=10
                print(i,end=' ')
            print()
            


### test code
# hornright(-3)
# hornright(0)
# hornright(1)
# hornright(2)
# hornright(6)
# hornright(12)


### [4점] 5. 아래 급수를 계산하는 함수 sumofnumovernext를 
### (1) 재귀 함수, (2) 꼬리재귀 함수, (3) while 루프 함수, (4) for 루프 형태로 차례로 작성하시오.
###    m(i) = 1/2 + 2/3 + ... + i/(i+1)

def sumofnumovernext(n):
    if n > 0:
        sum=0
        for i in range(1,n+1):
            sum+=i/(i+1)
        return sum
    else:
        return 0

def sumofnumovernext(n):
    def loop(n,sum):
        if n>0:
            return loop(n-1,sum+n/(n+1))
        else:
            return sum
    return loop(n,0)

def sumofnumovernext(n):
    sum = 0
    while n > 0:
            n,sum=n-1,sum+n/(n+1)
    return sum

def sumofnumovernext(n):
    sum = 0
    for i in range(1,n+1):
        sum+=i/(i+1)
    return sum




### test code
# print(sumofnumovernext(0)) # 0
# print(sumofnumovernext(1)) # 0.5
# print(sumofnumovernext(3)) # 1.9166666666666665
# print(sumofnumovernext(5)) # 3.5500000000000003
# print(sumofnumovernext(10)) # 7.980122655122655
# print(sumofnumovernext(100)) # 95.80272149226131
# 약간의 오차는 문제삼지 않습니다.


### [3점] 6. 로또 6/45 
### 로또 6/45 번호를 아래와 같은 형식으로 자동으로 무작위 생성해주는 프로시저 lotto645를 작성하시오. 
### 로또 번호는 1부터 45 사이의 수 6개로 구성합니다.
# 02 03 06 10 28 35 
# 04 11 21 26 27 40 
# 09 24 31 35 36 44 
# 12 13 16 18 36 41 
# 10 12 18 20 37 39 
### 한 행에 같은 번호가 중복해서 나오면 안됩니다.
### 주의: 한 자리수는 앞을 0으로 채워서 번호의 줄을 모두 맞추어야 합니다. 
### 힌트: random 모듈의 randrange 함수를 사용한다.
### 힌트: 리스트 sort() 메소드는 사용해도 좋다.

def lotto645():
    import random
    num=[]
    num1=''
    for _ in range(6):
        i=random.randrange(1,46)
        for j in num:
            while j==i:
                i=random.randrange(1,46)
        num+=[int(i)]
        num.sort()
    for i in num:
        if i<10:
            i=str(0)+str(i)
        num1+=str(i)+' '
    print(num1)
        


### test code
# for _ in range(5):
# 	lotto645()


### [3점] 7. 중복 골라내기
### 문자열 인수를 받아서 2번 이상 나온 문자만 나열한 리스트를 내주는 함수 collect_dups를 작성하시오.

def collect_dups(s):
    singles = ""
    duplicates = []
    for i in s:
        n=0
        for k in s:
            if i==k:
                n+=1
        if n>=2:
            duplicates+=[i]
    for l in duplicates:
        singles+=l
    duplicates=[]
    for l in singles:
        if l not in duplicates:
            duplicates+=[l]
            
    return duplicates

### test code
# print(collect_dups("sophisticated"))
# # ['s', 'i', 't']
# print(collect_dups("I'm no angel."))
# # [' ', 'n']
# print(collect_dups("Stay Hungry. Stay Foolish."))
# # ['y', ' ', 'S', 't', 'a', 'o', '.']
# print(collect_dups("Your time is limited, so don’t waste it living someone else’s life."))
# # [' ', 'i', 'm', 't', 'e', 's', 'o', 'd', 'l', 'n', '’']


### [3점] 8. 희소 리스트 (sparse list) 만들기
### 원소의 대부분이 0이고, 0이 아닌 원소가 소수인 리스트를 희소 리스트(sparse list)라고 한다.
### 리스트의 사이즈가 큰 경우, 0으로 리스트의 대부분을 채우는 건 저장공간의 낭비이다.
### 0이 아닌 원소만 인덱스를 키로하여 사전(dictionary)으로 저장하면 공간을 절약할 수 있다.
### 예를 들어, [0,0,3,0,0,0,0,0,0,7,0,0]은 {2:3,9:7}과 같이 사전으로 표현할 수 있다.
### 리스트를 이와 같은 사전 형태로 변환해주는 함수 sparse를 작성하시오.

def sparse(ns):
	dic = {}
	index = 0
	pass # for loop
	return dic

### test code
# print(sparse([])) # {}
# print(sparse([0,0,3,0,0,0,0,0,0,7,0,0])) # {2: 3, 9: 7}
# print(sparse([1,0,2,0,0,0,9,0,0])) # {0: 1, 2: 2, 6: 9}


### [3점] 9. 두 희소 리스트 덧셈
### 8번에서 사전 형태로 표현한 희소 리스트 2개 인수로 받아서 더하는 함수 sparse_add를 작성하시오.
### 예를 들어, {2: 3, 9: 7}와 {0: 1, 2: 2, 6: 9}를 더하면, 
### {2: 5, 9: 7, 0: 1, 6: 9}를 내주어야 한다.
### 

def sparse_add(ms,ns):
	pass

### test code
# print(sparse_add({},{})) # {}
# print(sparse_add({2: 3, 9: 7},{})) # {2: 3, 9: 7}
# print(sparse_add({},{0: 1, 2: 2, 6: 9})) # {0: 1, 2: 2, 6: 9}
# print(sparse_add({2: 3, 9: 7},{0: 1, 2: 2, 6: 9})) # {2: 5, 9: 7, 0: 1, 6: 9}


### [4점] 10. 완전수 (perfect number)
### 자연수 중에서 자신을 제외한 모든 약수의 합이 자신과 같은 수를 완전수라고 한다.
### 예를 들어, 6 = 3 + 2 + 1 이므로 6은 완전수이다.
### 28 = 14 + 7 + 4 + 2 + 1 이므로 28도 완전수이다.
### 10,000이하에서 완전수는 모두 4개이다.
### 자연수를 인수로 받아 그 수까지의 완전수를 모두 찾는 함수를 find_perfects_upto를 작성하시오.
### 즉, find_perfects_upto(10000)을 호출하면,
### 완전수의 리스트인 [6, 28, 496, 8128]를 내주어야 한다.

def find_perfects_upto(n):
	perfects = []
	pass # for loop
	return perfects

# print(find_perfects_upto(30)) # [6, 28]
# print(find_perfects_upto(10000)) # [6, 28, 496, 8128]


### [5점] 11. 4-Queen 만족 여부를 확인하는 함수
### 체스(chess) 보드에서 Queen 말은 같은 행, 열, 대각선에 있는 말을 잡을 수 있다.
### 4x4 체스 보드에서 4개의 Queen 말을 서로 잡히지 않게 놓은 방법은 다음의 2가지가 있다.
### Queen 말은 Q로, 빈칸은 -으로 표시한다.
###    - Q - -      - - Q -
###    - - - Q      Q - - -
###    Q - - -      - - - Q
###    - - Q -      - Q - -
### 4x4 체스 보드는 아래와 같이 중첩리스트로 표현할 수 있다.
### 빈칸은 0으로, Queen 말은 1로 표시하기로 한다.
### 아래에서 board1과 board2는 Queen 말이 서로 잡히지 않은 배치이고,
### board3과 board4는 서로 잡힐 수 있는 Queen 말이 있는 배치의 사례이다.
### 이와 같은 형식의 4개의 Queen 말이 놓인 체스보드를 인수로 받아서 
### 서로 잡히지 않는 배치이면 True를, 그렇지 않으면 False를 내주는 
### 함수 check_4queen을 작성하시오.
### 힌트: 주어진 transpose, appears_once, appears_more_than_once 함수를 활용하면 편하다.

board1 = [[0, 1, 0, 0], 
          [0, 0, 0, 1],
          [1, 0, 0, 0],
          [0, 0, 1, 0]]

board2 = [[0, 0, 1, 0], 
          [1, 0, 0, 0],
          [0, 0, 0, 1],
          [0, 1, 0, 0]]

board3 = [[1, 0, 0, 0], 
          [0, 0, 1, 0],
          [0, 0, 0, 1],
          [0, 1, 0, 0]]

board4 = [[0, 0, 1, 0], 
          [1, 0, 0, 0],
          [0, 0, 0, 1],
          [0, 0, 0, 1]]

def transpose(mat):
    no_of_columns = len(mat[0])
    transposed = []  
    for _ in range(no_of_columns):
        transposed.append([])
    for row in mat:
        i = 0
        for entry in row:
            transposed[i].append(entry)
            i += 1
    return transposed

def appears_once(ns): # 1 appears only once
	count = 0
	for n in ns:
		if n == 1:
			count += 1
	return count == 1

def appears_more_than_once(ns): # 1 appears more than once
	count = 0
	for n in ns:
		if n == 1:
			count += 1
	return count > 1

def check_4queen(board):
	pass

# print(check_4queen(board1))
# print(check_4queen(board2))
# print(check_4queen(board3))
# print(check_4queen(board4))



2019exam2.py
2019exam2.py 표시 중입니다.
