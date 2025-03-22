import java.util.ArrayList;

public class Union_ofTwo_SortedArray
{ 
    public static void main(String[] args) {
        int arr1[]={1,1,2,3,4,5};
        int arr2[]={2,3,4,4,5,6};

       ArrayList<Integer> union = OptimizedApproach( arr1,  arr2);
       for(Integer i: union)
       {
        System.out.print(i+" ");
       }
        


    }
    public static ArrayList<Integer> OptimizedApproach(int a[], int b[])
    {  System.out.println("Union of sorted array : ");
        ArrayList<Integer> union= new ArrayList<>();
        int i=0;
        int j=0;

        while(i<a.length && j<b.length)  
        {
            if(a[i]<=b[j])  
            { 
                if(union.size()==0 || union.get(union.size()-1) !=a[i])
                {
                    union.add(a[i]);
                    
                }
                i++;
                
            }
            else
            {
                
                if(union.size()==0 || union.get(union.size()-1) !=b[j])
                {
                    union.add(b[j]);
                    
                }
                j++;
            }
        }
        while(i<a.length)   
        { if(union.size()==0 || union.get(union.size()-1) !=a[i])
            {
                union.add(a[i]);
                
            }
            i++;
        }
        while (j<b.length) 
         {
            if(union.size()==0 || union.get(union.size()-1) !=b[j])
            {
                union.add(b[j]);
                
            }
            j++;
            
        }
        return union;
    }

}
//Time Complexity : O(n1+n2)
// Space Complexity for returning : O(n1+n2) (worst case : every element are unique);