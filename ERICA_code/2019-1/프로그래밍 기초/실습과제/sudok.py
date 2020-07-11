import random
def create_board():
    seed = [1, 2, 3, 4, 5, 6]
    random.shuffle(seed)
    s = [[], [], [], [], [], []]
    for i in range(6):
        random.shuffle(seed)
        s[i] += seed
    return s


def shuffle_ribbons(board) :
    top_half = board[:3]
    random.shuffle(top_half)
    bottom_half = board[3:]
    random.shuffle(bottom_half)
    return top_half + bottom_half
def copy_board(board):
    board_clone = []
    for row in board :
        row_clone = row[:]
        board_clone.append(row_clone)
    return board_clone
def create_solution_board():
    board = create_board()
    board = shuffle_ribbons(board)
    board = transpose(board)
    board = shuffle_ribbons(board)
    board = transpose(board)
    return board





def transpose(board):
    transposed = []
    for _ in range(len(board)):
        transposed.append([])
    for row in board:
        for i in range(len(board)):
            transposed[i] += [row[i]]
    return transposed

def get_level():
    level = input("난이도 (상중하) 중에서 하나 선택하여 입력: ")
    while level not in {"상","중","하"}:
        level = input("난이도 (상중하) 중에서 하나 선택하여 입력: ")
    if level=="하":
        return 6
    if level=="중":
        return 8
    if level=="상":
        return 10

def make_holes(board,no_of_holes):
    holeset = set()
    k = 0
    while k < (int(no_of_holes)):
        i=random.randint(0,5)
        j=random.randint(0,5)
        if board[i][j]!=0:
            board[i][j]=0
            holeset.add((j,i))
            k += 1
        else:
            continue
    return (board,holeset)
def show_board(board):
    print()
    print('S','|','1','2','3','4','5','6')
    print('-','+','-','-','-','-','-','-')
    i = 1
    for row in board:
        s = ''
        s += str(i)
        s += ' | '
        for col in row:
            if col == 0:
                s += '. '
            else:
                s += str(col)
                s += ' '
        print(s)
        i+=1

def get_integer(message,i,j):
    number = input(message)
    while not(i<=int(number)<=j):
        number = input(message)
    return int(number)

def sudok6x6():
    solution = create_solution_board()
    no_of_holes = get_level()
    puzzle = copy_board(solution)
    (puzzle,holeset) = make_holes(puzzle,no_of_holes)
    show_board(puzzle)
    while no_of_holes > 0:
        i = get_integer("가로줄번호(1~6): ",1,6) - 1
        j = get_integer("세로줄번호(1~6): ",1,6) - 1
        if (i,j) not in holeset:
            print("빈칸이 아닙니다.")
            continue
        n = get_integer("숫자(1~6): ",1,6)
        sol = solution[i][j]
        if n == sol:
            puzzle[i][j] = sol
            show_board(puzzle)
            holeset.remove((i,j))
            no_of_holes -= 1
        else:
            print(n,"가 아닙니다. 다시 해보세요.")
    print("잘 하셨습니다. 또 들려주세요.")
print(sudok6x6())
