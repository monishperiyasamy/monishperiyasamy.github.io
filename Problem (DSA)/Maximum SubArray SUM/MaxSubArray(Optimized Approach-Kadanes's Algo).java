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

// TO PRINT THE SUBARRAY WHICH HAS MAX 

 import java.util.Scanner;
class Main
{
    public static void main(String[] args) {
        int a[]={-2,-3,4,-1,-2,1,5,-3};
        int max=Integer.MIN_VALUE;
        int sum=0;
        int Start=0;
        int arrStart= -1;
        int arrEnd=- 1;
        for(int i=0; i<a.length; i++)
        {   
            sum=sum+a[i];
            if(sum>max)
            {
                max=sum;
                arrStart=Start;
                arrEnd=i;
            }

            if( (sum<0))
            {
                sum=0; 
                 // there is no point in carrying the negative value forwad because it reduces the summation value
                 Start=i+1;
            }
            
        }
        System.out.println("Maximum subArray sum "+max);

        for(int i=arrStart; i<=arrEnd; i++)
        {
            System.out.print(a[i]+" ");
        }
    }
}

/*
Use the above for printing the subArray . In pdf Start variable is not updated properly
    */
