f=@(x) exp(x);
I=exp(1)-1;

error_pm_10=abs(I-punto_medio(0,1,f,10));
error_pm_20=abs(I-punto_medio(0,1,f,20));
error_pm_40=abs(I-punto_medio(0,1,f,40));
error_pm_80=abs(I-punto_medio(0,1,f,80));


error_pm_10./error_pm_20
error_pm_20./error_pm_40
error_pm_40./error_pm_80