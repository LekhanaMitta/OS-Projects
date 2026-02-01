#include<stdio.h>
#include<unistd.h>
#include<stdlib.h>
#include<string.h>
#include<stdbool.h>
#include <sys/msg.h> 
#include<sys/ipc.h>
#include<sys/shm.h>
#include<signal.h>
#include<ctype.h>

void my_handler(){}

struct ANS
{
  int answer, err;
  char answer1[4][100];
 // char answer1[2][100];
 // char answer1[3][100];
  //char answer1[4][100];
};

// Defining comparator function as per the requirement
static int myCompare(const void* a, const void* b)
{

    // setting up rules for comparison
    return strcmp(*(const char**)a, *(const char**)b);
}

// Function to sort the array
void sort(char* arr[], int n)
{
    qsort(arr, n, sizeof(const char*), myCompare);
}

   
int main(int argc, char * argv[]){
  int shared_address = atoi(argv[argc-2]);
  int client_id = atoi(argv[argc-1]);
  struct ANS *myans = (struct ANS *)shmat(shared_address, NULL, 0);
  signal(SIGUSR1,my_handler);
  
  char* arr[4];
        for(int i=1;i<argc-2;i++)
        {
                arr[i-1]=argv[i];
        }
        for(int i=0;i<4;i++)
        {
                printf("%s\n",arr[i]);
        }

  int n=argc-3;
    int i;

    // Print the given names
    printf("Given array is\n");
    for (i = 0; i < n; i++)
        printf("%d: %s \n", i, arr[i]);

    // Sort the given names
    sort(arr, n);

    // Print the sorted names
    printf("\nSorted array is\n");
    for (i = 0; i < n; i++)
        printf("%d: %s \n", i, arr[i]);


  
  //answer= isPalindrome(argv[1]);
	myans->err = 0;
  //myans->answer = answer;
/*  myans->answer1=arr[0];
  myans->answer2=arr[1];
  myans->answer3=arr[2];
  myans->answer4=arr[3];*/
	for(i=0;i<4;i++)
	{
		//myans->answer1[i]=arr[i];
		strcpy(myans->answer1[i],arr[i]);
	}
  kill(client_id,SIGUSR1);
  return 0;
}
