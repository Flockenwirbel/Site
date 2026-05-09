---
math: true
title: "虚宗量 Bessel 函数, 半奇数阶 Bessel 函数与球 Bessel 函数"
date: 2025-12-18 01:33:19 +0800
categories: [physics]
tags: [数学物理方法]
---


## 三个方向的本征值的意义

在引入虚宗量 Bessel 函数之前, 笔者认为有必要为自己也为读者进一步解释柱坐标下 Helmholtz 方程分离常数的物理耦合逻辑.

在 Helmholtz 方程 

$$\dfrac{1}{r}\dfrac{\partial}{\partial r}\left(r\dfrac{\partial u}{\partial r}\right)+\dfrac{1}{r^2}\dfrac{\partial^2 u}{\partial\varphi^2}+\dfrac{\partial^2 u}{\partial z^2}+k^2 u=0$$ 

中, 经过两次分离变量, 我们可以得到三个方向的方程:

- 角向方程：$\Phi'' + m^2\Phi = 0\implies$  分离常数为 $m^2$ ;
- 轴向方程：$Z'' + h^2Z = 0\implies$ 分离常数为 $h^2$ ;
- 径向方程：$\displaystyle\frac{\mathrm d^2R}{\mathrm dr^2} + \frac{1}{r}\frac{\mathrm dR}{\mathrm dr} + \left( \underbrace{k^2 - h^2}_{\lambda^2} - \frac{m^2}{r^2} \right) R = 0\implies$ 分离常数为 $\lambda^2$.

我们可以这样理解它们的关系:

- $k^2$ 是总波数的平方, 可以看作系统的总能量值. 它决定了分配的上限.
- $m^2$ 是角向模数, 由于圆柱在角向必须闭合, $m$ 被强制固定为整数. 它不参与总能量的盈亏计算, 但是作为离心项 $\dfrac{m^2}{r^2}$, 它定义了径向解在原点附近的行为, 即决定 Bessel 函数的阶数.
- $h^2$ 是轴向波数, 它由轴向的边界条件确定, 约束更硬、更简单, 从而根据分离变量法的次序, 就先确定本征值, 在能量分配中占据主动地位.
- $\lambda^2$ 则作为径向波数, 是分配的结余, 最终决定了场在径向上的振荡特性.

一般情形下 $h^2 < k^2$, 径向方程的解是普通 Bessel 函数 $\mathrm J_m(\lambda r)$ 和 Neumann 函数 $\mathrm N_m(\lambda r)$, 是否保留 $\mathrm N_m$  取决于 $r=0$ 处的正则性要求或具体的边界条件.

如果物理系统中, $z$ 方向（或时间项）的变动极其剧烈, 以至于消耗掉了所有的本征值能量, 导致径向只能呈现衰减或趋附状态, 就有必要引入虚宗量 Bessel 函数来描述此时径向的行为. 一个典型的例子是 Laplace 方程, 由于 $k=0$, 径向参数 $\lambda^2 = -h^2$ 必定为负, 因此在处理圆柱体内的 Laplace 方程时, 如果 $z$ 方向是正弦振荡的, 那么径向必然是虚宗量的修正 Bessel 函数.

---

## 虚宗量 Bessel 函数

定义 

$$\mathrm I_\nu(x)=\mathrm e^{\mathrm i\pi\nu/2}\mathrm J_\nu(x\mathrm e^{\mathrm i\pi/2})=\sum_{k=0}^\infty\frac{1}{k!\Gamma(k+\nu+1)}\left(\frac x2\right)^{2k+\nu}$$

为第一类虚宗量 Bessel 函数. 相应地, 方程 

$$\dfrac{1}{x}\dfrac{\mathrm d}{\mathrm dx}\left(x\dfrac{\mathrm dy}{\mathrm dx}\right)+\left(-1-\dfrac{\nu^2}{x^2}\right)y=0$$

称为虚宗量 Bessel 方程.

