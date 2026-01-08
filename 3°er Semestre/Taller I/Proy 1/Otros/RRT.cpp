#include <bits/stdc++.h>
using namespace std;

float pol(vector<int> coef ,int p,int q){
    float sum = 0;
    for(int i=0;i<coef.size();i++){
        sum+=pow(p,i)*pow(q,coef.size()-i)*coef[i];
    }
    return sum;
}

vector<int> divisors (int n){
    if(n<0){
        n=-n;
    }
    vector<int> result;
    for(int i=1;i*i<=n;i++){
        if(n%i==0){
            result.push_back(i);
            result.push_back(n/i);
        }
    }
    result.push_back(n);
    return result;
}

int main(){
    int dg;
    cin>>dg;
    vector<int> coef(dg+1);
    for(int i=0;i<dg+1;i++){
        cin>>coef[i]; // Primero ingresado es A_0
    } 


    vector<int> l1=divisors(coef[0]);
    vector<int> l2=divisors(coef[dg]);

    set<pair<int,int>> sol;

    for(int i=0;i<l1.size();i++){
        for(int j=0;j<l2.size();j++){
            if(pol(coef,l1[i],l2[j])==0){
                sol.insert({l1[i],l2[j]});
            }
            else if (pol(coef,-l1[i],l2[j])==0){
                sol.insert({-l1[i],l2[j]});
            }
        }
    }
    if(!sol.empty()){
        cout<<"Las soluciones racionales son: "<<endl;
        for(const auto& s:sol){
            cout<<s.first<<"/"<<s.second<<endl;
        }
    }
    else{
        cout<<"El polinomio no posee soluciones racionales.";
    }

}
