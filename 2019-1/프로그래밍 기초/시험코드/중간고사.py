프로그래밍기초 CS13
목요일 13:00 ~ 15:00
오후 8:15 마감
중간고사

Computing ERICA
오후 5:48
# 제출시 파일 이름 형식은 2019000000-도선생.py

2019exam1cs.py
텍스트
내 과제
할당됨
내가 추가하거나 생성한 파일을 교사가 보거나 수정할 수 있습니다.
완료로 표시하거나 과제를 첨부하여 제출하세요.

# 제출시 파일 이름 형식은 2019000000-도선생.py 

# 반 : 10시 / 1시
# 학번 :
# 이름 :
# 구글클래스 이름 :

## 2. 2차방정식 근의 공식

def quadraticEquationPositive(a,b,c):
    if a!=0:
        if b**2-4*a*c>0:
            n=(-b+(b**2-4*a*c)**(1/2))/2*a
            m=(-b-(b**2-4*a*c)**(1/2))/2*a
            return (float(n),float(m))
    else:
        return None

# print(quadraticEquationPositive(1,-1,-2)) # (2.0, -1.0)
# print(quadraticEquationPositive(3,3,3)) # None
# print(quadraticEquationPositive(0,3,4)) # None

### 3. 24시간 시계 형식 확인

def validClock24(time):
    (hour, colon, minute) = time.partition(":")
    return len(str(hour))==2 and 0<=int(hour)<=23 and len(str(minute))==2 and 0<=int(minute)<60 or int(hour)==24 and len(str(minute))==2 and 0==int(minute)


# print(validClock24("00:00")) # True
# print(validClock24("00:30")) # True
# print(validClock24("09:58")) # True
# print(validClock24("12:15")) # True
# print(validClock24("23:59")) # True
# print(validClock24("24:00")) # True
# print(validClock24("7:07")) # False
# print(validClock24("07:121")) # False
# print(validClock24("13:4")) # False
# print(validClock24("00:60")) # False
# print(validClock24("24:01")) # False
# print(validClock24("25:10")) # False


### 4. 24시간 시계를 12시간 시계로 변환

def clock24to12(time):
    (hour, colon, minute) = time.partition(":")
    if 0<=int(hour)<=12 :
        return str(hour)+":"+str(minute)+ "am"
    else:
        hour=int(hour)-12
        return str(hour)+":"+str(minute)+ "pm"

# print(clock24to12("00:00")) # "12:00am"
# print(clock24to12("00:05")) # "12:05am"
# print(clock24to12("09:58")) # "9:58am"
# print(clock24to12("11:43")) # "11:43am"
# print(clock24to12("12:08")) # "12:08pm"
# print(clock24to12("15:50")) # "3:50pm"
# print(clock24to12("20:20")) # "8:20pm"
# print(clock24to12("24:00")) # "12:00am"
    

### 5. 소요시간 계산하기

def timePassed(fromTime, toTime):
    (hour1,_,minute1) = fromTime.partition(":")
    (hour2,_,minute2) = toTime.partition(":")
    hour = int(hour2) - int(hour1)
    if minute1 > minute2:
        hour=int(hour)-1
        minute= 60-(int(minute1)-int(minute2))
    else:
        minute=int(minute2)-int(minute1)
    return str(hour) + ":" + str(minute)
    return str(hour) + ":" + str(minute)
    
print(timePassed("03:12","03:25")) # "0:13"
print(timePassed("11:45","13:15")) # "1:30"
print(timePassed("06:15","07:45")) # "1:30"
print(timePassed("03:34","05:00")) # "1:26"


### 6. 일반재귀 함수를 꼬리재귀 함수로 변환하기 
def adjust(ns):
    if len(ns) > 1:
        if ns[0] < ns[1]:
            return [ns[0]+1] + adjust(ns[1:])
        elif ns[0] > ns[1]:
            return [ns[0]-1] + adjust(ns[1:])
        else:
            return [ns[0]] + adjust(ns[1:])
    else:
        return ns

