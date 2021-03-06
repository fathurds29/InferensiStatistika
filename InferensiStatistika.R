## Praktikum Statistika Dasar, Senin 15.00-17.00
install.packages('TeachingDemos')



## Penaksiran Selang Kepercayaan Rataan Satu Populasi dengan Variansi Populasi Diketahui

x <- c(10,13,15,16,12,11)  #input data, ganti aja nanti isinya kalau data berubah
xbar <- mean(x)     #mencari mean sampel
n <- length(x)      #menghitung banyak sampel
sigma <- 6          #standar deviasi populasi 
alpha <- 0.05       #kalau mau cari selang kepercayaan 95%, berarti alphanya 1-0.95=0.05

#Perhitungan manual
z.alpha = qnorm(1-alpha/2)
sem     = sigma/sqrt(n)
E       = z.alpha*sem
#Batas Bawah
LB     = xbar - E
#Batas Atas
UB     = xbar + E
#Selang kepercayaan
SKR_1pop_VD      = xbar + c(-E,E)
SKR_1pop_VD      #selang kepercayaan kiri kanannya

#PackageTeachingDemos
library(TeachingDemos)
z.test(x, sd=sigma, conf.level=0.95)  #bisa diganti selang kepercayaannya tergantung yang dicari





## Penaksiran Selang Kepercayaan Rataan Satu Populasi dengan Variansi Populasi Tidak Diketahui

x <- c(10,13,15,16,12,11)
xbar <- mean(x)     #mencari mean sampel
n <- length(x)      #menghitung banyak sampel
S <- sd(x)        #standar deviasi sampel, beda dengan standar deviasi populasi 
alpha <- 0.05       #kalau mau cari selang kepercayaan 95%, berarti alphanya 1-0.95=0.05

#Perhitungan manual
t.alpha = qt(1-alpha/2, df=n-1)
sem     = S/sqrt(n)
E       = t.alpha*sem
#Batas Bawah
LB     = xbar - E
#Batas Atas
UB     = xbar + E
#Selang kepercayaan
SKR_1pop_VTK      = xbar + c(-E,E)
SKR_1pop_VTK      #selang kepercayaan kiri kanannya

#PackageTeachingDemos
library(TeachingDemos)
t.test(x, conf.level=0.95)






## Penaksiran Selang Kepercayaan Rataan Dua Populasi dengan Variansi Populasi Diketahui

x <- c(10,13,15,16,12,11)
y <- c(12,14,15,16,17,8)
xbar <- mean(x)     #mencari mean sampel x
ybar <- mean(y)     #mencari mean sampel x
nx <- length(x)     #menghitung banyak sampel x
ny <- length(y)     #menghitung banyak sampel y
varx <- 2           #variansi populasi x 
vary <- 2           #variansi populasi y
alpha <- 0.05       #kalau mau cari selang kepercayaan 95%, berarti alphanya 1-0.95=0.05

#Perhitungan manual
meansampel = xbar-ybar 
z.alpha = qnorm(1-alpha/2)
sem     = sqrt((varx/nx)+(vary/ny))
E       = z.alpha*sem
#Batas Bawah
LB     = meansampel - E
#Batas Atas
UB     = meansampel + E
#Selang kepercayaan
SKR_2pop_VD      = meansampel + c(-E,E)
SKR_2pop_VD      #selang kepercayaan kiri kanannya







## Penaksiran Selang Kepercayaan Rataan Dua Populasi dengan Variansi Populasi Tidak Diketahui, Dianggap Sama

x <- c(10,13,15,16,12,11)
y <- c(12,14,15,16,17,8)
xbar <- mean(x)     #mencari mean sampel x
ybar <- mean(y)     #mencari mean sampel x
nx <- length(x)     #menghitung banyak sampel x
ny <- length(y)     #menghitung banyak sampel y
varx <- var(x)      #variansi sampel x 
vary <- var(y)      #variansi sampel y
alpha <- 0.05       #kalau mau cari selang kepercayaan 95%, berarti alphanya 1-0.95=0.05

#Perhitungan manual
meansampel = xbar-ybar 
df      = nx+ny-2
t.alpha = qt(1-alpha/2,df)
Sp      = (((nx-1)*varx)+(ny-1)*vary)/(df)
sem     = sqrt((1/nx)+(1/ny))
E       = t.alpha*sem*sqrt(Sp)
#Batas Bawah
LB     = meansampel - E
#Batas Atas
UB     = meansampel + E
#Selang kepercayaan
SKR_2pop_VTK_DS      = meansampel + c(-E,E)
SKR_2pop_VTK_DS      #selang kepercayaan kiri kanannya

