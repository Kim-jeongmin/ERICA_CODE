def OPT(size, pages):
    SIZE = size
    memory = []
    faults = 0

    for i in range(len(pages)):
        page = pages[i]
        print(page)
        if page not in memory:
            faults += 1
            if len(memory) < SIZE:
                memory.append(page)
            else:
                # 미래에 가장 오랫동안 사용되지 않을 페이지를 찾습니다.
                # 아예 페이지가 나타나지 않으면 바로 바꾸기
                flag = True
                for j in range(0, len(memory)):
                    if memory[j] not in pages[i+1:]:
                        del memory[j]
                        memory.append(page)
                        flag = False
                        break
                if flag == False : 
                    print(memory)
                    continue
                
                # 페이지가 다 나타날 때 가장 늦게 나타나는 페이지를 바꿉니다.
                future_indies = []
                for j in range(0, len(memory)):
                    for k in range(i+1, len(pages)):
                        if memory[j] == pages[k] :
                            future_indies.append(k)
                            break

                max_index = max(future_indies)
                memory[memory.index(pages[max_index])] = page                
            print(memory)

    return faults



def main():
    size = 3
    pages = [7, 0, 1, 2, 0, 3, 0, 4, 2, 3, 0, 3, 2, 1, 2, 0, 1, 7, 0, 1]

    faults = OPT(size, pages)

    print("페이지 부재 수:", faults)

if __name__ == '__main__':
    main()





