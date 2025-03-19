 class Node                            // Self defined Object
{
    int data;
    Node next;

    Node(int data, Node next)
    {
        this.data=data;
        this.next=next;
    }
    Node(int data)
    {
        this.data=data;
        this.next=null;
    }
}

public class SLinkedList
{
    public static void main(String arrgs[])  // main Method
    {
        int arr[]={1,2,3,4,5};
        Node head= ConvertTOLL(arr);
        //Traversal
         DisplayingLL(head);
         LengthOfLL(head);
        //Existence
         System.out.print(CheckPresentOrNot(head,4));
         //Deletion 
         head= DeletionOfHead(head);
         DeletionOfTail(head);
         DeletionOfNodeAtKthPosition( head, 2);
         //Insertion
         head=InsertionAtHead(head,6);
         InsertionAtTail(head, 7);
         InsertionOfNodeAtKthPosition( head, 2, 8);

         
        
    
    }
    public static Node ConvertTOLL(int []arr) // converting array to linkedlist
    {   System.out.print("Converting array to LL :");
          Node head= new Node(arr[0]);
          Node tail=head;
          for(int i=1; i<arr.length; i++)
          {
              Node temp = new Node(arr[i]);
              tail.next=temp;
              tail=temp;
          }
          return head;
    }
    public static void DisplayingLL(Node head) // Displaying LL
    {   Node temp=head;
        while(temp!=null)
        {
            System.out.print(temp.data +" -> ");
            temp=temp.next;

        }
        System.out.print("null");

    }
    public static void LengthOfLL(Node head)  // Length of LL
    {
        Node temp=head;
        int count=0;
        while(temp!=null)
        {
          count++;
          temp=temp.next;
        }
        System.out.println("\nLength of the LL :"+count);
    }

    public static boolean CheckPresentOrNot(Node head ,int data)
    {    System.out.print("Check existence of element :");
              Node temp= head;
              while(temp.next!=null)
              {
                if(temp.data==data)
                {      
                        
                        return true;
                }
                temp=temp.next;
              }
              return false;


    }
    public static Node DeletionOfHead(Node head)  // Deletion of Head
    {  System.out.print("\n Deletion of Head :");
        if(head==null || head.next==null)
        {
            return null;
        }
        Node temp=head;
       head=temp.next;
       temp.next=null;
       DisplayingLL(head);
       
       return head;
    }
    public static Node  DeletionOfTail(Node head)
    {   System.out.print("\n Deletion of Tail :");
        if(head==null || head.next==null )
        {
            return null;
        }
        Node temp=head;
        while(temp.next.next!=null)
        {
            temp=temp.next;
        }
        temp.next=null;
        DisplayingLL(head);
        return head;
        

    }
    
    public static Node DeletionOfNodeAtKthPosition(Node head, int pos)
    {   System.out.print("\n Deletion of Node at Kth Position :");
        if(head==null )
        {
            return null;
        }
        // deletion at head
        if(pos==1)
        {
            head=head.next;
            return head;
        }
        int count=0;
        Node temp=head;
        Node temp1=temp;
        while(temp !=null)
        {
            count++;
            if(count==pos)
            {
               temp1.next=temp.next;
               
            }
            temp1=temp;
            temp=temp.next;
        }
        DisplayingLL(head);
        return head;
       
    }
    public static Node InsertionAtHead(Node head, int val)  // Insertion At Head
    {   System.out.print("\n Insertion at Head : ");
        Node temp=new Node(val);
        if(head==null)
        {
            return temp;
        }
      temp.next=head;
      head=temp;
      DisplayingLL(head);
      return head;
        
    }
    public static Node InsertionAtTail(Node head, int val)  //Insertion At Tail
    {    System.out.print("\n Insertion at Tail : ");
        Node temp=new Node(val);
        Node tail=head;
        // if there is no node
        if(head==null)
        {
            return temp;
        }
        while(tail.next!=null)
        {
           
            tail=tail.next;
        }
        tail.next=temp;
        DisplayingLL(head);
        return head;

    }
    public static Node InsertionOfNodeAtKthPosition(Node head, int pos, int val)
    {  System.out.print("\n Insertion of node At Kth position : ");
        Node temp1=new Node(val);
       Node temp=head;
        // if the LL is empty
        if(head==null )
        { 
            return temp1;
        }
        if(pos==0)
        {
            temp1.next=head;
            head=temp1;
            return head;
        }
        int count=0;
        while(temp!=null)
        {
            count++;
            if(count==pos)
            {
                  temp1.next=temp.next;
                  temp.next=temp1;
                 

            }
            temp=temp.next;
        }
        DisplayingLL(head);
        return head;

        
    }

    

}