# print(adjust([4, 6, 5, 3, 7, 6, 2, 1, 3, 2]))
#              [5, 5, 4, 4, 6, 5, 1, 2, 2, 2]
# print(adjust([5, 4, 4, 5, 5, 4, 2, 2, 2, 2]))
#              [4, 4, 5, 5, 4, 3, 2, 2, 2, 2]
# print(adjust([4, 3, 2, 2, 2, 2, 2, 2, 2, 2]))
#              [3, 2, 2, 2, 2, 2, 2, 2, 2, 2]
# print(adjust([3, 2, 2, 2, 2, 2, 2, 2, 2, 2]))
#              [2, 2, 2, 2, 2, 2, 2, 2, 2, 2]
# print(adjust([2, 2, 2, 2, 2, 2, 2, 2, 2, 2]))
#              [2, 2, 2, 2, 2, 2, 2, 2, 2, 2]

def adjustT(ns):
    def loop(ns,n):
        if len(ns)>1:
            if int(ns[0])<int(ns[1]):
                return loop(ns[1:],n+[ns[0]+1])
            elif int(ns[0])>int(ns[1]):
                return loop(ns[1:],n+[ns[0]-1])
            else:
                return loop(ns[1:],n+[ns[0]])
        else:
            return n
    return loop(ns,[])

# print(adjustT([4, 6, 5, 3, 7, 6, 2, 1, 3, 2]))
#              [5, 5, 4, 4, 6, 5, 1, 2, 2, 2]
# print(adjustT([5, 4, 4, 5, 5, 4, 2, 2, 2, 2]))
#              [4, 4, 5, 5, 4, 3, 2, 2, 2, 2]
# print(adjustT([4, 3, 2, 2, 2, 2, 2, 2, 2, 2]))
#              [3, 2, 2, 2, 2, 2, 2, 2, 2, 2]
# print(adjustT([3, 2, 2, 2, 2, 2, 2, 2, 2, 2]))
#              [2, 2, 2, 2, 2, 2, 2, 2, 2, 2]
# print(adjustT([2, 2, 2, 2, 2, 2, 2, 2, 2, 2]))
#              [2, 2, 2, 2, 2, 2, 2, 2, 2, 2]

### 7. 꼬리재귀 함수를 while 루프 함수로 변환하기
def adjustW(ns):
    n = []
    while len(ns) > 1:
        if int(ns[0])<int(ns[1]):
            ns,n= ns[1:],n+[ns[0]+1]
        elif int(ns[0])>int(ns[1]):
            ns,n=ns[1:],n+[ns[0]-1]
        else:
            ns,n=ns[1:],n+[ns[0]]
    return n

# print(adjustW([4, 6, 5, 3, 7, 6, 2, 1, 3, 2]))
#              [5, 5, 4, 4, 6, 5, 1, 2, 2, 2]
# print(adjustW([5, 4, 4, 5, 5, 4, 2, 2, 2, 2]))
#              [4, 4, 5, 5, 4, 3, 2, 2, 2, 2]
# print(adjustW([4, 3, 2, 2, 2, 2, 2, 2, 2, 2]))
#              [3, 2, 2, 2, 2, 2, 2, 2, 2, 2]
# print(adjustW([3, 2, 2, 2, 2, 2, 2, 2, 2, 2]))
#              [2, 2, 2, 2, 2, 2, 2, 2, 2, 2]
# print(adjustW([2, 2, 2, 2, 2, 2, 2, 2, 2, 2]))
#              [2, 2, 2, 2, 2, 2, 2, 2, 2, 2]

### 8. for 루프 함수로 만들기

def adjustF(ns):
    n = []
    for i in range(1,len(ns)-2):
        if int(ns[i])<int(ns[i+1]):
            n+=[ns[i]+1]
        elif int(ns[i])>int(ns[i+1]):
            n+=[ns[i]-1]
        else:
            n+=[ns[i]]
    return n

# print(adjustF([4, 6, 5, 3, 7, 6, 2, 1, 3, 2]))
#              [5, 5, 4, 4, 6, 5, 1, 2, 2, 2]
# print(adjustF([5, 4, 4, 5, 5, 4, 2, 2, 2, 2]))
#              [4, 4, 5, 5, 4, 3, 2, 2, 2, 2]
# print(adjustF([4, 3, 2, 2, 2, 2, 2, 2, 2, 2]))
#              [3, 2, 2, 2, 2, 2, 2, 2, 2, 2]
# print(adjustF([3, 2, 2, 2, 2, 2, 2, 2, 2, 2]))
#              [2, 2, 2, 2, 2, 2, 2, 2, 2, 2]
# print(adjustF([2, 2, 2, 2, 2, 2, 2, 2, 2, 2]))
#              [2, 2, 2, 2, 2, 2, 2, 2, 2, 2]


