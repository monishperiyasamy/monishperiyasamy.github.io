class Node // self defined obj
{
    int data;
    Node next;
    Node prev;

    Node(int data,Node next, Node prev)
    {
        this.data=data;
        this.next=next;
        this.prev=prev;
    }
    Node(int data)
    {
        this.data=data;
        next=null;
        prev=null;
    }
}

public class DLinkedList
{
public static void main(String args[])
{
         int arr[]={1,2,3,4,5};
         // Convert Array to DLL
         Node head= ConvertToArray(arr);
         //Deletion 
        head= DeletionOfHead(head);
        DeletionOfTail(head);
        DeletionAtKthPosition(head,1);
        //Insertion 
        head=InsertionOfHead( head,  6);
        InsertionAtTail(head, 7);
        InsertionAtKthPosition(head, 3, 8);

}
public static Node ConvertToArray(int[] arr)  // Converting an  Array to LinkedList
{       System.out.print("Converting array to DLL : ");
        Node head =new Node(arr[0]);
         Node tail=head;
         for(int i=1; i<arr.length; i++)
         { 
            Node temp= new Node(arr[i]);
            tail.next=temp;
            temp.prev=tail;
            tail=temp;

         }
         DisplayingLL(head);
         return head;
}
public static void DisplayingLL(Node head)    // Displaying the LinkedList
{   
   
    Node temp=head;
    while(temp!=null)
    {
        System.out.print(temp.data+" -> ");
        temp=temp.next;
    }
    System.out.print("null");
}
public static Node DeletionOfHead(Node head)
{   
    System.out.print("\nLinked list after deletion of head :");

    if(head==null || head.next==null)
    {
        return null;
    }
    Node temp=head;
    head=temp.next;
    temp.next=null;
    head.prev=null;
    DisplayingLL(head);
    return head;
}
public static Node DeletionOfTail(Node head)   // Deletion of Tail
{   System.out.print("\nLinked list after deletion of tail :");

    if(head==null || head.next==null)
    {
        return null;
    }
    Node temp=head;
    while(temp.next.next!=null)
    {
        temp=temp.next;
    }
    temp.next.prev=null;
    temp.next=null;
    DisplayingLL(head);
    return head;

}
public static Node DeletionAtKthPosition(Node head , int pos) // Deletion of Node at Kth position
{   System.out.print("\nLinked list after deletion at "+pos+ "th position :");
    if(head==null)
    {
       return null;
    }
    Node temp=head;
    if(pos==0)
    {
        return DeletionOfHead(head);
    }
    int count=0;
    
    while(temp!=null)
    {  
        
        if(count==pos)
        {    
           break;
        }
        count++;
        temp=temp.next;
    }
    
    if(temp.next==null)
     {
                Node back=temp.prev;
                back.next=null;
                temp.prev=null;
                
    }
    Node back=temp.prev;
    Node front =temp.next;
    back.next=front;
    front.prev=back;
    temp.next=null;
    temp.prev=null;

    DisplayingLL(head);
    return head;

} 
public static Node InsertionOfHead(Node head , int  val)  // Insertion of head
{  System.out.print("\nLinked list after Insertion of head :");
    Node temp=new Node(val);
    if(head ==null)
    {
        return temp;
    }
    temp.next=head;
    head.prev=temp;
    head=temp;
    DisplayingLL(head);
    return head;
}
public static Node InsertionAtTail(Node head, int val) // Insertion at tail
{
    System.out.print("\nLinked list after Insertion at tail :");
    Node tail= new Node (val);
    Node temp=head;
    if(head==null || head.next==null)
    {
      return temp;
    }
    while(temp.next!=null)
    {
        temp=temp.next;
    }
    temp.next=tail;
    tail.prev=temp;
    DisplayingLL(head);
    return head; 
}
public static Node InsertionAtKthPosition(Node head, int pos, int val)
{ System.out.print("\nLinked list after Insertion at kth position :");
  
  Node temp=head;
  if(pos==0)
  {
    return InsertionOfHead(head, val);
  }
  int count=0;
  while(temp!=null)
  { 
    if(count==pos)
    {
        break;
    }
    count++;
    
    temp=temp.next;
  }

    Node back=temp.prev;
    Node newNode=new Node(val);
    back.next=newNode;
    temp.prev=newNode;
    newNode.next=temp;
    newNode.prev=back;

    DisplayingLL(head);
    return head;

    
}

}
