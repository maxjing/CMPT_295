#include <iostream>

using namespace std;


int main(){
    int arr[3][3]=
            {

                    {1, 2, 3},
                    {4, 5, 6},
                    {7, 8, 9}


            };
    int arr1[3][3]=
            {

                    {1, 4, 7},
                    {2, 5, 8},
                    {3, 6, 9}


            };

    int f[3][3];

//    for(int i = 0 ;i<3;i++){
//        for(int j = 0; j<3;j++){
//            cout<<f[i][j]<<" ";
//        }
//    }
//    cout<<endl;



    int C[3][3];
    int sum, r;
    int l,m,k;
    int E[3][3];
    for ( l= 0; l < 3; l++) {
        for (m = 0; m < 3; m++) {

                    f[l][m] = arr[m][l];

            sum = 0;

            for (k = 0; k < 3; k++) {
                sum += arr[l][k] *f[m][k];
            }
            C[l][m] = sum;
        }
    }

    for(int i = 0; i<3;i++){
        for(int j = 0 ;j<3;j++){
            cout<<C[i][j]<<" ";
        }
    }
    cout<<endl;
}

