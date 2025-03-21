//Left Rotate Array By One place

public class Left_Rotate_Array_ByOnePlace
{
    public static void main(String[] args) {
        int arr[]={1,2,3,4,5};
        OptimalApproach(arr);
        for(int i=0; i<arr.length; i++)
        {
           System.out.print(arr[i]+" ");
        }
       

     
    }

    public static int[] OptimalApproach(int[] arr)
    {
        System.out.println("Left rotate Array by one place : ");
      int first=arr[0];
      for(int i=0; i<arr.length-1; i++)
      {
        arr[i]=arr[i+1];
      }
      arr[arr.length-1]=first;
      return arr;
    }
    //Time Complexity: O(n)
    //Space Complexity:O(1)(Extra space used)
}