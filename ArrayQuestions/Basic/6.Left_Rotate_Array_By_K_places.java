//Left Rotate Array by K places

public class Left_Rotate_Array_By_K_places {
    public static void main(String[] args) {
        int arr[]={1,2,3,4,5,6,7};
        int k=3;
        //BruteForce(arr,k);
        OptimizedApproach(arr,k);
        for(int i=0; i<arr.length; i++)
        {
           System.out.print(arr[i]+" ");
        }
       
    }
    public static int[] BruteForce(int[]arr,int d)
    {   d=d%arr.length;
        System.out.println("Rotating elements by "+d+" places through Brute Force Approach : ");
        int temp[] = new int [d];
        for(int i=0; i<d; i++)
        {
            temp[i]=arr[i];
        }
        //O(d)
        for(int i=d; i<arr.length; i++)
        {
            arr[i-d]=arr[i];
        }
        //O(n-d)
       
        for(int i=arr.length-d,j=0; i<arr.length;i++)
        {
            arr[i]=temp[j];// temp[i-(n-d)]
            
            j++;
        }
        //O(d)
        return arr;
    //Time Complexity: O(n)+O(n-d)+O(d) ==> O(n+d)
    //Space Complexity: O(d) (Extra Space) for temp arr
    }
   
   
    //Optimized Approach
    public static int[] OptimizedApproach(int []arr,int k)
    {   k=k%arr.length;
     
        reverse(arr,0,k-1);  //O(k)
        reverse(arr,k,arr.length-1); //O(n-k)
        reverse(arr,0,arr.length-1); //O(n)
        System.out.println("Rotating elements by "+k+" places through Optimized Approach : ");
        return arr;
    }
     public static void reverse(int[] arr, int s, int e)
     {  int temp=0;
        while(s<=e)
         {
           temp=arr[s];
           arr[s]=arr[e];
           arr[e]=temp;
           s++;
           e--;
         }
        
     }
     //Time complexity: O(K)+O(N-K)+O(N) ==> O(2N)
     //Extra space used:O(1)
 
     
 }
 

 /* If it is a right rotate [1,3,5,7,9]
 
 1) Reverse entire array ->[9,7,5,3,1]
 2)Reverse from 0->k-1 -> [7,9,5,3,1];
 3)Reverse from k->n-1  ->[7,9,1,3,5]


  */

    


