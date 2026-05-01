---
math: true
title: "柱函数, Bessel 函数与 Neumann 函数"
date: 2025-12-07 11:10:00 +0800
categories: [physics]
tags: [数学物理方法]
---

Helmholtz 方程在柱坐标系下分离变量, 可以得到

$$
\frac{1}{r}\frac{\mathrm d}{\mathrm dr}\left(r\frac{\mathrm dR}{\mathrm dr}\right)+\left(k^2-\lambda-\frac{\mu}{r^2}\right)R=0
$$

作变换 $x=\sqrt{k^2-\lambda}r, y=R,\mu=\nu^2$, 得到

$$
\boxed{\frac{1}{x}\frac{\mathrm d}{\mathrm dx}\left(x\frac{\mathrm dy}{\mathrm dx}\right)+\left(1-\frac{\nu^2}{x^2}\right)y=0}
$$

称为 $\nu$ **阶 Bessel 方程**.


---


## Bessel 函数与 Neumann 函数

Bessel 方程有两个奇点: 正则奇点 $z=0$ 和非正则奇点 $z=\infty$. 在正则奇点 $z=0$ 处, 指标 $\rho=\pm \nu$.

- 当 $\nu\notin\mathbb Z$ 时, Bessel 方程的两个线性无关正则解为 

$$\color{red}{\mathrm J_{\pm\nu}(z)=\sum_{k=0}^\infty\frac{(-1)^k}{k!\Gamma(k\pm\nu+1)}\left(\frac{z}{2}\right)^{2k\pm\nu}}$$

也可以取 Bessel 方程的第一解为 

$$\displaystyle \mathrm J_{\nu}(z)=\sum_{k=0}^\infty\frac{(-1)^k}{k!\Gamma(k+\nu+1)}\left(\frac z2\right)^{2k+\nu}$$

而第二解为 $\mathrm J_{\pm\nu}(z)$ 的线性组合 

$$\mathrm N_\nu(z)=\dfrac{\cos\nu\pi\mathrm J_\nu(z)-\mathrm J_{-\nu}(z)}{\sin\nu\pi}$$

- 当 $\nu=n\in\mathbb Z$ 时, $\mathrm J_{-n}(z)=(-1)^n\mathrm J_{n}(z)$, Bessel 方程第一解的形式不变, 第二解可以通过取极限以及 L'Hôpital 法则来定义为

$$\begin{align*} 
\mathrm N_n(z)&=\lim\limits_{\nu\to n}\dfrac{\cos\nu\pi\mathrm J_\nu(z)-\mathrm J_{-\nu}(z)}{\sin\nu\pi}\\ 
&=\dfrac2\pi\mathrm J_n(z)\ln\dfrac z2-\dfrac1\pi\sum_{k=0}^{n-1}\dfrac{(n-k-1)!}{k!}\left(\dfrac z2\right)^{2k-n}\\ 
-&\dfrac1\pi\sum_{k=0}^\infty\dfrac{(-1)^k}{k!(k+n)!}[\psi(n+k+1)+\psi(k+1)]\left(\dfrac z2\right)^{2k+n}
\end{align*}$$

