import dis


def hoge(n):
    print("Hello!")
    sum = n + 4
    print(sum)
    return sum

dis.dis(hoge)
