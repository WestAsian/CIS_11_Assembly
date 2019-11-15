/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   main.cpp
 * Author: Wesley Duong
 *
 * Created on November 1, 2019, 4:56 PM
 */


#include <iostream>

using namespace std;
int get_inteer(int min,int max){
   int local_var;
   do{
       printf("Enter an integer between %d and %d: ",min,max);
       scanf("%d",&local_var);
  
   }while(local_var<min||local_var>max);
   return local_var;
}
int min_three(int a,int b,int c){
   if(a<b && a<c)
       return a;
   else if(b<c)
       return b;
   else
       return c;
}
int max_three(int a,int b,int c){
   if(a>b && a>c)
       return a;
   else if(b>c)
       return b;
   else
       return c;
}
int main(){
   int n1=get_inteer(1,100);
   int n2=get_inteer(1,100);
   int n3=get_inteer(1,100);
   printf("Min : %d",min_three(n1,n2,n3));
   printf("\nMax : %d",max_three(n1,n2,n3));
  

}