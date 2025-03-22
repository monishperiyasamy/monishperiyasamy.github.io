// After solving remove duplicates from sorted array , This question is very similar to that
public class Moving_0s_ToEnd {
    public static void main(String args[])
    {
        int arr[]={1,2,0,4,3,0,5,0};
        int i=0;
        for(int j=1; j<arr.length; j++)
        {
            if(arr[i]==0)
            {
                if(arr[j]==0) continue;
                arr[i]=arr[j];
                arr[j]=0;
            }
            i++;

        }
        System.out.println("Moving Zeros to end");
        for(int k=0; k<arr.length;k++)
        {
              System.out.print(arr[k]+" ");
        }
    }
    
}
//Time Complexity:O(n)
//Extra space used:O(1)


