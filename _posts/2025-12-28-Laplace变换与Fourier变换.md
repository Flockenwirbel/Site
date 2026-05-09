---
math: true
title: "Laplace 变换与 Fourier 变换"
date: 2025-12-28 12:21:00 +0800
categories: [physics]
tags: [数学物理方法]
---

> **积分变换法**本质上是**分离变量法的一种延伸与演进**.

虽然分离变量法在处理有限区域的问题上非常有效, 但当问题的定义域扩展到半无界或全无界区域时, 边界条件的缺失会导致特征值不再是离散的. 在这种情形下, 级数求和的形式失效了.

而积分变换的作用就在于通过算子变换, 将偏微分方程中的导数运算转化为代数运算, 从而将 PDE 降阶为 ODE 甚至纯代数方程, 利用积分形式代替求和形式, 从而处理无界空间中的波动、扩散等复杂物理过程.


---


## Laplace 变换

### 定义与性质

Laplace 变换是一种积分变换. 对于 $f(t)$, 定义其 **Laplace 换式** $F(p)$ 为

$$\boxed{F(p)=\int_0^\infty\mathrm e^{-pt}f(t)\mathrm dt}$$

其中 $t$ 是实的积分变量, $p\in\mathbb C$, $\mathrm e^{-pt}$ 为 Laplace 变换的核.

给予 Laplace 变换以如下记号:

$$\begin{cases}
F(p)=\mathscr L\{f(t)\}\quad\text{or}\quad F(p)\risingdotseq f(t)\\ 
f(t)=\mathscr L^{-1}\{F(p)\}\quad\text{or}\quad f(t)\fallingdotseq F(p)
\end{cases}$$

$f(t)$ 和 $F(p)$ 有时也称为 Laplace 变换的原函数和像函数. 需要注意的是, $f(t)$ 应当理解为 $f(t)\eta(t)$, 其中

$$\eta(t)=\begin{cases}1,\quad t>0\\0,\quad t<0\end{cases}$$

例如, 函数 $f(t)=1$ 的 Laplace 换式为 

$$\displaystyle 1\fallingdotseq\int_0^\infty\mathrm e^{-pt}\mathrm dt=-\frac{1}{p}\mathrm e^{-pt}\bigg\vert_0^\infty=\frac1p, \quad\Re (p)>0$$

函数 $f(t)=\mathrm e^{\alpha t}$ 的 Laplace 换式为

$$\displaystyle\mathrm e^{\alpha t}\fallingdotseq\int_0^\infty\mathrm e^{-(p-\alpha)t}\mathrm dt=\frac{1}{p-\alpha},\quad \Re (p)>\Re (a)$$ 

从以上两个例子可以看出, 由于 Laplace 变换的核是 $\mathrm e^{-pt}$, 所以对于相当广泛的函数 $f(t)$, 其 Laplace 变换都存在; 甚至对于 $\lim\limits_{t\to\infty}f(t)=\infty$, $f(t)$ 的 Laplace 变换仍然有可能存在. 

> 实际上, 一个函数 Laplace 变换存在的充分条件是
> 
> - 在区间 $0\le t<\infty$ 中除了有限的第一类间断点外连续, 且有连续的导数;
> - 增长不超过指数函数, 即 $\exists M>0,\exists s'\ge 0$ 使得 $\forall t, \vert f(t)\vert<M\mathrm e^{s't}$. 如果这样的 $s'$ 存在, 则一定不唯一, 其下界称为**收敛横标**, 记作 $s_0$.
{: .prompt-tip }

不难得出 Laplace 变换是一个线性变换. 因此我们可以对三角函数按照指数函数展开, 得到 

$$\sin\omega t=\dfrac{\omega}{p^2+\omega^2}, \quad \cos\omega t=\dfrac{p}{p^2+\omega^2}$$

不难得出当 $\Re(p)=s\to+\infty$ 时, $F(p)=0$.

若 $f(t)$ 满足 Laplace 变换存在的充分条件, 且 $f(t)\fallingdotseq F(p)$, 则 $F(p)$ 在 $\Re(p)\ge s_1>s_0$ 的半平面中解析. 这个性质可以用来确定收敛横标 $s_0$.

### 导数的 Laplace 变换