### 9. 리스트의 원소가 모두 같은지 확인

def allequal(ns):
    if len(ns) > 1:
        if ns[0]==ns[1]:
            ns=ns[1:]
            return allequal(ns)
        elif ns[0]!=ns[1]:
            return False
        
                
    else:
        return True

# print(allequal([4, 6, 5, 3, 7, 6, 2, 1, 3, 2])) # False
# print(allequal([5, 5, 4, 4, 6, 5, 1, 2, 2, 2])) # False
# print(allequal([3, 2, 2, 2, 2, 2, 2, 2, 2, 2])) # False
# print(allequal([2, 2, 2, 2, 2, 2, 2, 2, 2, 2])) # True
# print(allequal([2])) # True
# print(allequal([])) # True

### 10. 동일화 노력

def equalizer(ns):
    count = 0
    if len(ns) > 1:
        allequal(ns)
        if False:
            count+=1
            return equalizer(adjustT(ns))
        else:
            return count
    return count

# print(equalizer([4, 6, 5, 3, 7, 6, 2, 1, 3, 2])) # 9
# print(equalizer([8, 2, 5, 7, 1, 1, 6, 7, 4, 8])) # 12
# print(equalizer([8, 4, 5, 6, 9, 8, 6, 2, 0, 6])) # 14   
# print(equalizer([4, 0, 1, 0, 3, 4, 3, 3, 7, 9])) # 13
# print(equalizer([1, 6, 5, 6, 8, 5, 3, 3, 3, 8])) # 13
# print(equalizer([])) # 0
# print(equalizer([5])) # 0
# print(equalizer([4, 4, 4])) # 0
# print(equalizer([4, 3])) # 1
# print(equalizer([4, 5])) # 1
# print(equalizer([4, 5, 4])) # 2
# print(equalizer([14, 69, 87, 13, 0, 16, 83, 19, 45, 88])) # 92


### 11. 아나그램 확인 (sort() 함수 사용 금지)

def isanagram(word1,word2):
    while word1 != '':
        if word1[0] in word2:
            word1=word1[1:]
        else:
            return False
    return word2 == ''
            
print(isanagram('','')) # True
print(isanagram('z','z')) # True
print(isanagram('zz','z')) # False
print(isanagram('z','zz')) # False
print(isanagram('silent','listen')) # True
print(isanagram('silent','listens')) # False
print(isanagram('elvis','lives')) # True
print(isanagram('restful','fluster')) # True
print(isanagram('restfully','fluster')) # False
print(isanagram('문전박대','대박전문')) # True


### 12. 이진수 덧셈 - 자리수는 같다고 가정
### 숫자열은 '0' 또는 '1'로만 구성된다.

def addBinary(n1,n2):
    over = 0
    answer = ''
    for d in range(-1,-len(n1)-1,-1):
        total = int(n1[d]) + int(n2[d]) + over
        if total == 1:
            over = pass # 이 부분을 식으로 채운다.
            answer = pass # 이 부분을 식으로 채운다.
        elif total == 2:
            over = pass # 이 부분을 식으로 채운다.
            answer = pass # 이 부분을 식으로 채운다.
        elif total == 3:
            over = pass # 이 부분을 식으로 채운다.
            answer = pass # 이 부분을 식으로 채운다.
        else: # total = 0
            over = pass # 이 부분을 식으로 채운다.
            answer = pass # 이 부분을 식으로 채운다.
    if over == 1:
        answer = pass # 이 부분을 식으로 채운다.
    return answer

# print(addBinary('','')) # ''
# print(addBinary('0','0')) # '0'
# print(addBinary('1','0')) # '1'
# print(addBinary('0','1')) # '1'
# print(addBinary('1','1')) # '10'
# print(addBinary('10','11')) # '101'
# print(addBinary('11','11')) # '110'
# print(addBinary('1011','1101')) # '11000'
# print(addBinary('1111','1111')) # '11110'
# print(addBinary('11011001','00011011')) # '11110100'
    
            

2019exam1cs.py
2019exam1cs.py 표시 중입니다.
