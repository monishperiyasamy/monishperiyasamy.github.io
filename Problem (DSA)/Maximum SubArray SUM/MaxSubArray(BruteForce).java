
// // TO PRINT ALL THE SUB ARRAYS
// import java.util.Scanner;
// class Main {
//     public static void main(String[] args) {
//         int a[]= {1,3,7,8};

//         for(int i=0; i<a.length; i++)
//         {
//             for(int j=i; j<a.length; j++)
//             {
//                 for(int k=i; k<=j; k++)
//                 {
//                     System.out.print(a[k]+" ");
                
//                 }
//                 System.out.println();
//             }
//         }
           


//     }
// }

// /*
//   --- > i loop to iterate to the next next num , i.e 1   next  3  next  7   next   8
  
//   -----> j loop to iterate to the next next num  of each indivual numbers above, { to determine ending range from i}
//    i.e for 1 -->  from 1 till 8

// -------> k loop to print the num 
//       starting from i till the num in current j

//       --> 1 (j=0)
//       --> 1 , 3 (j=1)
//       --> 1, 3, 7 (j=2)
//       --> 1, 3, 7, 8 (j=3)



//  */



 // Print subarray with maximum sum ( ONLY SUM)

 import java.util.*;
class Main {
    public static void main(String[] args) {
        int a[]= {1,3,7,8};
        int sum=0;
        int max=Integer.MIN_VALUE;

        for(int i=0; i<a.length; i++)
        {
            for(int j=i; j<a.length; j++)
            {
                for(int k=i; k<=j; k++)
                {
                   sum=sum+a[k];
                
                }
               max=Math.max(sum,max);
                sum=0;
              
            }
        }
           
      System.out.println("Maximum subArray sum "+max );

    }
}