若 $f(t)$, $f'(t)$ 都满足 Laplace 变换存在的充分条件, $f(t)\fallingdotseq F(p)$, 则成立 $\color{red}{f'(t)\fallingdotseq pF(p)-f(0)}$. 这样一来, 原函数 $f(t)$ 的微商转换为了像函数 $F(p)$ 的乘法运算, 而且自动包括了 $f(t)$ 的初值. 类似地, 成立

$$\begin{align*}f''(t)&\fallingdotseq p^2F(p)-pf(0)-f'(0)\\ 
f^{(3)}(t)&\fallingdotseq p^3F(p)-p^2f(0)-pf'(0)-f''(0)\\&\vdots\\
f^{(n)}(t)&\fallingdotseq p^nF(p)-p^{n-1}f(0)-p^{n-2}f'(0)-\cdots-pf^{(n-2)}(0)-f^{(n-1)}(0)
\end{align*}$$

利用导数的变换公式, 还可以得到 $\lim\limits_{p\to+\infty}pF(p)=f(0)$, $\lim\limits_{p\to0}pF(p)=f(\infty)$. 前者一定是正确的, **但是后者在函数 $f$ 的性质不够好时是不一定正确的**.

### 积分的 Laplace 变换

若 $f(t)$ 满足 Laplace 变换存在的充分条件, $f(t)\fallingdotseq F(p)$, 则 

$$\displaystyle \int_0^tf(\tau)\mathrm d\tau\fallingdotseq\dfrac{F(p)}{p}$$ 

并成立有反演:

- 像函数导数的反演 $F^{(n)}(p)\risingdotseq(-t)^nf(t)$. 根据这个反演可以得到 $\dfrac{1}{p^2}=-\dfrac{\mathrm d}{\mathrm dp}\dfrac1p\risingdotseq t$ 等, 且形式为有理函数的像函数总是可以通过部分分式求反演.
- 像函数积分的反演. 如果 $\displaystyle\int_p^\infty F(q)\mathrm dq$ 存在, 且 $t\to 0$ 时 $\vert f(t)/t\vert $ 有界, 则 

$$\int_p^\infty F(q)\mathrm dq\risingdotseq\frac{f(t)}{t}$$ 

> 利用它又可以得到许多函数的 Laplace 变换, 例如 
> 
> $$\dfrac{\sin\omega t}{t}\fallingdotseq\dfrac{\pi}2-\arctan\dfrac p\omega$$
> 
> 进一步地, 若 $p\to 0$ 时公式两端积分都存在, 则 
> 
> $$\int_0^\infty F(p)\mathrm dp=\int_0^\infty\dfrac{f(t)}{t}\mathrm dt$$ 
> 
> 利用这个结果可以计算 $\displaystyle\int_0^\infty\frac{f(t)}t\mathrm dt$ 类型的积分.

### 卷积

设 $F_1(p)\risingdotseq f_1(t)$, $F_2(p)\risingdotseq f_2(t)$, 则 

$$\boxed{F_1(p)F_2(p)\risingdotseq\int_0^tf_1(\tau)f_2(t-\tau)\mathrm d\tau}$$

这是关于 $t$ 的函数, 称为函数 $f_1(t)$ 和 $f_2(t)$ 在区间 $[a,b]$ 上的**卷积**. 它的证明可以使用二重积分交换次序来解决.

> 成立**普遍反演公式**: 若 $F(p)$ 满足
>
> - $F(p)$ 在 $\Re(p)>s_0$ 中解析;
> - 在区域 $\Re(p)>s_0$ 中, 当 $\vert p\vert\to\infty$ 时 $F(p)$ 一致趋于 $0$;
> - 对所有的 $\Re(p)=s>s_0$, 沿着直线 $L:\Re(p)=s$ 的无穷积分 $\displaystyle\int_{s-\mathrm i\infty}^{s+\mathrm i\infty}\vert F(p)\vert\mathrm dp$ 收敛,
>
> 则对于 $\Re(p)=s>s_0$, $F(p)$ 是 
> 
> $$f(t)=\dfrac{1}{2\pi\mathrm i}\int_{s-\mathrm i\infty}^{s+\mathrm i\infty}F(p)\mathrm e^{pt}\mathrm dp$$ 
> 
> 的 Laplace 变换.
> 
> 由普遍反演公式求 Laplace 变换的原函数, 涉及到复平面上的无穷积分, 往往可以用留数定理来计算, 例如 $\dfrac{1}{p+\alpha}$ 的 Laplace 反演为 $\text{Res }\dfrac{\mathrm e^{pt}}{p+\alpha}\Bigg\vert_{p=-\alpha}=\mathrm e^{-\alpha t}$.
{: .prompt-tip }