当 $\nu$ 不是整数时, 虚宗量 Bessel 方程的解 $\mathrm I_{\pm \nu}(x)$ 线性无关. 当 $\nu$ 为整数时, 解满足与 Bessel 函数相似的关系: 

$$\mathrm I_{-n}(x)=\mathrm i^n\mathrm J_{-n}(\mathrm ix)=(-\mathrm i)^n\mathrm J_n(\mathrm ix)=\mathrm i^{-n}\mathrm J_n(\mathrm ix)=\mathrm I_{n}(x)$$ 

类似于 Neumann 函数, 我们令 

$$\mathrm K_\nu(x)=\dfrac{\pi}{2\sin\nu\pi}(\mathrm I_{-\nu}(x)-\mathrm I_{\nu}(x))$$

称为 McDonald 函数. 当 $\nu$ 为整数时 $\mathrm K_n(x)$ 仍然有意义, 且与 $\mathrm I_n(x)$ 线性无关, 只需要类似地对 $\nu\to n$ 取极限即可:

$$\begin{align*}
\mathrm K_n(x)&=\lim_{\nu\to n}\frac{\pi}{2\sin\nu\pi}(\mathrm I_{-\nu}-\mathrm I_{\nu}(x))\\
&=\frac12\sum_{k=0}^{n-1}(-1)^k\frac{(n-k-1)!}{k!}\left(\frac x2\right)^{2k-n}\\
&\quad+(-1)^{n+1}\sum_{k=0}^\infty\frac{1}{k!(n+k)!}\left(\ln\frac x2-\frac12\psi(n+k+1)-\frac12\psi(k+1)\right)\left(\frac x2\right)^{2k+n}
\end{align*}$$

这里仍然约定当 $n=0$ 时去掉右端第一项的有限和.

