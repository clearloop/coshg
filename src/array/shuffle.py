##
#  ALgorithm > Array > Shuffle > Python
##

import random


# Fisher_Yates
def fisher_yates(arr, length):
    for i in range(length):
        p = int(random.random() * length % (i + 1));
        q = arr[i];
        tmp = arr[i];
        arr[i] = arr[p];
        arr[p] = tmp;
    return arr;
    
print(fisher_yates([1,2,3], 3));

# Inside-Out
def inside_out(arrsrc, length, arrdest):
    for i in range(length):
        k = int(random.random() * length % (i + 1));
        arrdest[i] = arrdest[k];
        arrdest[k] = arrsrc[i]
    return arrdest;

print(inside_out([1,2,3], 3, [0,0,0]));



# the random
# p is a random number in range(1..8)
# q is the index of the loop
# just change the index of the random.
