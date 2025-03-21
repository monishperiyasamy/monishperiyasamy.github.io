import java.util.Set;
import java.util.HashSet;


public class Remove_Duplicate_InPlace_from_SortedArray
{
    public static void main(String args[])
    {
        int arr[]={1,1,2,2,2,3,3};
        
        // BruteForce(arr);
         OptimizedApproach(arr);
         //AnotherApproach(arr);
         for(int i=0; i<arr.length; i++)
         {
            System.out.print(arr[i]+" ");
         }
        
    }
    //Brute Force Apporach
    public static int[] BruteForce(int[] arr)
    { 
        System.out.println("The array after remove unique elements through bruteforce: ");
        Set<Integer> l = new HashSet<>();
        for(int i=0; i<arr.length; i++)
        {
            l.add(arr[i]);

        }
        
        int idx=0;
        for(Integer i:l)
        {
            arr[idx]=i;
            idx++;
        }
       return arr;
       //Time Complexity: o(n logn) + o(n)
       //Space Complexity : o(n) (using set externally)
    }
   
    //Optimized Approach
    public static int[] OptimizedApproach(int []arr)
    {  
        int count=1; // 1st element is considered as unique by defalut
        for(int i=0,j=i+1; i<arr.length-1&j<arr.length;)
        {
            if(arr[i]==arr[j])
            {
                j++;
                continue;
            }
            
            arr[i+1]=arr[j];
            i=i+1;
            count++;

        }
        System.out.println("Number of unique elements : "+ count);
        System.out.println("The array after remove unique elements through optimized approach: ");
      
        return arr;
    }
    //Time Complexity : o(n)
    //Space Complexity :o(1)

    //Another Optimized Approach
    public static int[] AnotherApproach(int []arr)
    {  
        int i=0;
        for(int j=1; j<arr.length;j++)
        {
            if(arr[i]!=arr[j])
            {
            
            arr[i+1]=arr[j];
            i++;
            
        }
        
      
        
    }
    System.out.println("Number of unique elements : "+ (i+1));
    System.out.println("The array after remove unique elements through another optimized approach: ");
    return arr;
}
//Time Complexity : o(n)
//Space Complexity:o(1)

/*In this approach , everytime we don't want to bring j to next of i */


}