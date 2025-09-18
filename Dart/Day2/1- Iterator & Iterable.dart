void main(){

    Iterable<int> numbers = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];

    Iterator<int> nums = numbers.iterator;

    while(nums.moveNext()){
        if(nums.current%2==0){
            print(nums.current);
        }
    }

    print('==============================');
    
    for(var i in numbers){
        print(i);
    }


}