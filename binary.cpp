#include<iostream>

using namespace std;
int main()
{


int n,i,a[30],first,last,mid,key;

cout<<"\nEnter no of elements:\t";
cin>>n;

cout<<"\nEnter elements in ascending order:\t";
for(i=0;i<n;i++)
{
cin>>a[i];
}

cout<<"\nEnter no to find:";
cin>>key;

first=0;
last=n-1;
		mid = (first + last)/2;
while(first<=last)
{

	if(a[mid]<key)
	{
		first=mid+1;
}
	else if(a[mid]==key)
	{	
		cout<<"\nElement found at"<<mid+1;
		break;
}

	else
		{last=mid-1;}

		mid = (first + last)/2;
}

	if(first > last)

	{
		cout<<"Not found! "<<key<<" is not present in the list.";
	}

return 0;

}
