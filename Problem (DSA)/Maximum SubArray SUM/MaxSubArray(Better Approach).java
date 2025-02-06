import java.util.*;
class Main {
    public static void main(String[] args) {
        int a[]= {1,3,7,8};
        int sum=0;
        int max=Integer.MIN_VALUE;

        for(int i=0; i<a.length; i++)
        {  sum=0;
            for(int j=i; j<a.length; j++)
            {
                sum=sum+a[j];
                max=Math.max(sum,max);

              
            }
        }
           
      System.out.println("Maximum subArray sum "+max );

    }
}

/* 
 Every time in k loops calculates the sum from starting till current j

 IN BETTER APPROACH:
 --> the sum of the current subarry  is , i.e [sum of previous subarry]+new encountered num;

1  -> 1
1 3 -> [previous subarray]+3 = 4
1 3 7 -> [previous subarray]+7= 11
1 3 7 8 -> [previous subarray]+ 8= 19
 */

 