#Fungsi gampang
t.test(x,y,alt="two.sided",var.equal = TRUE,conf.level = 0.95)







## Penaksiran Selang Kepercayaan Rataan Dua Populasi dengan Variansi Populasi Tidak Diketahui, Dianggap Beda


x <- c(10,13,15,16,12,11)
y <- c(12,14,15,16,17,8)
xbar <- mean(x)     #mencari mean sampel x
ybar <- mean(y)     #mencari mean sampel x
nx <- length(x)     #menghitung banyak sampel x
ny <- length(y)     #menghitung banyak sampel y
varx <- var(x)      #variansi sampel x 
vary <- var(y)      #variansi sampel y
alpha <- 0.05       #kalau mau cari selang kepercayaan 95%, berarti alphanya 1-0.95=0.05

#Perhitungan manual
meansampel = xbar-ybar 
df      = ((varx/nx)+(vary/ny))^2/(((1/(nx-1))*(varx/nx)^2)+((1/(ny-1))*(vary/ny)^2))
t.alpha = qt(1-alpha/2,df) 
sem     = sqrt((varx/nx)+(vary/ny))
E       = t.alpha*sem
#Batas Bawah
LB     = meansampel - E
#Batas Atas
UB     = meansampel + E
#Selang kepercayaan
SKR_2pop_VTK_DS      = meansampel + c(-E,E)
SKR_2pop_VTK_DS      #selang kepercayaan kiri kanannya

#Fungsi gampang
t.test(x,y,alt="two.sided",conf.level = 0.95)
```






## Penaksiran Selang Kepercayaan Rataan Dua Populasi Data Berpasangan


```{r}
x <- c(10,13,15,16,12,11)
y <- c(12,14,15,16,17,8)
d <- x-y
meansampel <- mean(d)
sd <- sd(d)
n <- length(d)
alpha <- 0.05    #kalau mau cari selang kepercayaan 95%, berarti alphanya 1-0.95=0.05

#Perhitungan manual
t.alpha = qt(1-alpha/2,n-1) 
sem     = sd/sqrt(n)
E       = t.alpha*sem
#Batas Bawah
LB     = meansampel - E
#Batas Atas
UB     = meansampel + E
#Selang kepercayaan
SKR_DP      = meansampel + c(-E,E)
SKR_DP      #selang kepercayaan kiri kanannya

#Fungsi gampang
t.test(x,y,paired=TRUE,conf.level = 0.95)






## Penaksiran Selang Kepercayaan Variansi Satu Populasi

x <- c(10,13,15,16,12,11)
varx <- var(x)
nx <- length(x)
alpha <- 0.05    #kalau mau cari selang kepercayaan 95%, berarti alphanya 1-0.95=0.05

#Perhitungan manual
khi.alpha1 <- qchisq(1-alpha/2,nx-1)
khi.alpha2 <- qchisq(alpha/2,nx-1)
#Batas Bawah
LB     = (nx-1)*varx/khi.alpha1
#Batas Atas
UB     = (nx-1)*varx/khi.alpha2
#Selang kepercayaan
SKR_SP      = c(LB,UB)
SKR_SP      #selang kepercayaan kiri kanannya

#Fungsi gampang
sigma.test(x, sigma=sqrt(var(x)),conf.level = 0.95)



## Penaksiran Selang Kepercayaan Variansi Dua Populasi

x <- c(10,13,15,16,12,11)
y <- c(12,14,15,16,17,8)
varx <- var(x)
vary <- var(y)
nx <- length(x)
ny <- length(y)
alpha <- 0.05    #kalau mau cari selang kepercayaan 95%, berarti alphanya 1-0.95=0.05

#Perhitungan manual
F.alpha1 <- qf(1-alpha/2,nx-1,ny-1)
F.alpha2 <- qf(1-alpha/2,ny-1,nx-1)
E <- var(x)/var(y)
#Batas Bawah
LB     = E/F.alpha1
#Batas Atas
UB     = E*F.alpha2
#Selang kepercayaan
SKR_SP      = c(LB,UB)
SKR_SP      #selang kepercayaan kiri kanannya

#Fungsi gampang
var.test(x,y,conf.level = 0.95)
