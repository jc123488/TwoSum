#include <stdio.h>

void twoSum(int* nums,int numSize, int target){
	int i,j;
	for(i=0;i<numSize;i++){
		for(j=i+1;j<numSize;j++){
			if(nums[i]+nums[j]==target)
				printf("%d %d\n",i,j);
		}
	}
}

int main(){
	int nums1[4] = {2,7,11,15}, target1 = 9, size1=4;
	int nums2[3] = {3,2,4}, target2 = 6, size2=3;
	int nums3[2] = {3,3}, target3 = 6, size3=2;
	twoSum(nums1,size1,target1);
	twoSum(nums2,size2,target2);
	twoSum(nums3,size3,target3);
	
	return 0;
}