![](https://picx.zhimg.com/v2-1a5cd600d4314f1e8ce08aaf41f1cbd1_1440w.jpg)

![](https://picx.zhimg.com/v2-9be0bb74c66293960a792408e64be049_1440w.jpg)

当 $x\to 0$ 时, $\mathrm I_\nu(x)$ 有界, $\mathrm K_\nu(x)$ 无界. 当 $x\to\infty$ 时, 成立渐近行为 $\mathrm I_\nu(x)\sim\sqrt{\dfrac{1}{2\pi x}}\mathrm e^x$  和 $\mathrm K_\nu(x)\sim\sqrt{\dfrac{\pi}{2x}}\mathrm e^{-x}$. 在实用中, 常常根据这些渐近行为挑选出所需要的解. 例如对于圆柱体内的 Laplace 方程边值问题, 一般解就是

$$u_{mn}(r,\varphi,z)=\sum_{n=1}^\infty\sum_{m=0}^\infty\left[(A_{mn}\cos m\varphi+B_{mn}\sin m\varphi)\mathrm I_m\left(\frac{n\pi}{h}r\right)\sin\frac{n\pi}{h}z\right]$$ 

其中系数的计算方式形如

$$A_{mn}=\frac{1}{\pi(1+\delta_{mn})}\frac 2h\frac{1}{\mathrm I_m\left(\frac{n\pi}{ha}\right)}\int_0^{2\pi}\int_0^hf(\varphi, z)\sin\frac{n\pi}{h}z\cos m\varphi\mathrm dz\mathrm d\varphi$$ 

$$B_{mn}=\frac{1}{\pi}\frac{2}{h}\frac{1}{\mathrm I_m\left(\frac{nh}{\pi a}\right)}\int_0^{2\pi}\int_0^hf(\varphi, z)\sin\frac{n\pi}{h}z\sin m\varphi\mathrm dz\mathrm d\varphi$$ 

> 以上定义的虚宗量 Bessel 函数纯粹是在默认 $x$ 为实数的条件下引入的. 实际上这种限制不是必要的, 我们可以把 $\mathrm I_\nu(x)$ 的定义扩展到带有割线的复平面 $\vert\arg x\vert<\pi$ 上. 相应地, $\mathrm K_\nu(x)$ 的定义也就扩充到了同一区域中.
{:.prompt-info }

---


## 半奇数阶 Bessel 函数

### 引入半奇数阶的动机

在球坐标系中, Helmholtz 方程的径向部分为

$$\dfrac{\mathrm d^2R}{\mathrm dr^2}+\dfrac{2}{r}\dfrac{\mathrm dR}{\mathrm dr}+\left(k^2-\dfrac{l(l+1)}{r^2}\right)R=0$$ 

为了消除一阶导数项, 作变换 $R(r)=\dfrac{v(r)}{\sqrt r}$. 这样一来, 原先的 $l(l+1)$ 项与变换产生的常数项得以合并, 最终化为

$$\dfrac{\mathrm d^2 v}{\mathrm dr^2}+\dfrac{1}{r}\dfrac{\mathrm dv}{\mathrm dr}+\left(k^2-\dfrac{(l+1/2)^2}{r^2}\right)v=0$$ 

所以**三维空间的波动, 本质上是** $l+1/2$ **阶的 Bessel 行为**.

### 初等性质与递推关系

考虑最简单的半奇数阶 Bessel 函数

$$\begin{align*} 
\mathrm J_{1/2}(z)&=\sum_{k=0}^\infty\frac{(-1)^k}{k!\Gamma(k+3/2)}\left(\frac z2\right)^{2k+1/2}\\ 
&=\sqrt{\frac{2}{\pi z}}\sum_{k=0}^\infty\frac{(-1)^k}{(2k+1)!}z^{2k+1}\\ 
&=\color{red}{\sqrt{\frac{2}{\pi z}}\sin z}
\end{align*}$$ 

所以 $\mathrm J_{1/2}(z)$ 是**初等函数**.

> 从物理直觉上看, 三维对称球面上的波动是能量在 $r^2$ 面积上的散开, 如果我们考虑 $u(r)=rR(r)$, 对于 $l=0$ 的情形, $u(r)$ 满足的方程退化为了一维谐振子方程. 因为一维波是初等函数, 而三维径向波只是在一维波的基础上除以了一个 $r$, 所以它必然仍然保持初等函数的特征.
{: .prompt-tip }

将递推关系 $\dfrac{\mathrm d}{\mathrm dz}(z^\nu\mathrm J_\nu(z))=z^\nu\mathrm J_{\nu - 1}(z)$ 改写为 $\left(\dfrac 1z\dfrac{\mathrm d}{\mathrm dz}\right)z^\nu\mathrm J_\nu(z)=z^{\nu -1}\mathrm J_{\nu -1}(z)$, 因此

$$\begin{align*} z^{-1/2}\mathrm J_{-1/2}
&=\left(\frac{1}{z}\frac{\mathrm d}{\mathrm dz}\right)z^{1/2}\mathrm J_{1/2}(z)\\
&=\left(\frac 1z\frac{\mathrm d}{\mathrm dz}\right)\sqrt{\frac 2\pi}\sin z\\
&=\sqrt{\frac 2\pi}\frac{\cos z}z
\end{align*}$$ 

所以 $\mathrm J_{-1/2}=\sqrt{\dfrac{2}{\pi z}}\cos z$ 也是初等函数. 反复利用递推关系, 就能得到

$$z^{-n+1/2}\mathrm J_{-n+1/2}(z)=\left(\dfrac1z\dfrac{\mathrm d}{\mathrm dz}\right)^n\sqrt{\dfrac2\pi}\sin z$$ 

它们全部都是初等函数.

将 Bessel 函数的另一个递推关系 $\dfrac{\mathrm d}{\mathrm dz}(z^{-\nu}\mathrm J_\nu(z))=-z^{-\nu}\mathrm J_{\nu + 1}(z)$ 改写为 $-\left(\dfrac 1z\dfrac{\mathrm d}{\mathrm dz}\right)z^{-\nu}\mathrm J_\nu(z)=z^{-\nu -1}\mathrm J_{\nu + 1}(z)$, 也能得到

$$z^{-n-1/2}\mathrm J_{n+1/2}(z)=\left(-\dfrac1z\dfrac{\mathrm d}{\mathrm dz}\right)^n\sqrt{\dfrac2\pi}\sin z$$ 

它们也都是初等函数.

半奇数阶 Neumann 函数 $\mathrm N_{n+1/2}(z)$ 的定义为

$$\mathrm N_{n+1/2}(z)=\dfrac{\cos(n+1/2)\pi\cdot\mathrm J_{n+1/2}(x)-\mathrm J_{-(n+1/2)}(x)}{\sin(n+1/2)\pi}=(-1)^{n+1}\mathrm J_{-(n+1/2)}(x)$$ 

与 $\mathrm J_{-n-1/2}(z)$ 线性相关.

最简单的情形为 $\mathrm N_{1/2}(z)=\sqrt{\dfrac{2}{\pi z}}\cos z$.


---


## 球 Bessel 函数

既然我们发现 $\mathrm J_{1/2}(z)$ 总是带有一个令人不快的系数 $\sqrt{\dfrac 2{\pi z}}$, 而我们实际上关心的是振幅的演化规律, 我们人为定义一套专门为球坐标设计的**球 Bessel 函数** $\mathrm j_l(z)=\sqrt{\dfrac\pi {2z}}\mathrm J_{l+1/2}(z)$ 和相应的**球 Neumann 函数** $\mathrm n_l(z)=\sqrt{\dfrac\pi {2z}}\mathrm N_{l+1/2}(z)$.

它们的级数形式分别为 

$$\mathrm j_l(z)=\frac{\sqrt \pi}{2}\sum_{n=0}^\infty\frac{(-1)^n}{n!\Gamma(n+l+3/2)}\left(\frac z2\right)^{2n+l}$$

$$\mathrm n_l(z)=(-1)^{l+1}\frac{\sqrt\pi}{2}\sum_{n=0}^\infty\frac{(-1)^n}{n!\Gamma(n-l+1/2)}\left(\frac z2\right)^{2n-l-1}$$

值得注意的是它们的前几项:

$$\mathrm j_0=\dfrac{\sin z}{z},\quad \mathrm j_1(z)=\dfrac{1}{z^2}(\sin z-z\cos z), \quad \mathrm j_2(z)=\dfrac{1}{z^3}[(3-z^2)\sin z-3z\cos z],\quad\dots$$ 

$$\mathrm n_0=-\dfrac{\cos z}{z},\quad\mathrm n_1(z)=-\dfrac{1}{z^2}(\cos z+z\sin z),\quad\mathrm n_2(z)=-\dfrac{1}{z^3}[(3-z^2)\cos z+3z\sin z],\quad\dots$$ 

![](https://pic4.zhimg.com/v2-53d9ad7f352bfebfbf137b1a0529ebf5_r.jpg)

实际上它们是**球 Bessel 方程** 

$$\dfrac{1}{x^2}\dfrac{\mathrm d}{\mathrm dx}\left(x^2\dfrac{\mathrm dy}{\mathrm dx}\right)+\left[1-\dfrac{l(l+1)}{x^2}\right]y(x)=0$$ 

的解. 在 $x\to\infty$ 的极限下, 零点分布趋向于均匀.

### Rayleigh 公式

根据 Bessel 函数的递推关系以及半奇数阶 Bessel 函数的行为, 可以得到如下的 **Rayleigh** 公式:

$$\boxed{\mathrm j_l(z)=z^l\left(-\dfrac 1z\dfrac{\mathrm d}{\mathrm dz}\right)^l\left(\dfrac{\sin z}{z}\right)}$$ 

$$\boxed{\mathrm n_l(z)=-z^l\left(-\dfrac 1z\dfrac{\mathrm d}{\mathrm dz}\right)^l\left(\dfrac{\cos z}{z}\right)}$$ 

它完全避开了级数, 只通过对最基础的球面波进行求导操作, 就能得到任意高阶的解.