一般情况下求解 Laplace 变换的原函数是比较困难的. 常用函数的 Laplace 变换有表可查, ~~但是很遗憾的是考试的时候不提供, 笔者也没有足够好的记忆力把它们都记住. 万幸, 松神明确表示了他不会在期末考试中要求我们使用 Laplace 变换.~~ 值得注意的是, 在使用 Laplace 变换表的时候, 一定要注意**不同的 Laplace 变换表可能采用不同的约定**, 例如有些表可能约定 $1$ 的像函数为 $1$. 此时查表结果的所有像函数都差一个因子 $\dfrac 1p$.

![](https://picx.zhimg.com/v2-058b9c8f7634e1801ef8dd5bd487c757_r.jpg)


---


## Fourier 变换

Fourier 变换是 Laplace 变换在复平面上的一个特例.

我们已经知道, 在区间 $[-L/2, L/2]$ 上满足 Dirichlet 条件的函数 $f(x)$ 可以级数展开为

$$ f(x)=\sum_{m=-\infty}^\infty c_m\exp\left(\frac{2\pi\mathrm im}{L}x\right)$$ 

其中系数满足 $\displaystyle c_m=\frac{1}{L}\int_{-L/2}^{L/2}f(x)\exp\left(-\frac{2\pi\mathrm im}{L}x\right)\mathrm dx$. 所以 Fourier 级数实际上是本征值问题 

$$\begin{cases}
X''(x)+\lambda X(x)=0\\ 
X(-L/2)=X(L/2),\quad X'(-L/2)=X'(L/2)
\end{cases}$$ 

的解构成的完备集展开.

令区间长度 $L\to\infty$, 可以得到: 如果**无界区间** $(-\infty,\infty)$ 上的函数 $f(x)$ 在任意有限区间上只有有限个极大极小和有限个第一类间断点, 且积分 $\displaystyle\int_{-\infty}^\infty f(x)\mathrm dx$ 绝对收敛, 则存在 **Fourier 变换及反演**

$$F(k)=\mathscr F[f(x)]\equiv\frac{1}{\sqrt{2\pi}}\int_{-\infty}^\infty f(x)\mathrm e^{-\mathrm ikx}\mathrm dx$$ 

$$f(x)=\mathscr F^{-1}[F(k)]\equiv\frac{1}{\sqrt{2\pi}}\int_{-\infty}^\infty F(k)\mathrm e^{\mathrm ikx}\mathrm dk$$ 

此处引入 $\dfrac{1}{\sqrt{2\pi}}$ 的目的是得到更加美观的物理形式.

应用 Fourier 变换的方法, 只能来求解无界区域的定解问题, 不适用于初值问题. 另外, 它对函数性质的要求比 Laplace 变换更为严格, 至少要求函数是模方可积的.


---


## Laplace 变换和 Fourier 变换在偏微分方程定解问题中的应用

### 受迫振动

> $$\begin{cases}y^"(t)+\omega^2y(t)=g(t),\\ y(0)=0,\quad y'(0)=0.\end{cases}$$ 

作 Laplace 变换, 根据边界条件得到 $y'(t)\fallingdotseq Y(p)$, $y''(t)\fallingdotseq p^2Y(p)$, 再令 $g(t)\fallingdotseq G(p)$, 原定解问题变为 $p^2Y(p)+\omega^2 Y(p)=G(p)$. 这是一个纯代数方程, 不难得到 

$$Y(p)=\dfrac{G(p)}{p^2+\omega^2}$$

我们又已经知道了 $\sin(\omega t)\fallingdotseq\dfrac{\omega}{p^2+\omega^2}$, 利用卷积定理, 有

$$y(t)=\dfrac{1}{\omega}\int_0^t\sin[\omega(t-\tau)]g(\tau)\mathrm d\tau$$

### 无界杆的热传导

> 求解 $$\begin{cases}\dfrac{\partial u}{\partial t}-\kappa\dfrac{\partial^2 u}{\partial x^2}=f(x,t),&-\infty<x<\infty,\quad t>0,\\ u\vert_{t=0}=0,&-\infty<x<\infty.\end{cases}$$ 

**解法 1: 作 Laplace 变换.**

令  

$$u(x,t)\fallingdotseq U(x,p)=\int_0^\infty u(x,t)\mathrm e^{-pt}\mathrm dt$$ 

利用初始条件有 

$$\dfrac{\partial u}{\partial t}\fallingdotseq pU(x,p)$$

把变换后的像函数看成仅为 $x$ 的函数, 所以 

$$\dfrac{\partial^2 u}{\partial x^2}\fallingdotseq\dfrac{\mathrm d^2U(x,p)}{\mathrm dx^2}$$

再进一步令 $f(x,t)\fallingdotseq F(x,p)$, 这样定解问题就变为

$$\dfrac{\mathrm d^2U(x,p)}{\mathrm dx^2}-\dfrac{p}{\kappa}U(x,p)=-\dfrac{F(x,p)}{\kappa}$$ 

对应齐次方程的通解为 $c_1\exp\left(\sqrt{\dfrac p\kappa}x\right)+c_2\exp\left(-\sqrt{\dfrac p\kappa}x\right)$. 根据常数变易法, 特解应当满足

$$\begin{cases} 
C_1'(x)\exp\left(\sqrt{\dfrac p\kappa}x\right)+C_2'(x)\exp\left(-\sqrt{\dfrac p\kappa}x\right)=0\\ 
C_1'(x)\exp\left(\sqrt{\dfrac p\kappa}x\right)-C_2'(x)\exp\left(-\sqrt{\dfrac p\kappa}x\right)=-\dfrac{F(x,p)}{\sqrt{\kappa p}} 
\end{cases}$$ 

解得 

$$\begin{cases} 
C_1'(x)=-\dfrac12\dfrac{F(x,p)}{\sqrt{\kappa p}}\exp\left(-\sqrt{\dfrac p\kappa}x\right)\\ 
C_2'(x)=\dfrac12\dfrac{F(x,p)}{\sqrt{\kappa p}}\exp\left(\sqrt{\dfrac p\kappa}x\right) 
\end{cases}$$ 

原方程的通解形如

$$\dfrac{1}{2\sqrt{\kappa p}}\left[\int F(x',p)\exp\left(\sqrt{\dfrac p\kappa}(x'-x)\right)\mathrm dx'-\int F(x',p)\exp\left(\sqrt{\dfrac p\kappa}(x-x')\right)\mathrm dx'\right]$$ 

考虑到无穷远处的有界条件 $u\vert_{x\to\pm\infty}=0$, 应当取以下积分限 

$$U(x,p)=\dfrac{1}{2\sqrt{\kappa p}}\left[\int_{-\infty}^x F(x',p)\exp\left(\sqrt{\dfrac p\kappa}(x'-x)\right)\mathrm dx'-\int_\infty^x F(x',p)\exp\left(\sqrt{\dfrac p\kappa}(x-x')\right)\mathrm dx'\right]$$ 

合并积分限并统一指数形式, 得

$$U(x,p)=\dfrac{1}{2\sqrt{\kappa p}}\int_{-\infty}^\infty F(x',p)\exp\left(-\sqrt{\dfrac p\kappa}\vert x-x'\vert\right)\mathrm dx$$ 

根据 Laplace 变换的反演公式 $\dfrac{1}{\sqrt p}\mathrm e^{-\alpha\sqrt p}\risingdotseq\dfrac{1}{\sqrt{\pi t}}\exp\left(-\dfrac{\alpha^2}{4t}\right)$, 再由卷积定理得到

$$u(x,t)=\dfrac{1}{2\sqrt{\kappa\pi}}\int_{-\infty}^\infty\mathrm dx'\int_0^t\exp\left(-\dfrac{(x-x')^2}{4\kappa(t-\tau)}\right)\dfrac{f(x',\tau)}{\sqrt{t-\tau}}\mathrm d\tau$$

**解法 2: 作 Fourier 变换.**

假设 $u(x,t)$ 和 $f(x,t)$ 的 Fourier 变换存在, 令 

$$\displaystyle U(k,t)=\frac{1}{\sqrt{2\pi}}\int_{-\infty}^\infty u(x,t)\mathrm e^{\mathrm ikx}\mathrm dx, \quad F(k,t)=\frac{1}{\sqrt{2\pi}}\int_{-\infty}^\infty f(x,t)\mathrm e^{\mathrm ikx}\mathrm dx$$

定解问题就变为 

$$\dfrac{\mathrm dU}{\mathrm dt}+\kappa k^2U(k,t)=F(k,t)$$

初始条件 $U(k,t)\vert_{t=0}=0$. 用常数变易法求解, 可以得到

$$U(k,t)=\mathrm e^{-\kappa k^2t}\int_0^tF(k,\tau)\mathrm e^{\kappa k^2\tau}\mathrm d\tau$$ 

再求反演, 

$$\begin{align*}
u(x,t)&=\frac{1}{\sqrt{2\pi}}\int_{-\infty}^\infty U(k,t)\mathrm e^{\mathrm ikx}\mathrm dk\\ 
&=\int_0^t\left[\frac{1}{\sqrt{2\pi}}\int_{-\infty}^\infty F(k,\tau)\mathrm e^{-\kappa k^2(t-\tau)}\mathrm e^{\mathrm ikx}\mathrm dk\right]\mathrm d\tau
\end{align*}$$ 

利用 

$$\displaystyle\int_{-\infty}^\infty\mathrm e^{-\alpha x^2+\mathrm i\beta x}\mathrm dx=\sqrt{\frac\pi\alpha}\mathrm e^{-\beta^2/4a},\quad\Re(\alpha)>0$$

可以得到

$$\frac{1}{\sqrt{2\pi}}\int_{-\infty}^\infty\mathrm e^{-\kappa k^2(t-\tau)}\mathrm e^{\mathrm ikx}\mathrm dk=\frac{1}{\sqrt{2\kappa(t-\tau)}}\exp\left(-\frac{x^2}{4\kappa(t-\tau)}\right)$$ 

根据 Fourier 变换的卷积公式, 

$$\begin{align*} 
u(x,t)&=\int_0^t\left[\frac{1}{\sqrt{2\pi}}\int_{-\infty}^\infty\frac{f(\xi,\tau)}{\sqrt{2\kappa(t-\tau)}}\exp\left(-\frac{(x-\xi)^2}{4\kappa(t-\tau)}\right)\mathrm d\xi\right]\mathrm d\tau\\ 
&=\frac{1}{2\sqrt{\kappa\pi}}\int_0^t\left[\int_{-\infty}^\infty f(\xi,\tau)\exp\left(-\frac{(x-\xi)^2}{4\kappa(t-\tau)}\right)\mathrm d\xi\right]\frac{\mathrm d\tau}{\sqrt{t-\tau}}. 
\end{align*}$$ 

### 无界弦的波动

> $$\begin{cases}\dfrac{\partial^2 u}{\partial t^2}-a^2\dfrac{\partial^2 u}{\partial x^2}=0,&-\infty<x<\infty,\;t>0,\\ u\vert_{t=0}=\varphi(x),\quad\dfrac{\partial u}{\partial t}\biggl|_{t=0}=\psi(x),&-\infty<x<\infty.\end{cases}$$ 

**解法1: Laplace 变换.**

令 $u(x,t)\fallingdotseq U(x,p)$, 原来的定解问题就化为

$$p^2U(x,p)-a^2\dfrac{\mathrm d^2U(x,p)}{\mathrm dx^2}=p\varphi(x)+\psi(x)$$ 

可以求得方程的解

$$\begin{align*}
U(x,p)&=\frac{1}{2ap}\int_{-\infty}^\infty[p\varphi(x')+\psi(x')]\exp\left(-\frac pa|x-x'|\right)\mathrm dx'\\ 
&=\frac{1}{2a}\int_{-\infty}^\infty\left[\varphi(x')+\frac{\psi(x')}{p}\right]\exp\left(-\frac{p}{a}|x-x'|\right)\mathrm dx' 
\end{align*}$$ 

根据反演变换 $\mathrm e^{-\alpha p}\risingdotseq\delta(t-\alpha)$ 和 $\dfrac1p\mathrm e^{-\alpha p}\risingdotseq\eta(t-\alpha)$, 原方程的解为

$$u(x,t)=\dfrac{1}{2}\int_{-\infty}^\infty\varphi(x')\delta(at-|x-x'|)\mathrm dx'+\dfrac{1}{2a}\int_{-\infty}^\infty\psi(x')\eta(at-\vert x-x'\vert)\mathrm dx'$$ 

根据我们之前讨论过的 $\delta$ 函数和 $\eta$ 函数的性质, 可以得到

$$u(x,t)=\frac{1}{2}[\varphi(x-at)+\varphi(x+at)]+\frac{1}{2a}\int_{x-at}^{x+at}\psi(x')\mathrm dx'$$

**解法2: Fourier 变换.**

设 $u(x,t), \varphi(x),\psi(x)$ 的 Fourier 变换都存在, 即 

$$U(k,t)=\frac{1}{\sqrt{2\pi}}\int_{-\infty}^\infty u(x,t)\mathrm e^{-\mathrm ikx}\mathrm dx$$

$$\varPhi(k)=\frac{1}{\sqrt{2\pi}}\int_{-\infty}^\infty \varphi(x)\mathrm e^{-\mathrm ikx}\mathrm dx$$,

$$\Psi(k)=\frac{1}{\sqrt{2\pi}}\int_{-\infty}^\infty \psi(x)\mathrm e^{-\mathrm ikx}\mathrm dx$$

作 Fourier 变换后, 定解问题变为

$$\begin{cases}
\dfrac{\mathrm d^2 U(k,t)}{\mathrm dt^2}+k^2a^2U(k,t)=0\\ 
U(k,t)\vert_{t=0}=\varPhi(k),\quad \dfrac{\partial U(k,t)}{\partial t}\bigg\vert_{t=0}=\Psi(k)
\end{cases}$$ 

容易解得 

$$U(k,t)=\varPhi(k)\cos kat+\Psi(k)\dfrac{\sin kat}{ka}$$ 

再通过 Fourier 变换反演,

$$\begin{align*}
&\frac{1}{\sqrt{2\pi}}\int_{-\infty}^\infty\varPhi(k)\cos kat \\
=&\frac{1}{\sqrt{2\pi}}\int_{-\infty}^\infty\left[\frac{(\mathrm e^{\mathrm ik(x+at)}+\mathrm e^{\mathrm ik(x-at)})\varPhi(k)}{2}\right]\\
=&\frac12[\varphi(x+at)+\varphi(x-at)], 
\end{align*}$$ 

$$\begin{align*} 
&\frac{1}{\sqrt{2\pi}}\int_{-\infty}^\infty\Psi(k)\frac{\sin kat}{ka}\mathrm e^{\mathrm ikx}\mathrm dk\\
=&\int_{-\infty}^x\left(\frac{1}{\sqrt{2\pi}}\int_{-\infty}^\infty\Psi(k)\frac{\mathrm i\sin kat}{a}\mathrm e^{\mathrm ik\xi}\mathrm dk\right)\mathrm d\xi\\ 
=&\frac{1}{2a}\int_{-\infty}^x [\psi(\xi+at)-\psi(x-at)]\mathrm d\xi\\ 
=&\frac{1}{2a}\int_{x-at}^{x+at}\psi(\xi)\mathrm d\xi 
\end{align*}$$ 

所以 

$$\displaystyle u(x,t)=\frac{1}{2}[\varphi(x+at)-\varphi(x-at)]+\frac{1}{2a}\int_{x-at}^{x+at}\psi(\xi)\mathrm d\xi$$

### 高维情形

积分变换方法同样适合高维的无界问题. 所谓三维 Fourier 变换, 即 $\displaystyle F(\boldsymbol k)=\frac{1}{(2\pi)^{3/2}}\iiint f(\boldsymbol r)\mathrm e^{-\mathrm i\boldsymbol k\cdot\boldsymbol r}\mathrm d^3r$. 值得注意的是, 偶数维问题利用 Fourier 变换都会遇到求逆变换时的困难. 例如利用二维 Fourier 变换求解, 在作逆变换时需要用到 Bessel 函数 $\mathrm J_0$ 的积分表示, 把积分化成关于 Bessel 函数的积分. 

~~同样幸运的是, 松神表示考察重点在一维的 Fourier 变换, 因此笔者可以愉快地摸鱼了.~~