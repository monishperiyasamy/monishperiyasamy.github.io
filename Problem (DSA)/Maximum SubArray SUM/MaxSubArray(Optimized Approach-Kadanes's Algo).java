import java.util.Scanner;
class Main
{
    public static void main(String[] args) {
        int a[]={-2,-3,4,-1,-2,1,5,-3};
        int max=Integer.MIN_VALUE;
        int sum=0;
        for(int i=0; i<a.length; i++)
        {   
            sum=sum+a[i];
            max=Math.max(sum,max);
            if( (sum<0))
            {
                sum=0; // there is no point in carrying the negative value forwad because it reduces the summation value
            }
            
        }
        System.out.println("Maximum subArray sum "+max);
    }
}

/*
 Explanation in PDF
 */

 