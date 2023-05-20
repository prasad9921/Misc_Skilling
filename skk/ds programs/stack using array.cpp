#include<stdio.h>
int stack[100],n,i,x,choice,top;
void push();
void pop();
void display();
int main()
{
	top=-1;
	printf("enter the size of stack\n");
	scanf("%d",&n);
	printf(" 1.PUSH\n 2.POP\n 3.DISPLAY\n 4.EXIT\n");

	do
	{
		printf("enter the choice value\n");
		scanf("%d",&choice);
	switch(choice)
	{
		case 1: push();
		        break;
		case 2: pop();
		        break;
		case 3: display();
		        break;
		case 4: printf("exit\n");
		        break;
		default : printf("enter value is invalid\n");				        
	}
	}while(choice!=4);
	return 0;
}
void push()
{
	if(top>n-1)
	{
		printf("stack is overflow\n");
	}
	else
	{
		printf("enter the value\n");
		scanf("%d",&x);
		top++;
		stack[top]=x;
	}
}
void pop()
{
	if(top<=-1)
	{
		printf("stack is underflow\n");
	}
	else
	{
		printf("enter value to pop %d: ",stack[top]);
		top--;
	}
}
void display()
{
	if(top>=0)
	{
		for(i=top;i>=0;i--)
		{
			printf("%d\n",stack[i]);
		}
	}
	else
	{
		printf("stack is empty");
	}
}
