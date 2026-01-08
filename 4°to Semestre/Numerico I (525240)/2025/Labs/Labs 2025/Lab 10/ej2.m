A_0=tridiag2(100,4,-1,-1,2);
[L_0,U_0]=lu(A_0);

spy(U_0)
title("Estructura matriz U")


spy(L_0)
title("Estructura matriz L")

spy(A_0,'m--',8)
title("Estructura matriz A_0")


%Al hacer la segunda queda la caga.



nl=nnz(L_0);
nu=nnz(U_0);
nA=nnz(A_0);