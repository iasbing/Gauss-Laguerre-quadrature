# Gauss-Laguerre-quadrature
高斯—拉盖尔（Gauss–Laguerre）求积公式的完整 MATLAB 实现

##中文##
1、gauss_laguerre.m 中定义了一个函数，采用 Golub–Welsch（构造 Jacobi 矩阵并求特征值/特征向量），这是数值上稳健且简单的实现方式；
2、gauss_laguerre_test.m 演示如何用gauss_laguerre.m来计算上面例子并打印结果。

##English##
1、gauss_laguerre.m defines a function using the Golub–Welsch method (constructing the Jacobi matrix and solving for eigenvalues/eigenvectors), which is a numerically robust and straightforward implementation.
2、gauss_laguerre_test.m demonstrates how to use gauss_laguerre.m to compute the example above and print the results.
