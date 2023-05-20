#include<stdio.h>
int queue[100],n,front,rear,x,choice,i;
void insert();
void Delete();
void display();
int main()
{
	front=-1;rear=-1;
	printf("eneter size of queue\n");
	scanf("%d",&n);
	printf("1.insert\n 2.delete\n 3.display\n");
	do
	{
		printf("enter the choice\n");
		scanf("%d",&choice);
		switch(choice)
		{
			case 1: insert();
			        break;
			case 2: Delete();
			        break;
			case 3: display();
			        break;		    
			default :printf("entered choice is invaild\n");
		}
    }while(choice!=3);   
	
	return 0;
}
void insert()
{
	if(rear==n-1)
	{
		printf("queue is full\n");
	}
	else
	{
		if(rear==-1)
		{
			front=rear=0;
			printf("enter value into queue\n");
			scanf("%d",&x);
			rear++;
			queue[rear]=x;
		}
	}
}
void Delete()
{
	if(front==-1||front>rear)
	{
		printf("queue is empty\n");
	}
	else
	{
		printf("enter the value to delete %d: ",queue[front]);
		front++;
	}
}
void display()
{
	for(i=front;i<=rear;i++)
	{
		printf("%d",queue[i]);
	}
}