![](https://pica.zhimg.com/v2-3cd4f9577e35cc42bb0d6e0e606f3862_1440w.jpg)

![](https://pica.zhimg.com/v2-b42958cdb5f36a548faa78381c232faa_1440w.jpg)

### 递推关系

对于 Bessel 函数, 成立如下递推关系:

$$
\boxed{\begin{align*}\dfrac{\mathrm d}{\mathrm dz}[z^\nu\mathrm J_\nu(z)]&=z^\nu\mathrm J_{\nu - 1}(z)\\\dfrac{\mathrm d}{\mathrm dz}[z^{-\nu}\mathrm J_\nu(z)]&=-z^{-\nu}\mathrm J_{\nu+1}(z)\end{align*}}
$$

>  证明. $\displaystyle\mathrm J_\nu(z)=\sum_{k=0}^\infty\frac{(-1)^k}{k!\Gamma(k+\nu+1)}\left(\dfrac z2\right)^{2k+\nu}$. 由于级数在全平面收敛, 可以逐项微商, 得到
>  
> $$\begin{align*}\frac{\mathrm d}{\mathrm dz}(z^\nu\mathrm J_\nu(z))&=\frac{\mathrm d}{\mathrm dz}\sum_{k=0}^\infty\frac{(-1)^k}{k!\Gamma(k+\nu+1)}\frac {z^{2k+2\nu}}{2^{2k+\nu}}\\&=\sum_{k=0}^\infty\frac{(-1)^k}{k!\Gamma(k+\nu)}\frac{z^{2k+2\nu-1}}{2^{2k+\nu-1}}\\&=z^\nu\mathrm J_{\nu - 1}\end{align*}$$
> 
>  同理
> 
>  $$\begin{align*}\frac{\mathrm d}{\mathrm dz}(z^{-\nu}\mathrm J_\nu(z))&=\frac{\mathrm d}{\mathrm dz}\sum_{k=0}^\infty\frac{(-1)^k}{k!\Gamma(k+\nu+1)}\frac {z^{2k}}{2^{2k+\nu}}\\&=\sum_{k=0}^\infty\frac{(-1)^{k + 1}}{k!\Gamma(k+\nu+2)}\frac{z^{2k+1}}{2^{2k+\nu+1}}\\&=-z^{-\nu}\mathrm J_{\nu + 1}\end{align*}$$

这两个递推关系可以写成

$$
\nu z^{\nu - 1}\mathrm J_{\nu}(z)+z^\nu\mathrm J'_\nu(z)=z^\nu\mathrm J_{\nu - 1}(z)
$$

$$
-\nu z^{-\nu-1}\mathrm J_{\nu}(z)+z^{-\nu}\mathrm J_\nu'(z)=-z^{-\nu}\mathrm J_{\nu+1}(z)
$$

消去 $\mathrm J_\nu(z)$ 或 $\mathrm J_\nu'(z)$, 得到

$$
\mathrm J_{\nu-1}(z)-\mathrm J_{\nu+1}(z)=2\mathrm J_\nu'(z)
$$

$$
\mathrm J_{\nu - 1}-\mathrm J_{\nu +1}(z)=\dfrac{2\nu}{z}\mathrm J_\nu(z)
$$

这说明**任意整数阶的 Bessel 函数, 总是可以用** $\mathrm J_0(z)$ **和** $\mathrm J_1(z)$ **表示**.

另外注意到, 在 $\dfrac{\mathrm d}{\mathrm dz}(z^{-\nu}\mathrm J_\nu(z))=-z^{-\nu}\mathrm J_{\nu + 1}(z)$ 中, 令 $\nu = 0$, 可以得到 $\color{red}{\mathrm J_0'(z)=-\mathrm J_1(z)}$.

对于 Neumann 函数, 成立如下递推关系

$$
\boxed{\begin{align*}\frac{\mathrm d}{\mathrm dz}(z^\nu\mathrm N_\nu(z))&=z^\nu\mathrm N_{\nu - 1}(z)\\\frac{\mathrm d}{\mathrm dz}(z^{-\nu}\mathrm N_{\nu + 1}(z))&=-z^{-\nu}\mathrm N_{\nu + 1}(z)\end{align*}}
$$

### 渐近展开

$z\to 0$ 时 Bessel 函数的渐近展开为 

$$\mathrm J_\nu(z)=\frac{1}{\Gamma(\nu + 1)}\left(\frac z2\right)^\nu+\mathcal O(z^{\nu + 2})$$

$z\to\infty$ 时 Bessel 函数的渐近展开为 

$$\mathrm J_\nu(z)=\sqrt{\frac 2{\pi z}}\cos\left(z-\frac{\nu\pi}2-\frac\pi4\right)+\mathcal O\left(\frac 1z\right)$$

$z\to 0$ 时 Neumann 函数的渐近展开为

$$N_\nu(z)=-\frac{\Gamma(\nu)}{\pi}\left(\frac 2z\right)^\nu+\mathcal O(z^{2-\nu})$$

特别是 $\nu=0$ 时, 

$$\mathrm N_0(z)=\frac 2\pi\ln\left(\frac z2\right)+\gamma+\mathcal O(z^2)$$

所以不论是否 $\nu$ 为整数, Neumann 函数在 $z=0$ 处均发散.

$z\to\infty$ 时 Neumann 函数的渐近展开为 

$$\mathrm N_\nu(z)=\sqrt{\frac 2{\pi z}}\sin\left(z-\frac{\nu\pi}2-\frac\pi4\right)+\mathcal O\left(\frac 1z\right)$$


---


## 整数阶 Bessel 函数

### 生成函数

Bessel 函数的生成函数为 

$$
\boxed{\exp\left[\frac z2\left(t-\frac1t\right)\right]=\sum_{n=-\infty}^\infty \mathrm J_n(z)t^n}
$$

令 $t=\mathrm i\exp(\mathrm i\theta)$, 则有 

$$
\mathrm e^{\mathrm iz\cos\theta}=\sum_{n=-\infty}^{\infty}\mathrm J_n(z)\mathrm i^n\mathrm e^{\mathrm in\theta}=\color{red}{\mathrm J_0(z)+2\sum_{n=1}^\infty\mathrm i^n\mathrm J_n(z)\cos n\theta}
$$

这是 $\mathrm e^{\mathrm iz\cos\theta}$ 的余弦展开.

如果再令 $z = kr$, 则有 

$$
\mathrm e^{\mathrm ikr\cos\theta}=\mathrm J_0(kr)+2\sum_{n=1}^\infty \mathrm i^n\mathrm J_n(kr)\cos n\theta
$$

 这是平面波在柱坐标系下的展开式.

### 积分表示

令 $t=\exp(\mathrm i\theta)$, 可得

$$\mathrm e^{\mathrm iz\sin\theta}=\sum_{n=-\infty}^\infty\mathrm J_n(z)\mathrm e^{\mathrm in\theta}$$ 

这是 $\mathrm e^{\mathrm iz\sin\theta}$ 的 Fourier 展开. 可以进一步得到

$$\mathrm J_n(z)=\color{red}{\frac{1}{2\pi}\int_{-\pi}^\pi\mathrm e^{\mathrm iz\sin\theta}(\mathrm e^{\mathrm in\theta})^*\mathrm d\theta}=\frac{1}{2\pi}\int_{-\pi}^\pi[\cos(z\sin\theta-n\theta)+\mathrm i\sin(z\sin\theta-n\theta)]\mathrm d\theta$$ 

这个积分中, 虚部是奇函数, 所以积分为0, 从而得到

$$\boxed{\mathrm J_n(z)=\frac1\pi\int_0^\pi\cos(z\sin\theta-n\theta)\mathrm d\theta}$$ 

## Bessel 函数的正交关系

三类边界条件可以统一写成 $\alpha R'(a)+\beta R(a)=0$, 其中 $\alpha=0$ 即第一类边界条件, $\beta = 0$ 为第二类边界条件, 其余情况为第三类边界条件. 

### 第一类边界条件

设有本征函数 $\mathrm J_m(k_{mi}r)$, 它满足

$$\dfrac1r\dfrac{\mathrm d}{\mathrm dr}\left(r\dfrac{\mathrm d\mathrm J_m(k_{mi}r)}{\mathrm dr}\right)+\left(k_{mi}^2-\dfrac{m^2}{r^2}\right)\mathrm J_m(k_{mi}r)=0$$

且 $\mathrm J_m(0)$ 有界, $\mathrm J_m(k_{mi}a)=0$.

另外有函数 $\mathrm J_m(kr)$, 它满足 

$$\dfrac1r\dfrac{\mathrm d}{\mathrm dr}\left(r\dfrac{\mathrm d\mathrm J_m(kr)}{\mathrm dr}\right)+\left(k^2-\dfrac{m^2}{r^2}\right)\mathrm J_m(kr)=0$$

且 $\mathrm J_m(0)$ 有界. 

分别用 $r\mathrm J_m(kr)$ 和 $r\mathrm J(k_{mi}r)$ 乘两个方程, 得到

$$\begin{cases}
\mathrm J_m(kr)\dfrac{\mathrm d}{\mathrm dr}\left(r\dfrac{\mathrm d\mathrm J_m(k_{mi}r)}{\mathrm dr}\right)+\left(k_{mi}^2-\dfrac{m^2}{r^2}\right)r\mathrm J_m(k_{mi}r)\mathrm J_m(kr)=0\\
\mathrm J_m(k_{mi}r)\dfrac{\mathrm d}{\mathrm dr}\left(r\dfrac{\mathrm d\mathrm J_m(kr)}{\mathrm dr}\right)+\left(k^2-\dfrac{m^2}{r^2}\right)r\mathrm J_m(kr)\mathrm J_m(k_{mi}r)=0
\end{cases}$$ 

> 选择交叉相乘主要出于构造全导数形式的考虑.
{: .prompt-tip }

相减并积分, 得到

$$\begin{align}(k_{mi}^2-k^2)&\int_0^a\mathrm J_m(k_{mi}r)\mathrm J_m(kr)r\mathrm dr\\=& r\left(\mathrm J_m(k_{mi}r)\frac{\mathrm d\mathrm J_m(kr)}{\mathrm dr}-\mathrm J_m(kr)\frac{\mathrm d\mathrm J_m(k_{mi}r)}{\mathrm dr}\right)\Bigg|_{r=0}^{r=a} \end{align}$$ 

再代入边界条件, 得到

$$(k_{mi}^2-k^2)\int_0^a\mathrm J_m(k_{mi}r)\mathrm J_m(kr)r\mathrm dr=-k_{mi}a\mathrm J_m(ka)\mathrm J_m'(k_{mi}a)$$ 

对于两类特殊情形.

- $k=k_{mj}, \;i\neq j$. 容易得到 $\displaystyle\int_0^a\mathrm J_m(k_{mi}r)\mathrm J_m(kr)r\mathrm dr=0$, 即**不同本征值的本征函数在区间** $[0,a]$ **上以权重** $r$ **正交**.
- $k=k_{mi}$. 此时

$$\int_0^a\mathrm J_m^2(k_{mi}r)r\mathrm dr=-\lim_{k\to k_{mi}}\frac{k_{mi}a}{k_{mi}^2-k^2}\mathrm J_m(ka)\mathrm J_m'(k_{mi}a)=\frac{a^2}2(\mathrm J_m'(k_{mi}a))^2=\color{red}{\frac{a^2}2\left(\mathrm J_m'\left(\mu_i^{(m)}\right)\right)^2}$$ 

### 第二类边界条件

对于第二类齐次边界条件 $\mathrm J_m'(k_{mi}a)=0$, 同样地, 

- 对于 $i\neq j$, 有 $\displaystyle\int_0^a\mathrm J_m(k_{mi}r)\mathrm J_m(kr)r\mathrm dr=0$, 即正交性不发生改变.
- 对于 $k=k_{mi}$, 先得到 $\displaystyle\int_0^a\mathrm J_m^2(k_{mi}r)r\mathrm dr=-\lim_{k\to k_{mi}}\frac{k_{mi}a}{k_{mi}^2-k^2}\mathrm J_m(ka)\mathrm J_m'(k_{mi}a)$, 对 $k_{mi}$ 利用 L'Hôpital 法则, 
  - 分母即 $2k_{mi}$ ;
  - 分子为 $a\mathrm J_m(ka)\left(\mathrm J_m'(k_{mi}a)+ak_{mi}\mathrm J_m^"(k_{mi}a)\right)=a^2\mathrm J_m(ka)\mathrm J_m^"(k_{mi}a)$. (利用第二类边界条件)
- 再代入 Bessel 方程, 得到 $(ka)^2\mathrm J_m^"(ka)=((ka)^2-m^2)\mathrm J_m(ka)$, 从而最终归一化系数为

$$\int_0^a\mathrm J_m^2(k_{mi}r)r\mathrm dr=\color{red}{\left(1-\frac{m^2}{\left(\mu_i^{(m)}\right)^2}\right)\frac{a^2\mathrm J_m^2\left(\mu_i^{(m)}\right)}{2}}$$

> 这个归一化系数**恒为正**.
{: .prompt-tip }

### 第三类边界条件

第三类边界条件下, 归一化系数是前二者的线性组合,

$$\int_0^a\mathrm J_m^2(k_{mi}r)r\mathrm dr=\color{red}{\frac{a^2}{2}\left[\mathrm J_m'^2\left(\mu_i^{(m)}\right)+\left(1-\frac{m^2}{\left(\mu_i^{(m)}\right)^2}\right)\mathrm J_m^2\left(\mu_i^{(m)}\right)\right]}$$ 

具体的边界条件下, 可以进一步化简.


---


## 柱函数, Hankel 函数

所有满足形如 Bessel 函数和 Neumann 函数的递推关系的函数都称为柱函数. 特别地, Bessel 函数称为**第一类柱函数**, Neumann 函数称为**第二类柱函数**. 可以证明, 柱函数一定是 Bessel 方程的解.

我们已经得到了 $\mathrm J_\nu(z)$, $\mathrm N_\nu(z)$ 在无穷远处的渐近展开

$$\mathrm J_\nu(z)\sim\sqrt{\frac 2{\pi z}}\cos\left(z-\frac{\nu\pi}2-\frac\pi4\right)$$ 

$$\mathrm N_\nu(z)\sim\sqrt{\frac 2{\pi z}}\sin\left(z-\frac{\nu\pi}2-\frac\pi4\right)$$ 

它们描绘的柱面波, 既有发散波也有会聚波. 如果处理的问题中只涉及发散波/会聚波, 或者要求明确区分二者, 就应当作线性组合

$$\mathrm H_\nu^{(1)}(z)=\mathrm J_\nu(z)+\mathrm i\mathrm N_\nu(z)\sim\sqrt{\frac{2}{\pi z}}\exp\left[\mathrm i\left(z-\frac{\nu\pi}{2}-\frac\pi4\right)\right]$$ 

$$\mathrm H_\nu^{(2)}(z)=\mathrm J_\nu(z)-\mathrm i\mathrm N_\nu(z)\sim\sqrt{\frac{2}{\pi z}}\exp\left[-\mathrm i\left(z-\frac{\nu\pi}{2}-\frac\pi4\right)\right]$$ 

如果配合上相应的时间因子 $\mathrm e^{-\mathrm i\omega t}$, 则 $\mathrm H_\nu^{(1)}$ 代表发散波, $\mathrm H_\nu^{(2)}$ 代表汇聚波.

$\mathrm H_\nu^{(1)}$ 称为第一类 Hankel 函数, $\mathrm H_\nu^{(2)}$ 称为第二类 Hankel 函数, 它们都是柱函数, 统称为**第三类柱函数**.